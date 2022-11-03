tableextension 50405 BankLedEntry extends "Bank Account Ledger Entry"
{
    fields
    {
        // Add changes to table fields here

        field(50403; "Account Type1"; Enum "Gen. Journal Account Type")
        {
            DataClassification = ToBeClassified;
        }

        field(50404; "Account No. 1"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(50001; "Bank Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Bank","Loan";
        }
        field(50407; Class; Option)
        {
            // DataClassification = ToBeClassified;
            OptionMembers = "1","2";
            trigger OnValidate()
            var
                myInt: Integer;
            begin

            end;
        }
    
    }

    var
        myInt: Integer;
}