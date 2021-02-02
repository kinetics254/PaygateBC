page 60604 "Paygate Cues"
{

    Caption = 'Paygate Cues';
    PageType = CardPart;
    SourceTable = "Paygate Cues";

    layout
    {
        area(content)
        {

            cuegroup("Paygate Cue")
            {
                Caption = 'Payment Stats';
                field(Received; Received)
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageId = "View Transactions";
                    StyleExpr = true;
                    Image = Cash;
                    Style = Standard;
                }
                field(Verified; Verified)
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageId = "Verified Transactions";
                    StyleExpr = true;
                    Image = Cash;
                    Style = Favorable;
                }
                field(Posted; Posted)
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageId = "Posted Transactions";
                    StyleExpr = true;
                    Image = Cash;
                    Style = Strong;
                }
                field(Failed; Failed)
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageId = "Failed Transactions";
                    StyleExpr = true;
                    Image = Cash;
                    Style = Attention;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Reset();
        if not Get() then begin
            Init();
            Insert();
        end;

    end;



    local procedure SetStatPeriods(): Code[20]
    var

    begin

    end;



}