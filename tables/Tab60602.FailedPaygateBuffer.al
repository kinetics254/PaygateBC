table 60602 "Failed Paygate Buffer"
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
        field(3; "Transaction Code"; Code[35])
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
            OptionMembers = Pending,Valid,Failed,Processed,Partial;
            OptionCaption = 'Pending,Valid,Failed,Processed,Partial';
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
        field(43; "Bulk Payment"; Boolean)
        {
            Caption = 'Bulk Payment';
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


        field(68; "Processed Receipt No"; Code[20])
        {
            Caption = 'Receipt No.';
            DataClassification = ToBeClassified;
        }
        field(100; "Amount To Post"; Decimal)
        {
            Caption = 'Amount To Post';
            DataClassification = ToBeClassified;
            MinValue = 0;
            trigger OnValidate()
            var
                ExcessAmt: Label '%1 cannot be more than %2';
            begin
                "Original Amount" := Amount;
                if "Amount To Post" > Amount then
                    Error(ExcessAmt, FieldCaption("Amount To Post"), FieldCaption(Amount));
                if "Amount To Post" > (Amount - "Amount Posted") then
                    Error(ExcessAmt, FieldCaption("Amount To Post"), FieldCaption("Amount Posted"));
            end;
        }
        field(101; "Amount Posted"; Decimal)
        {
            Caption = 'Amount posted';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(102; "Original Amount"; Decimal)
        {
            Caption = 'Original Amount';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(200; "Created Time"; DateTime)
        {
            Caption = 'Created Time';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(201; "Provider ID"; Code[20])
        {
            Caption = 'Provider ID';
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
    trigger OnInsert()
    begin
        InitRecord();
    end;

    local procedure InitRecord()
    begin
        if "Entry No." = 0 then
            "Entry No." := GetNextEntryNo();
        "Created Time" := CurrentDateTime;
        "DateTime Created" := CurrentDateTime;
    end;

    local procedure GetNextEntryNo(): Integer
    var
        PaygetBuffer: Record "Failed Paygate Buffer";
    begin
        PaygetBuffer.Reset();
        PaygetBuffer.SetCurrentKey("Entry No.");
        if PaygetBuffer.FindLast() then
            exit(PaygetBuffer."Entry No." + 1)
        else
            exit(1);
    end;
}
