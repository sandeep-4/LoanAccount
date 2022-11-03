pageextension 50404 GenJnlLineExt extends "General Journal"
{
    layout
    {
        // Add changes to page layout here
        modify("Account Type")
        {
            Visible = false;
        }
        modify("Account No.")
        {
            Visible = false;
        }
        addafter("Account No.")
        {
            field("Account Type1"; Rec."Account Type1")
            {
                Caption = 'Account Type';
                ApplicationArea = All;
            }

            field("Account No. 1"; Rec."Account No. 1")
            {
                Caption = 'Account No.';
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