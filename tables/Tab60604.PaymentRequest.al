table 60604 "Payment Request"
{
    Caption = 'Pending Payment Request';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Transaction No."; Code[50])
        {
            Caption = 'Transaction No.';
            DataClassification = ToBeClassified;
            NotBlank = true;
        }
        field(2; "Payment Mode"; Code[20])
        {
            Caption = 'Payment Mode';
            DataClassification = ToBeClassified;
        }

        field(3; "Transaction Date"; Date)
        {
            Caption = 'Transaction Date';
            DataClassification = ToBeClassified;
            NotBlank = true;
        }
        field(4; "Customer ID."; Code[20])
        {
            Caption = 'Customer ID.';
            DataClassification = ToBeClassified;
            NotBlank = true;

        }
        field(5; Amount; Decimal)
        {
            Caption = 'Amount';
            DataClassification = ToBeClassified;
            NotBlank = true;
        }
        field(6; Description; Text[250])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(7; "Reference No."; Code[20])
        {
            Caption = 'Reference No.';
            DataClassification = ToBeClassified;
            NotBlank = true;
        }
        field(8; "Created On"; DateTime)
        {
            Caption = 'Created On';
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }
    keys
    {
        key(PK; "Transaction No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin
        //CheckMandatory();
        //ServiceRequest.CreateServiceRequestFromSourceDocument(Rec);
    end;

    local procedure CheckMandatory()
    var
        RefError: Label 'Reference %1 does not exist';

    begin
        TestField("Transaction No.");
        TestField("Transaction Date");
        TestField("Reference No.");
        TestField(Amount);
        TestField("Customer ID.");
        ValidatePaymentMethod();
        "Created On" := CurrentDateTime;

    end;

    local procedure ValidatePaymentMethod()
    var
        PaymentMethod: Record "Payment Method";
    begin
        PaymentMethod.Get("Payment Mode");
        PaymentMethod.TestField("Bal. Account Type", PaymentMethod."Bal. Account Type"::"Bank Account");
        PaymentMethod.TestField("Bal. Account No.");
    end;

    var
}
