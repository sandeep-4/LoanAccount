tableextension 50408 BankAccPostGrp extends "Bank Account Posting Group"
{
    fields
    {
        // Add changes to table fields here
        field(50001; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Bank","Loan";
        }
    }

    var
        myInt: Integer;
}