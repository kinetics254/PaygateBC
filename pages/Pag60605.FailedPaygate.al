page 60605 "Failed Paygate"
{

    ApplicationArea = Basic, Suite;
    Caption = 'Failed Paygate';
    PageType = List;
    SourceTable = "Failed Paygate Buffer";
    UsageCategory = Administration;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No. field';
                    ApplicationArea = Basic, Suite;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field';
                    ApplicationArea = Basic, Suite;
                }
                field("Payer ID"; Rec."Payer ID")
                {
                    ToolTip = 'Specifies the value of the Payer ID field';
                    ApplicationArea = Basic, Suite;
                }
                field("Payer Names"; Rec."Payer Names")
                {
                    ToolTip = 'Specifies the value of the Payer Names field';
                    ApplicationArea = Basic, Suite;
                }
                field("Payment Mode"; Rec."Payment Mode")
                {
                    ToolTip = 'Specifies the value of the Payment Mode field';
                    ApplicationArea = Basic, Suite;
                }
                field("Provider ID"; Rec."Provider ID")
                {
                    ToolTip = 'Specifies the value of the Provider ID field';
                    ApplicationArea = Basic, Suite;
                }
                field("Transaction DateTime"; Rec."Transaction DateTime")
                {
                    ToolTip = 'Specifies the value of the Transaction DateTime field';
                    ApplicationArea = Basic, Suite;
                }
                field("Transaction Code"; Rec."Transaction Code")
                {
                    ToolTip = 'Specifies the value of the Transaction Code field';
                    ApplicationArea = Basic, Suite;
                }
                field("Source Document No."; Rec."Source Document No.")
                {
                    ToolTip = 'Specifies the value of the Source Document No. field';
                    ApplicationArea = Basic, Suite;
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field';
                    ApplicationArea = Basic, Suite;
                }
                field("Account No."; Rec."Account No.")
                {
                    ToolTip = 'Specifies the value of the Account No. field';
                    ApplicationArea = Basic, Suite;
                }
                field("Bulk Payment"; Rec."Bulk Payment")
                {
                    ToolTip = 'Specifies the value of the Bulk Payment field';
                    ApplicationArea = Basic, Suite;
                }
                field("DateTime Created"; Rec."DateTime Created")
                {
                    ToolTip = 'Specifies the value of the DateTime Created field';
                    ApplicationArea = Basic, Suite;
                }
                field("Source Document Type"; Rec."Source Document Type")
                {
                    ToolTip = 'Specifies the value of the Source Document Type field';
                    ApplicationArea = Basic, Suite;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ToolTip = 'Specifies the value of the Customer No. field';
                    ApplicationArea = Basic, Suite;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic, Suite;
                }
            }
        }
    }

}
