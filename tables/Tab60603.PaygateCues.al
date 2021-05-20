table 60603 "Paygate Cues"
{
    Caption = 'Paygate Cue';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = ToBeClassified;
        }
        field(2; "Processed Paygate"; Integer)
        {
            Caption = 'Processed Paygate';
            DataClassification = ToBeClassified;
        }
        field(3; "Unprocessed Paygate"; Integer)
        {
            Caption = 'Unprocessed Paygate';
            DataClassification = ToBeClassified;
        }
        field(4; "Processed Amount"; Decimal)
        {
            Caption = 'Processed Amount';
            DataClassification = ToBeClassified;
        }
        field(5; "Unprocessed Amount"; Decimal)
        {
            Caption = 'Unprocessed Amount';
            DataClassification = ToBeClassified;
        }
        field(6; "Amount Received Today"; Decimal)
        {
            Caption = 'Amount Received Today';
            DataClassification = ToBeClassified;
        }
        field(7; "Failed Paygate"; Integer)
        {
            Caption = 'Failed Paygate';
            DataClassification = ToBeClassified;
        }
        field(50; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(51; "Customer Filter"; Code[20])
        {
            Caption = 'Customer Filter';
            FieldClass = FlowFilter;
        }
        field(52; "Today Filter"; Date)
        {
            Caption = 'Today Filter';
            FieldClass = FlowFilter;
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

}
