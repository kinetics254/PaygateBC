page 60608 "Verified Transactions"
{

    ApplicationArea = All;
    Caption = 'All Transaction Buffer';
    PageType = List;
    SourceTable = "PayGate Buffer";
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
                field("Transaction Date"; Rec."Transaction DateTime")
                {
                    ApplicationArea = All;
                    StyleExpr = RecHasErrors;
                }
                field("Payer ID"; Rec."Payer ID")
                {
                    ApplicationArea = All;
                    StyleExpr = RecHasErrors;
                }
                field("Payer Names"; Rec."Payer Names")
                {
                    ApplicationArea = All;
                    StyleExpr = RecHasErrors;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    StyleExpr = RecHasErrors;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    StyleExpr = RecHasErrors;
                }
                field("Payment Mode"; Rec."Payment Mode")
                {
                    ApplicationArea = All;
                    StyleExpr = RecHasErrors;
                }
                field("Source Document No."; Rec."Source Document No.")
                {
                    ApplicationArea = All;
                    StyleExpr = RecHasErrors;
                }
                field("Source Document Type"; Rec."Source Document Type")
                {
                    ApplicationArea = All;
                    StyleExpr = RecHasErrors;
                }
                field("Transaction Code"; Rec."Transaction Code")
                {
                    ApplicationArea = All;
                    StyleExpr = RecHasErrors;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = All;
                    StyleExpr = RecHasErrors;
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
                field("Processed Receipt No"; "Processed Receipt No")
                {
                    ApplicationArea = Basic, Suite;
                }

            }
        }
        area(FactBoxes)
        {
            part("Paygate Factbox"; "Paygate Fact Box")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "Entry No." = field("Entry No.");
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Validate)
            {
                ApplicationArea = All;
                Caption = 'Validate';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = ValidateEmailLoggingSetup;
                trigger OnAction()
                var
                    PaygateMgt: Codeunit "Paygate Manager";
                begin
                    PaygateMgt.ProcessSingle(false, Rec);
                end;
            }

        }
    }
    trigger OnAfterGetRecord()
    begin
        ShowRecStatus();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        ShowRecStatus();
    end;

    var
        RecHasErrors: Text[20];

    local procedure ShowRecStatus()

    begin
        if "Has Errors" then
            RecHasErrors := 'Attention'
        else begin
            if Validated then
                RecHasErrors := 'Favorable'
            else
                RecHasErrors := 'Standard';
        end;
    end;

}
