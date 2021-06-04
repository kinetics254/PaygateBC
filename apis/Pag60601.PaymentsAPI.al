page 60601 "PaymentsAPI"
{

    APIGroup = 'PayGate';
    APIPublisher = 'KineticTechnology';
    APIVersion = 'v1.0';
    Caption = 'paymentsAPI';
    DelayedInsert = true;
    EntityName = 'payments';
    EntitySetName = 'payments';
    PageType = API;
    SourceTable = "Paygate Buffer";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(transactionCode; Rec."Transaction Code")
                {
                    ApplicationArea = All;
                    Caption = 'transactionCode', Locked = true;
                }
                field(transactionDate; Rec."Transaction DateTime")
                {
                    ApplicationArea = All;
                    Caption = 'transactionDate', Locked = true;
                }
                field(payerID; Rec."Payer ID")
                {
                    ApplicationArea = All;
                    Caption = 'payerID', Locked = true;
                }
                field(amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    Caption = 'amount', Locked = true;
                }
                field(description; Rec.Description)
                {
                    ApplicationArea = All;
                    Caption = 'description', Locked = true;
                }
                field(paymentMode; Rec."Payment Mode")
                {
                    ApplicationArea = All;
                    Caption = 'paymentMode', Locked = true;
                }
                field(payerNames; Rec."Payer Names")
                {
                    ApplicationArea = All;
                    Caption = 'payerNames', Locked = true;
                }
                field(dateTimeCreated; Rec."DateTime Created")
                {
                    ApplicationArea = All;
                    Caption = 'dateTimeCreated', Locked = true;
                }
                field(processedDateTime; Rec."Processed DateTime")
                {
                    ApplicationArea = All;
                    Caption = 'processedDateTime', Locked = true;
                }
                field(status; Rec.Status)
                {
                    ApplicationArea = All;
                    Caption = 'status', Locked = true;
                }
                field(sourceDocumentNo; Rec."Source Document No.")
                {
                    ApplicationArea = All;
                    Caption = 'sourceDocumentNo', Locked = true;
                }
                field(sourceDocumentType; Rec."Source Document Type")
                {
                    ApplicationArea = All;
                    Caption = 'sourceDocumentType', Locked = true;
                }
                field(customerNo; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    Caption = 'customerNo', Locked = true;
                }
                field(entryNo; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    Caption = 'entryNo', Locked = true;
                }
                field(accountNo; Rec."Account No.")
                {
                    ApplicationArea = All;
                    Caption = 'accountNo', Locked = true;
                }
                field(providerID; "Provider ID")
                {
                    ApplicationArea = All;
                    Caption = 'providerID', Locked = true;
                }
                field(promiseToPay; "Promise to Pay")
                {
                    ApplicationArea = All;
                    Caption = 'promiseToPay', Locked = true;
                }
                field(isCreditPayment; Rec."Credit Payment")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'isCreditPayment', Locked = true;
                }
                field(creditReferenceNo; "Credit Reference No")
                {
                    ApplicationArea = All;
                    Caption = 'creditReferenceNo', Locked = true;
                }
                field(isOverpaymentApplication; "Is Overpayment Application")
                {
                    ApplicationArea = All;
                    Caption = 'isOverpaymentApplication', Locked = true;
                }
                field(overpaymentApplicationNo; "Overpayment Application No")
                {
                    ApplicationArea = All;
                    Caption = 'overpaymentApplicationNo', Locked = true;
                }
                field(base64Attachment; base64Attachment)
                {
                    ApplicationArea = All;
                    Caption = 'base64Attachment';
                    trigger OnValidate()
                    begin
                        processAttachment();
                    end;
                }
            }
        }
    }
    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Manual Insert" := false;
    end;

    local procedure processAttachment()

    begin
        if base64Attachment = '' then
            exit;
        Clear(Outstream);
        Clear(Instream);
        Clear(TempBlob);
        TempBlob.CreateOutStream(Outstream);
        Base64Mgt.FromBase64(base64Attachment, Outstream);
        TempBlob.CreateInStream(Instream);
        Rec.Attachment.ImportStream(Instream, 'Photo');
    end;

    var
        base64Attachment: Text;
        Outstream: OutStream;
        Instream: InStream;
        TempBlob: Codeunit "Temp Blob";
        Base64Mgt: Codeunit "Base64 Convert";
}
