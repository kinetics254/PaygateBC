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
                field("Transaction Date"; Rec."Transaction DateTime")
                {
                    ApplicationArea = All;
                    StyleExpr = RecHasErrors;
                }
                field(Description; Rec.Description)
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
                field("Payment Mode"; Rec."Payment Mode")
                {
                    ApplicationArea = All;
                    StyleExpr = RecHasErrors;
                }
                field("Provider ID"; Rec."Provider ID")
                {
                    ApplicationArea = All;
                    StyleExpr = RecHasErrors;
                }
                field("Transaction Code"; Rec."Transaction Code")
                {
                    ApplicationArea = All;
                    StyleExpr = RecHasErrors;
                }
                field("Source Document No."; Rec."Source Document No.")
                {
                    ApplicationArea = All;
                    StyleExpr = RecHasErrors;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    StyleExpr = RecHasErrors;
                }

                field("Amount To Post"; Rec."Amount To Post")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                }

                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = All;
                    StyleExpr = RecHasErrors;
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
                field("Processed Receipt No"; Rec."Processed Receipt No")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Amount Posted"; Rec."Amount Posted")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Source Document Type"; Rec."Source Document Type")
                {
                    ApplicationArea = All;
                    StyleExpr = RecHasErrors;
                }
                field("Promise to Pay"; Rec."Promise to Pay")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field("Created Time"; Rec."Created Time")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Manual Insert"; Rec."Manual Insert")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Credit Payment"; "Credit Payment")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Credit Reference No"; "Credit Reference No")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Is Overpayment Application"; "Is Overpayment Application")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Overpayment Application No"; "Overpayment Application No")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Currency Code"; Rec."Currency Code")
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
                begin
                    PaygateMgt.ProcessSingle(false, Rec);
                end;
            }
            action("Validate All")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Validate All';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Approvals;
                trigger OnAction()
                begin
                    ValidateAll();
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
        PaygateMgt: Codeunit "Paygate Manager";


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
