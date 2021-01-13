xmlport 60600 "Payments"
{
    schema
    {
        textelement(RootNodeName)
        {
            tableelement(PaygateBuffer; "Paygate Buffer")
            {
                fieldelement(TransactionDate; PaygateBuffer."Transaction Date")
                {
                }
                fieldelement(EntryNo; PaygateBuffer."Entry No.")
                {
                }
                fieldelement(TransactionCode; PaygateBuffer."Transaction Code")
                {
                }
                fieldelement(PayerID; PaygateBuffer."Payer ID")
                {
                }
                fieldelement(Amount; PaygateBuffer.Amount)
                {
                }
                fieldelement(Description; PaygateBuffer.Description)
                {
                }
                fieldelement(PayerNames; PaygateBuffer."Payer Names")
                {
                }
                fieldelement(PaymentMode; PaygateBuffer."Payment Mode")
                {
                }
            }
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
}
