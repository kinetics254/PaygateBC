page 60604 "Failed Paygate API"
{

    APIGroup = 'PayGate';
    APIPublisher = 'KineticTechnology';
    APIVersion = 'v1.0';
    Caption = 'failedPaygateAPI';
    DelayedInsert = true;
    EntityName = 'failedPaymentAPI';
    EntitySetName = 'failedPaymentAPI';
    PageType = API;
    SourceTable = "Failed Paygate Buffer";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(entryNo; Rec."Entry No.")
                {
                    Caption = 'entryNo', Locked = true;
                }
                field(payerID; Rec."Payer ID")
                {
                    Caption = 'payerID', Locked = true;
                }
                field(payerNames; Rec."Payer Names")
                {
                    Caption = 'payerNames', Locked = true;
                }
                field(customerNo; Rec."Customer No.")
                {
                    Caption = 'customerNo', Locked = true;
                }
                field(accountNo; Rec."Account No.")
                {
                    Caption = 'accountNo', Locked = true;
                }
                field(amount; Rec.Amount)
                {
                    Caption = 'amount', Locked = true;
                }
                field(bulkPayment; Rec."Bulk Payment")
                {
                    Caption = 'bulkPayment', Locked = true;
                }
                field(description; Rec.Description)
                {
                    Caption = 'description', Locked = true;
                }
                field(paymentMode; Rec."Payment Mode")
                {
                    Caption = 'paymentMode', Locked = true;
                }
                field(transactionCode; Rec."Transaction Code")
                {
                    Caption = 'transactionCode', Locked = true;
                }
                field(transactionDateTime; Rec."Transaction DateTime")
                {
                    Caption = 'transactionDateTime', Locked = true;
                }
                field(status; Rec.Status)
                {
                    Caption = 'status', Locked = true;
                }
                field(sourceDocumentNo; Rec."Source Document No.")
                {
                    Caption = 'sourceDocumentNo', Locked = true;
                }
                field(sourceDocumentType; Rec."Source Document Type")
                {
                    Caption = 'sourceDocumentType', Locked = true;
                }
                field(createdTime; Rec."Created Time")
                {
                    Caption = 'createdTime', Locked = true;
                }
                field(providerID; "Provider ID")
                {
                    ApplicationArea = All;
                    Caption = 'providerID', Locked = true;
                }
            }
        }
    }

}
