codeunit 60600 "Paygate Manager"
{
    procedure ImportPayments()
    begin

    end;

    procedure ProcessAll()
    begin

    end;

    procedure ProcessSingle(AskConf: Boolean; CurrEntry: Record "Paygate Buffer")
    var
        ConfAskProcess: Label 'Process Buffer Entry ?';
        ErrorHandler: Codeunit "Paygate Error Manager";
    begin
        if AskConf then
            if Confirm(ConfAskProcess, false) then exit;

        if CurrEntry.Status <> CurrEntry.Status::Pending then exit;
        ErrorHandler.Run(CurrEntry);
        if not CurrEntry.Validated then exit;
    end;

    procedure ValidateEntry(CurrEntry: Record "Paygate Buffer")
    var
        ErrorEntry: Record "Paygate Error Entry";
    begin

    end;

    procedure GetSourceDocument()
    begin

    end;

    procedure CreateReceipt()
    begin

    end;

    procedure PostReceipt()
    begin

    end;
}
