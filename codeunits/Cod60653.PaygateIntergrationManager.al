codeunit 60653 "Paygate Intergration Manager"
{
    procedure CreatePaygate(Failed: Boolean; transactionCode: Text[35]; transactionDate: DateTime; payerID: Text[20]; amount: Decimal; description: Text[100];
                            paymentMode: Text[20]; payerNames: Text[100]; sourceDocumentNo: Text[20]; sourceDocumentType: Integer; customerNo: Text[20];
                            entryNo: Integer; accountNo: Text[20]; providerID: Text[20]; promiseToPay: Boolean; base64Attachment: Text;
                            isCreditPayment: Boolean; creditReferenceNo: Code[35]; isOverpaymentApplication: Boolean; overpaymentApplicationNo: Code[20])
    begin
        if Failed then
            CreateFailedPaygate(transactionCode, transactionDate, payerID, amount, description, paymentMode, payerNames, sourceDocumentNo,
                                sourceDocumentType, customerNo, entryNo, accountNo, providerID)
        else
            CreatePaygateEntry(transactionCode, transactionDate, payerID, amount, description, paymentMode, payerNames, sourceDocumentNo,
                                sourceDocumentType, customerNo, entryNo, accountNo, providerID, promiseToPay, base64Attachment,
                                isCreditPayment, creditReferenceNo, isOverpaymentApplication, overpaymentApplicationNo);
    end;

    local procedure CreateFailedPaygate(transactionCode: Code[35]; transactionDate: DateTime; payerID: Code[20]; amount: Decimal;
                                        description: Text[100]; paymentMode: Code[20]; payerNames: Text[100];
                                        sourceDocumentNo: Code[20]; sourceDocumentType: Integer; customerNo: Code[20];
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

    local procedure CreatePaygateEntry(transactionCode: Code[35]; transactionDate: DateTime; payerID: Code[20]; amount: Decimal;
                                        description: Text[100]; paymentMode: Code[20]; payerNames: Text[100];
                                        sourceDocumentNo: Code[20]; sourceDocumentType: Integer; customerNo: Code[20];
                                        entryNo: Integer; accountNo: Code[20]; providerID: Code[20]; promiseToPay: Boolean;
                                        base64Attachment: Text; isCreditPayment: Boolean; creditReferenceNo: Code[35];
                                        isOverpaymentApplication: Boolean; overpaymentApplicationNo: Code[20])
    var
        Payment: Record "Paygate Buffer";
        Outstream: OutStream;
        Instream: InStream;
        TempBlob: Codeunit "Temp Blob";
        Base64Mgt: Codeunit "Base64 Convert";
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
        Payment."Promise to Pay" := promiseToPay;
        Payment."Customer No." := customerNo;
        Payment."Account No." := accountNo;
        Payment."Provider ID" := providerID;
        Payment."Manual Insert" := false;
        if not (base64Attachment = '') then begin
            Clear(Outstream);
            Clear(Instream);
            Clear(TempBlob);
            TempBlob.CreateOutStream(Outstream);
            Base64Mgt.FromBase64(base64Attachment, Outstream);
            TempBlob.CreateInStream(Instream);
            Payment.Attachment.ImportStream(Instream, 'Photo');
        end;
        Payment."Is Overpayment Application" := isOverpaymentApplication;
        Payment."Credit Payment" := isCreditPayment;
        Payment."Credit Reference No" := creditReferenceNo;
        Payment."Overpayment Application No" := overpaymentApplicationNo;
        Payment.Insert(true);
    end;
}
