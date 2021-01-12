table 60601 "Paygate Error Entry"
{
    Caption = 'Paygate Error Entry';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = ToBeClassified;
        }
        field(3; "Source Entry No."; Integer)
        {
            Caption = 'Source Entry No.';
            DataClassification = ToBeClassified;
        }
        field(5; "Source Transaction ID"; Code[20])
        {
            Caption = 'Source Transaction ID';
            DataClassification = ToBeClassified;
        }
        field(9; "Error Code"; Code[20])
        {
            Caption = 'Error Code';
            DataClassification = ToBeClassified;
        }
        field(11; Description; Text[250])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(13; "Created DateTime"; DateTime)
        {
            Caption = 'Created DateTime';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }

}
