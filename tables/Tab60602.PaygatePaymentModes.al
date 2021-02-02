table 60602 "Paygate Payment Modes"
{
    Caption = 'Paygate Payment Modes';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Code; Code[20])
        {
            Caption = 'Code';
            DataClassification = ToBeClassified;
        }
        field(3; Description; Text[250])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(5; Identifier; Code[20])
        {
            Caption = 'Identifier';
            DataClassification = ToBeClassified;
        }
        field(13; "Totals MTD"; Decimal)
        {
            Caption = 'Totals MTD';
            DataClassification = ToBeClassified;
        }
        field(17; "Totals YTD"; Decimal)
        {
            Caption = 'Totals YTD';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }

}
