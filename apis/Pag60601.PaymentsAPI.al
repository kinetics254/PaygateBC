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
            }
        }
    }
    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Manual Insert" := false;
    end;
}
