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
                field("CM Amount Received"; "CM Amount Received")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageId = "Paygate Buffer";
                    Style = Favorable;
                    StyleExpr = true;
                }
                field("Month Processed Amount"; "Month Processed Amount")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageId = "Paygate Buffer";
                    Style = Favorable;
                    StyleExpr = true;
                }
                field("Month Unprocessed Amount"; "Month Unprocessed Amount")
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
            cuegroup(Paygate)
            {
                Caption = 'Paygate Count';
                field("Processed Paygate"; "Processed Paygate")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageId = "Paygate Buffer";
                    Style = Favorable;
                    StyleExpr = true;
                    Image = None;
                }
                field("Unprocessed Paygate"; "Unprocessed Paygate")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageId = "Paygate Buffer";
                    Style = Unfavorable;
                    StyleExpr = true;
                    Image = None;
                }
                field("Failed Paygate"; "Failed Paygate")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageId = "Failed Paygate";
                    Style = Unfavorable;
                    StyleExpr = true;
                    Image = None;
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
        SetRange("Month Filter", CalcDate('-CM', Today), CalcDate('CM', Today));
    end;

}
