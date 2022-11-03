tableextension 50402 SalesRecExt extends "Sales & Receivables Setup"
{
    fields
    {
        // Add changes to table fields here
        field(50401; "Loan Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }

    var
        myInt: Integer;
}