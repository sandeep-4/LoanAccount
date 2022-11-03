pageextension 50411 CustList extends "Customer List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addafter("Customer Register")
        {
            action("Send SMS")
            {
                ApplicationArea = All;
                Image = SendAsPDF;
                Promoted = true;
                PromotedIsBig = true;
                trigger OnAction()
                begin
                    
                end;
            }
        }
    }

    var
        myInt: Integer;
}