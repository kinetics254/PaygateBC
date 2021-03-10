table 60600 "Paygate Buffer"
{
    Caption = 'Payment Buffer';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = ToBeClassified;
        }
        field(3; "Transaction Code"; Code[20])
        {
            Caption = 'Transaction Code';
            DataClassification = ToBeClassified;
        }
        field(5; "Payment Mode"; Code[20])
        {
            Caption = 'Payment Mode';
            DataClassification = ToBeClassified;
        }
        field(7; "Transaction DateTime"; DateTime)
        {
            Caption = 'Transaction DateTime';
            DataClassification = ToBeClassified;
        }
        field(13; "Payer ID"; Code[20])
        {
            Caption = 'Payer ID';
            DataClassification = ToBeClassified;
        }
        field(11; "Payer Names"; Text[250])
        {
            Caption = 'Payer Names';
            DataClassification = ToBeClassified;
        }
        field(15; Description; Text[250])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(9; Amount; Decimal)
        {
            Caption = 'Amount';
            DataClassification = ToBeClassified;
        }
        field(25; "Account No."; Code[20])
        {
            Caption = 'Account No.';
            DataClassification = ToBeClassified;
        }
        field(17; Status; Option)
        {
            Caption = 'Status';
            DataClassification = ToBeClassified;
            OptionMembers = Pending,Valid,Failed,Processed;
        }
        field(21; "DateTime Created"; DateTime)
        {
            Caption = 'DateTime Created';
            DataClassification = ToBeClassified;
        }
        field(33; "Source Document Type"; Option)
        {
            Caption = 'Source Document Type';
            DataClassification = ToBeClassified;
            OptionMembers = " ",Quote,Orders,Invoices,Ledgers,Requests;
        }
        field(37; "Source Document No."; Code[35])
        {
            Caption = 'Source Document No.';
            DataClassification = ToBeClassified;
        }
        field(41; "Applied Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(43; "Bulk Payment"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(51; "Processed DateTime"; DateTime)
        {
            Caption = 'Processed DateTime';
            DataClassification = ToBeClassified;
        }
        field(39; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";
        }
        field(61; Errors; Integer)
        {
            Caption = 'Errors';
            FieldClass = FlowField;
            CalcFormula = count("Paygate Error Entry" where("Source Entry No." = field("Entry No.")));
            Editable = false;
        }
        field(55; Validated; Boolean)
        {
            Caption = 'Validated';
            DataClassification = ToBeClassified;
        }
        field(57; "Validated DateTime"; DateTime)
        {
            Caption = 'Validated DateTime';
            DataClassification = ToBeClassified;
        }
        field(67; "Has Errors"; Boolean)
        {
            Caption = 'Has Errors';
            DataClassification = ToBeClassified;
        }
        field(68; "Processed Receipt No"; Code[20])
        {
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
    var
        ErrorHandler: Codeunit "Paygate Error Manager";

    trigger OnInsert()
    begin
        InitRecord();
    end;

    local procedure InitRecord()
    begin
        if "Entry No." = 0 then
            "Entry No." := GetNextEntryNo()
    end;

    local procedure GetNextEntryNo(): Integer
    var
        PaygetBuffer: Record "Paygate Buffer";
    begin
        PaygetBuffer.Reset();
        PaygetBuffer.SetCurrentKey("Entry No.");
        if PaygetBuffer.FindLast() then
            exit(PaygetBuffer."Entry No." + 1)
        else
            exit(1);
    end;

    procedure ValidateAll()
    var
        PaygateMgt: Codeunit "Paygate Manager";
    begin
        PaygateMgt.ProcessAll(false);
    end;
}
