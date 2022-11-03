
pageextension 50400 SalesSertp extends "Sales & Receivables Setup"
{
    layout
    {
        // Add changes to page layout here
        addafter(Archiving)
        {
            field("Loan Nos"; rec."Loan Nos")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}