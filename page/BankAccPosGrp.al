pageextension 50409 BankAccGrp extends "Bank Account Posting Groups"
{
    layout
    {
        // Add changes to page layout here
        addafter("G/L Account No.")
        {
            field(Type; Rec.Type)
            {
                ApplicationArea = All;
                // FieldPropertyName = FieldPropertyValue;
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