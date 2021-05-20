page 60607 "Paygate Cues"
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
                Caption = 'Paygate Amounts';
                CuegroupLayout = Wide;
                field("Processed Amount"; "Processed Amount")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageId = "Paygate Buffer";
                    Style = Favorable;
                    StyleExpr = true;
                }
                field("Unprocessed Amount"; "Unprocessed Amount")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageId = "Paygate Buffer";
                    Style = Unfavorable;
                    StyleExpr = true;
                }
                field("Amount Received Today"; "Amount Received Today")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageId = "Paygate Buffer";
                    Style = Favorable;
                    StyleExpr = true;
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
        SetRange("Date Filter", CalcDate('-CY', Today), CalcDate('CY', Today));
        SetRange("Today Filter", Today);
    end;

}
