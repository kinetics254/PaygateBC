codeunit 60601 "Paygate Error Manager"
{
    TableNo = "Paygate Buffer";

    trigger OnRun()
    begin
        ClearVars(Rec);
        //Check for blanks & mandatories

        //check if the dates of payment are current

        //check payment method aspects

        //check the source document exists unless it is a bulk payment

        //Check if amounts tally with source document unless it is a bulk payment

        if ERROREXISTS then begin
            CreateErrorEntry(Rec);

        end;
        Rec."Has Errors" := ERROREXISTS;
    end;

    procedure ClearVars(CurrEntry: Record "Paygate Buffer")
    var
        myInt: Integer;
    begin
        ERROREXISTS := false;

        ERRORRECS.RESET;
        ERRORRECS.SETFILTER("Source Entry No.", '%1', CurrEntry."Entry No.");
        IF ERRORRECS.FINDSET THEN ERRORRECS.DELETEALL;
    end;

    procedure CreateErrorEntry(CurrEntry: Record "Paygate Buffer")
    var
        myInt: Integer;
    begin
        //do inserts here

        CurrEntry.vali
    end;

    var
        ERROREXISTS: Boolean;
        ERRORCODE: Code[20];
        ERRORTXT: Text[250];
        ERRORRECS: Record "Paygate Error Entry";

        CLE: Record "Cust. Ledger Entry";
        CustApply: Codeunit "CustEntry-Apply Posted Entries";
}

