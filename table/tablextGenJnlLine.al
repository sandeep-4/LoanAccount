tableextension 50403 GenJnlLineext extends "Gen. Journal Line"
{
    fields
    {
        // Add changes to table fields here
        field(50401; "Document Class"; Option)
        {
            OptionMembers = " ",Bank,Loan,Customer;
        }

        field(50402; "Deocument No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Document Class" = const(Customer)) Customer
            else
            if ("Document Class" = const(Bank)) "Bank Account"
            else
            if ("Document Class" = const(Loan)) "Bank Account" where("Bank Type" = const(Loan));
        }

        field(50403; "Account Type1"; Enum "Gen. Journal Account Type")
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                if "Account Type1" = "Account Type1"::Loan then
                    Validate("Account Type", "Account Type"::"Bank Account");
            end;
        }

        field(50404; "Account No. 1"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = IF ("Account Type" = CONST("G/L Account")) "G/L Account" WHERE("Account Type" = CONST(Posting),
                                                                                          Blocked = CONST(false))
            ELSE
            IF ("Account Type1" = CONST(Customer)) Customer
            ELSE
            IF ("Account Type1" = CONST(Vendor)) Vendor
            ELSE
            IF ("Account Type1" = CONST("Bank Account")) "Bank Account" where("Bank Type" = const(Bank))
            ELSE
            IF ("Account Type1" = CONST("Fixed Asset")) "Fixed Asset"
            ELSE
            IF ("Account Type1" = CONST("IC Partner")) "IC Partner"
            ELSE
            IF ("Account Type1" = CONST(Employee)) Employee
            else
            if ("Account Type1" = const(loan)) "Bank Account" where("Bank Type" = const(Loan));

            trigger OnValidate()
            var
                myInt: Integer;
            begin
                Validate("Account No.", "Account No. 1");
            end;
        }

    }

    var
        myInt: Integer;
}