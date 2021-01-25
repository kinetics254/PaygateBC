codeunit 60650 "Paygate Manager"
{
    procedure ImportPayments()
    begin

    end;

    procedure ProcessAll()
    begin

    end;

    procedure ProcessSingle(HideDialog: Boolean; var CurrEntry: Record "Paygate Buffer")
    var
        ErrorHandler: Codeunit "Paygate Error Manager";
    begin
        if not ConfirmProcessBuffer(CurrEntry, HideDialog) then exit;
        if CurrEntry.Status <> CurrEntry.Status::Pending then exit;
        ErrorHandler.Run(CurrEntry);
        if not CurrEntry.Validated then exit;
    end;

    local procedure ConfirmProcessBuffer(CurrEntry: Record "Paygate Buffer"; HideDialog: Boolean): Boolean
    var
        ConfirmQst: label 'Process Buffer Entry?';
    begin
        if not GuiAllowed or HideDialog then exit(true);
        exit(Confirm(ConfirmQst, false));
    end;

    procedure ValidateEntry(CurrEntry: Record "Paygate Buffer")
    var
        ErrorEntry: Record "Paygate Error Entry";
    begin

    end;

    procedure CreateReceipt()
    begin

    end;

    procedure PostReceipt()
    begin

    end;

    [EventSubscriber(ObjectType::Table, Database::"Paygate Buffer", 'OnAfterInsertEvent', '', false, false)]
    local procedure ValidateOnAfterInsert(var Rec: Record "Paygate Buffer")
    var
        ErrorHandler: Codeunit "Paygate Error Manager";
    begin
        ErrorHandler.Run(Rec);
    end;
}
