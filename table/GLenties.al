tableextension 50407 GLExt extends "G/L Entry"
{
    fields
    {
        // Add changes to table fields here
        field(50401; "Bank Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Bank","Loan";
        }
        field(50403; "Account Type1"; Enum "Gen. Journal Account Type")
        {
            DataClassification = ToBeClassified;
        }

        field(50404; "Account No. 1"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
    }

    var
        myInt: Integer;
}