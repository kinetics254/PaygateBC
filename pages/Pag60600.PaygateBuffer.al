page 60600 "Paygate Buffer"
{

    ApplicationArea = All;
    Caption = 'Paygate Buffer';
    PageType = List;
    SourceTable = "Paygate Buffer";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                    ApplicationArea = All;
                }
                field("Payer ID"; Rec."Payer ID")
                {
                    ApplicationArea = All;
                }
                field("Payer Names"; Rec."Payer Names")
                {
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Payment Mode"; Rec."Payment Mode")
                {
                    ApplicationArea = All;
                }
                field("Source Document No."; Rec."Source Document No.")
                {
                    ApplicationArea = All;
                }
                field("Source Document Type"; Rec."Source Document Type")
                {
                    ApplicationArea = All;
                }
                field("Transaction Code"; Rec."Transaction Code")
                {
                    ApplicationArea = All;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = All;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("DateTime Created"; Rec."DateTime Created")
                {
                    ApplicationArea = All;
                }
                field("Processed DateTime"; Rec."Processed DateTime")
                {
                    ApplicationArea = All;
                }
                field("Validated DateTime"; Rec."Validated DateTime")
                {
                    ApplicationArea = All;
                }
                field(Validated; Rec.Validated)
                {
                    ApplicationArea = All;
                }
                field(Errors; Rec.Errors)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}
