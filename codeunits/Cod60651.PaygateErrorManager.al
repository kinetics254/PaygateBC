codeunit 60651 "Paygate Error Manager"
{
    TableNo = "Paygate Buffer";

    var
        ERROREXISTS: Boolean;
        ERRORCODE: Code[20];
        ERRORTXT: Text[250];
        ERRORRECS: Record "Paygate Error Entry";
        CLE: Record "Cust. Ledger Entry";
        CustApply: Codeunit "CustEntry-Apply Posted Entries";
        PaygateBuffer: Record "Paygate Buffer";
        IsHandled: Boolean;

    trigger OnRun()
    begin
        PaygateBuffer := Rec;
        ClearVars(PaygateBuffer);
        OnBeforeCheckForMandatory(PaygateBuffer);
        CheckForMandatory(PaygateBuffer);
        //check if the dates of payment are current
        //check payment method aspects
        OnBeforeCheckSourceDocumentExists(PaygateBuffer, IsHandled);
        //check the source document exists unless it is a bulk payment
        CheckSourceDocumentExist(PaygateBuffer, IsHandled);
        OnAfterCheckSourceDocumentExists(PaygateBuffer);
        IsHandled := false;
        OnBeforeCheckSourceAmountTally(PaygateBuffer, IsHandled);
        CheckSourceAmountTally(PaygateBuffer, IsHandled);
        OnAfterCheckSourceAmountTally(PaygateBuffer);
        //Check if amounts tally with source document unless it is a bulk payment
        //if ERROREXISTS then begin
        //    CreateErrorEntry(Rec);
        //end;
        UpdateBufferRecord(PaygateBuffer);
        OnAfterValidatePayment(PaygateBuffer);
    end;

    local procedure UpdateBufferRecord(var CurrEntry: Record "Paygate Buffer")

    begin
        CurrEntry."Original Amount" := CurrEntry.Amount;
        CurrEntry.CalcFields(Errors);
        CurrEntry."Has Errors" := CurrEntry.Errors > 0;
        CurrEntry.Validated := not CurrEntry."Has Errors";
        if CurrEntry.Validated then
            CurrEntry."Validated DateTime" := CurrentDateTime;
        if CurrEntry.Modify(true) then;
    end;

    local procedure CheckSourceDocumentExist(CurrEntry: Record "Paygate Buffer"; Ishadled: Boolean)
    var
        SalesHeader: Record "Sales Header";
        PostedSalesInv: Record "Sales Invoice Header";
    begin
        if Ishadled then
            exit;
        case CurrEntry."Source Document Type" of
            CurrEntry."Source Document Type"::Invoices:
                if not SalesHeader.Get(SalesHeader."Document Type"::Invoice, PaygateBuffer."Source Document No.")
                    and
                    not PostedSalesInv.Get(PaygateBuffer."Source Document No.")
                then
                    CreateErrorEntry(CurrEntry, 'MISSSOURCDOC', 'Source Document is Missing');
            CurrEntry."Source Document Type"::Orders:
                if not SalesHeader.Get(SalesHeader."Document Type"::Order, PaygateBuffer."Source Document No.") then
                    CreateErrorEntry(CurrEntry, 'MISSSOURCDOC', 'Source Document is Missing');
            CurrEntry."Source Document Type"::Quote:
                if not SalesHeader.Get(SalesHeader."Document Type"::Quote, PaygateBuffer."Source Document No.") then
                    CreateErrorEntry(CurrEntry, 'MISSSOURCDOC', 'Source Document is Missing');
        end;
    end;

    local procedure CheckSourceAmountTally(CurrEntry: Record "Paygate Buffer"; Ishadled: Boolean)
    var
        SalesHeader: Record "Sales Header";
    begin
        if Ishadled then
            exit;
        if CurrEntry."Bulk Payment" then
            exit;
        case CurrEntry."Source Document Type" of
            CurrEntry."Source Document Type"::Invoices:
                if SalesHeader.Get(SalesHeader."Document Type"::Invoice, PaygateBuffer."Source Document No.") then begin
                    SalesHeader.CalcFields("Amount Including VAT");
                    if (PaygateBuffer.Amount - SalesHeader."Amount Including VAT") > 1 then
                        CreateErrorEntry(CurrEntry, 'MISSAMT', 'Miss-Match of source amt vs amount paid');
                end;

            CurrEntry."Source Document Type"::Orders:
                if SalesHeader.Get(SalesHeader."Document Type"::Order, PaygateBuffer."Source Document No.") then begin
                    SalesHeader.CalcFields("Amount Including VAT");
                    if (PaygateBuffer.Amount - SalesHeader."Amount Including VAT") > 1 then
                        CreateErrorEntry(CurrEntry, 'MISSAMT', 'Miss-Match of source amt vs amount paid');
                end;

            CurrEntry."Source Document Type"::Quote:
                if SalesHeader.Get(SalesHeader."Document Type"::Quote, PaygateBuffer."Source Document No.") then begin
                    SalesHeader.CalcFields("Amount Including VAT");
                    if (PaygateBuffer.Amount - SalesHeader."Amount Including VAT") > 1 then
                        CreateErrorEntry(CurrEntry, 'MISSAMT', 'Miss-Match of source amt vs amount paid');
                end;
        end;
    end;

    local procedure CheckForMandatory(CurrEntry: Record "Paygate Buffer")
    var
        PaymentMethod: Record "Payment Method";
        Customer: Record Customer;
    begin
        if (CurrEntry."Transaction Code" = '') or (CurrEntry."Transaction Code" = '0') then
            CreateErrorEntry(CurrEntry, 'MISSTRANSCODE', 'Missing Transaction Code');
        if (CurrEntry."Payment Mode" = '') or not (PaymentMethod.Get(CurrEntry."Payment Mode")) then
            CreateErrorEntry(CurrEntry, 'MISSINPAYMETH', 'Missing Payment method or Payment Method not set');
        if PaymentMethod.Get(CurrEntry."Payment Mode") then begin
            if not (PaymentMethod."Bal. Account Type" in [PaymentMethod."Bal. Account Type"::"Bank Account"]) then
                CreateErrorEntry(CurrEntry, 'MISSINPAYMETHSET', 'Payment method Bal Acc Not Setup');
            if PaymentMethod."Bal. Account No." = '' then
                CreateErrorEntry(CurrEntry, 'PAYMETHMISSBAL', 'Payment Method Missing Balacing Acc No.s');
        end;

        if CurrEntry."Transaction DateTime" = 0DT then
            CreateErrorEntry(CurrEntry, 'MISSINTRANSDATE', 'Missing Transaction Date');
        if CurrEntry.Amount = 0 then
            CreateErrorEntry(CurrEntry, 'ZEROAMT', 'Zero Amount');
        if CurrEntry."Source Document No." = '' then
            CreateErrorEntry(CurrEntry, 'MISSINDOCNO', 'Missing Source Document No.');
        if (CurrEntry."Customer No." = '') or not (Customer.Get(CurrEntry."Customer No.")) then
            CreateErrorEntry(CurrEntry, 'MISSCUSTNO', 'Missing Customer No.');

    end;

    procedure ClearVars(CurrEntry: Record "Paygate Buffer")
    begin
        ERROREXISTS := false;
        IsHandled := false;
        ERRORRECS.RESET;
        ERRORRECS.SETFILTER("Source Entry No.", '%1', CurrEntry."Entry No.");
        IF ERRORRECS.FINDSET THEN
            ERRORRECS.DELETEALL;
    end;

    procedure CreateErrorEntry(CurrEntry: Record "Paygate Buffer"; ErrorCode: Code[20]; ErrorDescription: Text[250])
    var
        PayGateError: Record "Paygate Error Entry";
    begin
        PayGateError.Init();
        PayGateError."Entry No." := 0;
        PayGateError."Source Entry No." := CurrEntry."Entry No.";
        PayGateError."Source Transaction ID" := CurrEntry."Transaction Code";
        PayGateError."Error Code" := ErrorCode;
        PayGateError.Description := ErrorDescription;
        PayGateError.Insert(true);
    end;

    [IntegrationEvent(true, false)]
    procedure OnBeforeCheckSourceDocumentExists(var PayGateEntry: Record "Paygate Buffer"; var Ishandled: Boolean)

    begin

    end;

    [IntegrationEvent(true, false)]
    procedure OnBeforeCheckForMandatory(var PaygateBuffer: Record "Paygate Buffer")

    begin

    end;

    [IntegrationEvent(true, false)]
    procedure OnAfterCheckSourceDocumentExists(var PayGateEntry: Record "Paygate Buffer")

    begin

    end;

    [IntegrationEvent(true, false)]
    procedure OnBeforeCheckSourceAmountTally(var PayGateEntry: Record "Paygate Buffer"; var Ishandled: Boolean)

    begin

    end;

    [IntegrationEvent(true, false)]
    procedure OnAfterCheckSourceAmountTally(var PayGateEntry: Record "Paygate Buffer")

    begin

    end;

    [IntegrationEvent(true, false)]
    procedure OnAfterValidatePayment(var PayGateEntry: Record "Paygate Buffer")

    begin

    end;
}

