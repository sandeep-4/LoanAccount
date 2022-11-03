pageextension 50403 BankAcc extends "Bank Account Card"
{
    layout
    {
        // Add changes to page layout here
        addafter("Bank Acc. Posting Group")
        {
            field("Bank Acc Pos Grp"; rec."Bank Acc Pos Grp")
            {
                ApplicationArea = All;
                Caption = 'Bank Acc. Posting Group';
                // FieldPropertyName = FieldPropertyValue;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        //      lbl := Format("Bank Type"::Loan);
        //
    end;

    trigger OnInsertRecord(b: Boolean): Boolean
    var
        myInt: Integer;
    begin
        // if lbl = 'Loan' then
        //     "Bank Type" := "Bank Type"::Loan
        // else
        //     "Bank Type" := "Bank Type"::Bank;

    end;

    trigger OnNewRecord(b: Boolean)
    var
        myInt: Integer;
    begin
        //  "Bank Type" := "Bank Type"::Loan;
    end;

    var
        myInt: Integer;
        lbl: Text[20];

    //bank: Text[20]''
}