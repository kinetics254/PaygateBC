page 60606 "Paygate Role Center"
{

    Caption = 'Paygate Management';
    PageType = RoleCenter;
    layout
    {
        area(RoleCenter)
        {
            part(Heading; "Headline RC Team Member")
            {
                ApplicationArea = Basic, Suite;
            }
            part(PaygateCue; "Paygate Cues")
            {
                ApplicationArea = Basic, Suite;
            }
            part(PowerBI; "Power BI Report Spinner Part")
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

        }
        area(Sections)
        {
            group("Payment")
            {
                action("Paygate Buffer")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Paygate';
                    RunObject = page "Paygate Buffer";
                    RunPageLink = Status = filter(<> Processed);
                    ToolTip = 'Paygate entries';
                }
                action("Processed Paygate Buffer")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Processed Paygate';
                    RunObject = page "Paygate Buffer";
                    RunPageLink = Status = filter(Processed);
                    ToolTip = 'Paygate entries';
                }
            }
        }
        area(Embedding)
        {
            action("Chart of Accounts")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Accounts';
                RunObject = Page "Chart of Accounts";
                ToolTip = 'Open the chart of accounts.';
            }
            action(Customers)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Customers';
                Image = CustomerList;
                RunObject = page "Customer List";
                ToolTip = 'View or edit customer information';
            }
            action("Bank Account")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Bank Acount';
                Image = Bank;
                RunObject = page "Bank Account List";
                ToolTip = 'view or edit bank account';
            }
        }
    }
}
profile PaygateManagement
{
    ProfileDescription = 'Paygate Management';
    RoleCenter = "Paygate Role Center";
    Caption = 'Paygate Management';
}