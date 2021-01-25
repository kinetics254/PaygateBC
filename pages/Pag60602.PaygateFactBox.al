page 60602 "Paygate Fact Box"
{

    Caption = 'Paygate Fact Box';
    PageType = CardPart;
    SourceTable = "Paygate Buffer";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    Editable = false;
    layout
    {
        area(content)
        {
            group(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Source Document No."; Rec."Source Document No.")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Source Document Type"; Rec."Source Document Type")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Transaction Code"; Rec."Transaction Code")
                {
                    ApplicationArea = Basic, Suite;
                }
                field(Errors; Rec.Errors)
                {
                    ApplicationArea = Basic, Suite;
                    StyleExpr = 'Attention';
                }
            }
        }
    }

}
