table 60603 "Paygate Cues"
{
    Caption = 'Paygate Cue';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Processed Paygate"; Integer)
        {
            Caption = 'Processed Paygate';
        }
        field(3; "Unprocessed Paygate"; Integer)
        {
            Caption = 'Unprocessed Paygate';

        }
        field(4; "Processed Amount"; Decimal)
        {
            Caption = 'Processed Amount';
            FieldClass = FlowField;
            CalcFormula = sum("Paygate Buffer".Amount where(Status = filter(Processed), Duplicate = filter(false), "Trans Date" = field("Date Filter")));
            DecimalPlaces = 0 : 0;
            AutoFormatType = 10;
            AutoFormatExpression = GetAmountFormat();
            Editable = false;
        }
        field(5; "Unprocessed Amount"; Decimal)
        {
            Caption = 'Unprocessed Amount';
            FieldClass = FlowField;
            CalcFormula = sum("Paygate Buffer".Amount where(Status = filter(Pending), Duplicate = filter(false), "Trans Date" = field("Date Filter")));
            DecimalPlaces = 0 : 0;
            AutoFormatType = 10;
            AutoFormatExpression = GetAmountFormat();
        }
        field(6; "Amount Received Today"; Decimal)
        {
            Caption = 'Amount Received Today';
            FieldClass = FlowField;
            CalcFormula = sum("Paygate Buffer".Amount where(Duplicate = filter(false), "Created Date" = field("Today Filter")));
            DecimalPlaces = 0 : 0;
            AutoFormatType = 10;
            AutoFormatExpression = GetAmountFormat();
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
    local procedure GetAmountFormat(): Text

    begin
        exit('<Precision,0:0><Standard Format,0>');
    end;
}
