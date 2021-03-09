report 60600 "Validate Paygate"
{
    UsageCategory = Administration;
    ApplicationArea = All;
    ProcessingOnly = true;

    dataset
    {
        dataitem("Paygate Buffer"; "Paygate Buffer")
        {
            RequestFilterFields = "Transaction DateTime", "Payment Mode", Amount;
            DataItemTableView = sorting("Entry No.") Where(Status = filter(Pending));
            trigger OnAfterGetRecord()
            begin
                PaygateMgt.ProcessSingle(true, "Paygate Buffer");
            end;
        }
    }


    trigger OnPostReport()
    begin
        Message('Process Completed');
    end;

    var
        PaygateMgt: Codeunit "Paygate Manager";
}
