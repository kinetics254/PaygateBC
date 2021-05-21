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
            FieldClass = FlowField;
            CalcFormula = count("Paygate Buffer" where(Status = filter(Processed), "Trans Date" = field("Date Filter")));
        }
        field(3; "Unprocessed Paygate"; Integer)
        {
            Caption = 'Unprocessed Paygate';
            FieldClass = FlowField;
            CalcFormula = count("Paygate Buffer" where(Status = filter(Pending), "Trans Date" = field("Date Filter")));
        }
        field(4; "Processed Amount"; Decimal)
        {
            Caption = 'Current Year Processed';
            FieldClass = FlowField;
            CalcFormula = sum("Paygate Buffer".Amount where(Status = filter(Processed), Duplicate = filter(false), "Trans Date" = field("Date Filter")));
            DecimalPlaces = 0 : 0;
            AutoFormatType = 10;
            AutoFormatExpression = GetAmountFormat();
            Editable = false;
        }
        field(5; "Unprocessed Amount"; Decimal)
        {
            Caption = 'Current Year Unprocessed';
            FieldClass = FlowField;
            CalcFormula = sum("Paygate Buffer".Amount where(Status = filter(Pending), Duplicate = filter(false), "Trans Date" = field("Date Filter")));
            DecimalPlaces = 0 : 0;
            AutoFormatType = 10;
            AutoFormatExpression = GetAmountFormat();
        }
        field(6; "Amount Received Today"; Decimal)
        {
            Caption = 'Received Today';
            FieldClass = FlowField;
            CalcFormula = sum("Paygate Buffer".Amount where(Duplicate = filter(false), "Created Date" = field("Today Filter")));
            DecimalPlaces = 0 : 0;
            AutoFormatType = 10;
            AutoFormatExpression = GetAmountFormat();
        }
        field(7; "Failed Paygate"; Integer)
        {
            Caption = 'Failed Paygate';
            FieldClass = FlowField;
            CalcFormula = count("Failed Paygate Buffer" where("Created Date" = field("Date Filter")));
        }
        field(8; "Month Processed Amount"; Decimal)
        {
            Caption = 'Current Month Processed';
            FieldClass = FlowField;
            CalcFormula = sum("Paygate Buffer".Amount where(Status = filter(Processed), Duplicate = filter(false), "Created Date" = field("Month Filter")));
            DecimalPlaces = 0 : 0;
            AutoFormatType = 10;
            AutoFormatExpression = GetAmountFormat();
            Editable = false;
        }
        field(9; "Month Unprocessed Amount"; Decimal)
        {
            Caption = 'Current Month Unprocessed';
            FieldClass = FlowField;
            CalcFormula = sum("Paygate Buffer".Amount where(Status = filter(Pending), Duplicate = filter(false), "Created Date" = field("Month Filter")));
            DecimalPlaces = 0 : 0;
            AutoFormatType = 10;
            AutoFormatExpression = GetAmountFormat();
        }
        field(10; "CM Amount Received"; Decimal)
        {
            Caption = 'Current Month Received';
            FieldClass = FlowField;
            CalcFormula = sum("Paygate Buffer".Amount where(Duplicate = filter(false), "Created Date" = field("Month Filter")));
            DecimalPlaces = 0 : 0;
            AutoFormatType = 10;
            AutoFormatExpression = GetAmountFormat();
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
        field(53; "Month Filter"; Date)
        {
            Caption = 'Monthly Filter';
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
