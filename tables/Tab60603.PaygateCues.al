table 60603 "Paygate Cues"
{
    Caption = 'Paygate Cues';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Code; Code[20])
        {
            Caption = 'Code';
            DataClassification = ToBeClassified;
        }
        field(3; Received; Decimal)
        {
            Caption = 'Received';
            DataClassification = ToBeClassified;
        }
        field(5; Verified; Decimal)
        {
            Caption = 'Verified';
            DataClassification = ToBeClassified;
        }
        field(7; Posted; Decimal)
        {
            Caption = 'Posted';
            DataClassification = ToBeClassified;
        }
        field(9; Failed; Decimal)
        {
            Caption = 'Failed';
            DataClassification = ToBeClassified;
        }
        field(11; "Period Start"; Date)
        {
            Caption = 'Period Start';
            DataClassification = ToBeClassified;
        }
        field(13; "Period End"; date)
        {
            Caption = 'Period End';
            DataClassification = ToBeClassified;
        }
        field(21; Paid; Decimal)
        {
            Caption = 'Paid';
            DataClassification = ToBeClassified;
        }
        field(23; Banked; Decimal)
        {
            Caption = 'Banked';
            DataClassification = ToBeClassified;
        }
        field(25; Pending; Decimal)
        {
            Caption = 'Pending';
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
