page 60605 "PayGate Admin Role Center"
{

    Caption = 'PayGate Admin Role Center';
    PageType = RoleCenter;

    layout
    {
        area(RoleCenter)
        {
            part(Heading; "Headline RC Team Member")
            {
                ApplicationArea = Basic, Suite;
            }
            part(Part2; "PayGate Header Cue Page")
            {
                ApplicationArea = Basic, Suite;
            }

            part(PowerBI; "Power BI Report Spinner Part")
            {
                ApplicationArea = Basic, Suite;
            }

            part(MyAccounts; "My Accounts")
            {
                ApplicationArea = Basic, Suite;
            }

            systempart(MyNotes; MyNotes)
            {
                ApplicationArea = Basic, Suite;
            }
        }
    }

    actions
    {
        area(Reporting)
        {
            action(PaymentHistory)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Payment History';
                Image = Report;
                RunObject = report "Customer - List";
                ToolTip = 'view List of Customers';
            }
        }

        area(Embedding)
        {
            action(Customers)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Payment Methods';
                Image = Payment;
                RunObject = page "Customer List";
                ToolTip = 'View accepted payment methods';
            }

            action("Bank Accounts")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Bank Accounts';
                Image = BankAccount;
                RunObject = Page "Bank Account List";
                ToolTip = 'View bank accounts';
            }
        }

        area(Sections)
        {
            group("Manual Uploads")
            {
                Caption = 'Uploads';
                ToolTip = 'Upload manual statements';
                action(PendingUploads)
                {
                    Caption = 'Pending';
                    ApplicationArea = Basic, Suite;
                    RunObject = page "Pending Uploads";
                }
                action(PostedUploads)
                {
                    Caption = 'Posted';
                    ApplicationArea = Basic, Suite;
                    RunObject = page "Posted Uploads";
                }
            }
            group("Transactions")
            {
                Caption = 'Transactions';
                ToolTip = 'View payments';
                action(PendingPayments)
                {
                    Caption = 'Pending';
                    ApplicationArea = Basic, Suite;
                    RunObject = page "Pending Transactions";
                }
                action(FailedPayments)
                {
                    Caption = 'Failed';
                    ApplicationArea = Basic, Suite;
                    RunObject = page "Failed Transactions";
                }
                action(PostedPayments)
                {
                    Caption = 'Posted';
                    ApplicationArea = Basic, Suite;
                    RunObject = page "Posted Transactions";
                }
            }

            group(Setup)
            {
                Caption = 'Setup';
                Image = Setup;
                ToolTip = 'view or edit cash management setup';

                action("Cash Management Setup")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cash Management Setup';
                    ToolTip = 'view or edit Cash Management Setup';
                    Image = Setup;
                    RunObject = page "View Transactions";
                }
            }
            group("Posted Documents")
            {
                Caption = 'Receipts';
                ToolTip = 'View posted documents';
                action("Receipts")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Receipts';
                    ToolTip = 'View posted receipts';
                    RunObject = page "View Transactions";
                }
            }
        }
    }

}

profile CashManagementAdmn
{
    ProfileDescription = 'PayGate Administrator';
    RoleCenter = "PayGate Admin Role Center";
    Caption = 'PayGate Admin';
}
