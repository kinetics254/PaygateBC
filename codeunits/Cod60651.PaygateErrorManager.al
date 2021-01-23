codeunit 60651 "Paygate Error Manager"
{
    TableNo = "Paygate Buffer";

    trigger OnRun()
    begin
        PaygateBuffer := Rec;
        ClearVars(PaygateBuffer);
        CheckForMandatory(PaygateBuffer);

        //check if the dates of payment are current

        //check payment method aspects

        //check the source document exists unless it is a bulk payment

        //Check if amounts tally with source document unless it is a bulk payment

        if ERROREXISTS then begin
            //    CreateErrorEntry(Rec);
        end;
        PaygateBuffer.CalcFields(Errors);
        PaygateBuffer."Has Errors" := PaygateBuffer.Errors > 0;
        PaygateBuffer.Validated := not PaygateBuffer."Has Errors";
        if PaygateBuffer.Validated then
            PaygateBuffer."Validated DateTime" := CurrentDateTime;
        PaygateBuffer.Modify(true);
    end;

    local procedure CheckForMandatory(var CurrEntry: Record "Paygate Buffer")
    var
        PaymentMethod: Record "Payment Method";
    begin
        if (CurrEntry."Transaction Code" = '') or (CurrEntry."Transaction Code" = '0') then
            CreateErrorEntry(CurrEntry, 'MISSTRANSCODE', 'Missing Transaction Code');
        if (CurrEntry."Payment Mode" = '') or not (PaymentMethod.Get(CurrEntry."Payment Mode")) then
            CreateErrorEntry(CurrEntry, 'MISSINPAYMETH', 'Missing Payment method or Payment Method not set');
        if CurrEntry."Transaction DateTime" = 0DT then
            CreateErrorEntry(CurrEntry, 'MISSINTRANSDATE', 'Missing Transaction Date');
        if CurrEntry.Amount = 0 then
            CreateErrorEntry(CurrEntry, 'ZEROAMT', 'Zero Amount');
        if CurrEntry."Source Document No." = '' then
            CreateErrorEntry(CurrEntry, 'MISSINDOCNO', 'Missing Source Document No.');
        if CurrEntry."Payer ID" = '' then
            CreateErrorEntry(CurrEntry, 'MISSPAYERID', 'Missing payer id');
        if CurrEntry."Customer No." = '' then
            CreateErrorEntry(CurrEntry, 'MISSCUSTNO', 'Missing Customer No.');

    end;

    procedure ClearVars(CurrEntry: Record "Paygate Buffer")
    begin
        ERROREXISTS := false;

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

    var
        ERROREXISTS: Boolean;
        ERRORCODE: Code[20];
        ERRORTXT: Text[250];
        ERRORRECS: Record "Paygate Error Entry";

        CLE: Record "Cust. Ledger Entry";
        CustApply: Codeunit "CustEntry-Apply Posted Entries";
        PaygateBuffer: Record "Paygate Buffer";
}

