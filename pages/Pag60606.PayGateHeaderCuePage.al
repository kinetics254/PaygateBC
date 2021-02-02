page 60606 "PayGate Header Cue Page"
{
    Caption = 'Activities';
    PageType = CardPart;
    //RefreshOnActivate = true;
    SourceTable = "Paygate Cues";

    layout
    {
        area(Content)
        {
            cuegroup(CMHeader)
            {
                Caption = 'Bank Account Statistics';
                field("Received Count"; Received)
                {
                    Caption = 'Received';
                    ApplicationArea = Basic, Suite;
                    DrillDownPageId = "Bank Account List";
                    StyleExpr = true;
                    Image = People;
                    Style = Favorable;
                }
                field("Posted Count"; Posted)
                {
                    Caption = 'Received';
                    ApplicationArea = Basic, Suite;
                    DrillDownPageId = "Bank Account List";
                    StyleExpr = true;
                    Image = People;
                    Style = Favorable;
                }
                field("Failed Count"; Failed)
                {
                    Caption = 'Received';
                    ApplicationArea = Basic, Suite;
                    DrillDownPageId = "Bank Account List";
                    StyleExpr = true;
                    Image = People;
                    Style = Favorable;
                }
                field("Paid"; Paid)
                {
                    Caption = 'Paid';
                    ApplicationArea = Basic, Suite;
                }

                field("Banked"; Banked)
                {
                    Caption = 'Banked';
                    ApplicationArea = Basic, Suite;
                }

                field("Pending"; Pending)
                {
                    Caption = 'Pending';
                    ApplicationArea = Basic, Suite;
                }
            }
        }
    }

    trigger OnOpenPage();
    begin
        Reset();
        if not Get() then begin
            Init();
            Insert();
        end;

    end;
}