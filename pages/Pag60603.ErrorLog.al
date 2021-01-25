page 60603 "Error Log"
{

    ApplicationArea = Basic, Suite;
    Caption = 'Error Log';
    PageType = List;
    SourceTable = "Paygate Error Entry";
    UsageCategory = Tasks;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    Editable = false;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Error Code"; Rec."Error Code")
                {
                    ApplicationArea = Basic, Suite;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Source Transaction ID"; Rec."Source Transaction ID")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Source Entry No."; Rec."Source Entry No.")
                {
                    ApplicationArea = Basic, Suite;
                }

            }
        }
    }

}
