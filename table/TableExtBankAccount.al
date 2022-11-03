tableextension 50400 BankAccExt extends "Bank Account"
{


    fields
    {
        modify("No.")
        {
            trigger OnAfterValidate()
            var
                SalesSetup: Record "Sales & Receivables Setup";
                NoSeriesMgmt: Codeunit NoSeriesManagement;
            begin
                if "Bank Type" = "Bank Type"::"Bank" then begin
                    IF "No." <> xRec."No." THEN BEGIN
                        SalesSetup.GET;
                        SalesSetup.TESTFIELD(SalesSetup."Loan Nos");
                        NoSeriesMgmt.TestManual(SalesSetup."Loan Nos");
                        //"No. Series" := '';
                        NoSeriesMgmt.SetSeries("No.");
                    END;

                end;
            end;
        }

        // Add changes to table fields here
        // field(50001; "Bank Type"; Enum BankType)
        // {
        //     DataClassification = ToBeClassified;
        // }

        field(50001; "Bank Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Bank","Loan";
        }

        field(50002; "Bank Acc Pos Grp"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Bank Type" = const(Bank)) "Bank Account Posting Group" where(Type = const(Bank))
            else
            if ("Bank Type" = const(Loan)) "Bank Account Posting Group" where(Type = const(loan));

            trigger OnValidate()
            var
                myInt: Integer;
            begin
                Validate("Bank Acc. Posting Group", "Bank Acc Pos Grp");
            end;
        }
    }



    var
        myInt: Integer;
        BankAcc: Page "Bank Account List";

    trigger OnBeforeInsert()
    var
        myInt: Integer;
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgmt: Codeunit NoSeriesManagement;
    begin
        if "Bank Type" = "Bank Type"::Loan then begin
            IF "No." = '' THEN BEGIN
                SalesSetup.GET;
                SalesSetup.TESTFIELD(SalesSetup."Loan Nos");
                CLEAR(NoSeriesMgmt);
                NoSeriesMgmt.InitSeries(SalesSetup."Loan Nos", xRec."No. Series", 0D, "No.", Rec."No. Series");
            END;
        end;
    end;
}