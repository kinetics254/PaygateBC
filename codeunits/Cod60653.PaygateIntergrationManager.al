codeunit 60653 "Paygate Intergration Manager"
{
    procedure CreatePaygate(Failed: Boolean; transactionCode: Text[35]; transactionDate: DateTime; payerID: Text[20]; amount: Decimal; description: Text[100];
                            paymentMode: Text[20]; payerNames: Text[100]; sourceDocumentNo: Text[20]; sourceDocumentType: Integer; customerNo: Text[20];
                            entryNo: Integer; accountNo: Text[20]; providerID: Text[20])
    var
        myInt: Integer;
    begin
        if Failed then
            CreateFailedPaygate(transactionCode, transactionDate, payerID, amount, description, paymentMode, payerNames, sourceDocumentNo,
                                sourceDocumentType, customerNo, entryNo, accountNo, providerID)
        else
            CreatePaygateEntry(transactionCode, transactionDate, payerID, amount, description, paymentMode, payerNames, sourceDocumentNo,
                                sourceDocumentType, customerNo, entryNo, accountNo, providerID);
    end;

    local procedure CreateFailedPaygate(transactionCode: Code[35]; transactionDate: DateTime; payerID: Code[20]; amount: Decimal; description: Text[100];
                            paymentMode: Code[20]; payerNames: Text[100]; sourceDocumentNo: Code[20]; sourceDocumentType: Integer; customerNo: Code[20];
                            entryNo: Integer; accountNo: Code[20]; providerID: Code[20])
    var
        Failed: Record "Failed Paygate Buffer";
    begin
        Failed."Entry No." := entryNo;
        Failed."Transaction Code" := transactionCode;
        Failed."Transaction DateTime" := transactionDate;
        Failed."Payer ID" := payerID;
        Failed.Amount := amount;
        Failed.Description := description;
        Failed."Payment Mode" := paymentMode;
        Failed."Payer Names" := payerNames;
        Failed."Source Document No." := sourceDocumentNo;
        case sourceDocumentType of
            0:
                Failed."Source Document Type" := Failed."Source Document Type"::" ";
            1:
                Failed."Source Document Type" := Failed."Source Document Type"::Quote;
            2:
                Failed."Source Document Type" := Failed."Source Document Type"::Orders;
            3:
                Failed."Source Document Type" := Failed."Source Document Type"::Invoices;
            4:
                Failed."Source Document Type" := Failed."Source Document Type"::Ledgers;
            5:
                Failed."Source Document Type" := Failed."Source Document Type"::Requests;
        end;
        Failed."Customer No." := customerNo;
        Failed."Account No." := accountNo;
        Failed."Provider ID" := providerID;
        Failed.Insert(true);
    end;

    local procedure CreatePaygateEntry(transactionCode: Code[35]; transactionDate: DateTime; payerID: Code[20]; amount: Decimal; description: Text[100];
                            paymentMode: Code[20]; payerNames: Text[100]; sourceDocumentNo: Code[20]; sourceDocumentType: Integer; customerNo: Code[20];
                            entryNo: Integer; accountNo: Code[20]; providerID: Code[20])
    var
        Payment: Record "Paygate Buffer";
    begin
        Payment."Entry No." := entryNo;
        Payment."Transaction Code" := transactionCode;
        Payment."Transaction DateTime" := transactionDate;
        Payment."Payer ID" := payerID;
        Payment.Amount := amount;
        Payment.Description := description;
        Payment."Payment Mode" := paymentMode;
        Payment."Payer Names" := payerNames;
        Payment."Source Document No." := sourceDocumentNo;
        case sourceDocumentType of
            0:
                Payment."Source Document Type" := Payment."Source Document Type"::" ";
            1:
                Payment."Source Document Type" := Payment."Source Document Type"::Quote;
            2:
                Payment."Source Document Type" := Payment."Source Document Type"::Orders;
            3:
                Payment."Source Document Type" := Payment."Source Document Type"::Invoices;
            4:
                Payment."Source Document Type" := Payment."Source Document Type"::Ledgers;
            5:
                Payment."Source Document Type" := Payment."Source Document Type"::Requests;
        end;
        Payment."Customer No." := customerNo;
        Payment."Account No." := accountNo;
        Payment."Provider ID" := providerID;
        Payment.Insert(true);
    end;
}
