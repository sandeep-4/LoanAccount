codeunit 50400 BankAcc
{
    trigger OnRun()
    begin



    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnPostBankAccOnAfterBankAccLedgEntryInsert', '', false, false)]
    local procedure OnBeforePostGenJnlLine(var BankAccountLedgerEntry: Record "Bank Account Ledger Entry")
    var
        LoanLed: Record "Loan Account Ledger";
    begin
        LoanLed.Init();
        LoanLed.TransferFields(BankAccountLedgerEntry);
        LoanLed.Insert();
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnBeforeInsertGlEntry', '', false, false)]
    local procedure OnBeforeInsertGlEntry(var GenJnlLine: Record "Gen. Journal Line"; var GLEntry: Record "G/L Entry")
    begin
        GLEntry."Account No. 1" := GenJnlLine."Account No. 1";
        GLEntry."Account Type1" := GenJnlLine."Account Type1";
        if GenJnlLine."Account Type1" = GenJnlLine."Account Type1"::Loan then
            GLEntry."Bank Type" := GLEntry."Bank Type"::Loan;
        if GenJnlLine."Account Type1" = GenJnlLine."Account Type1"::"Bank Account" then
            GLEntry."Bank Type" := GLEntry."Bank Type"::Bank;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnPostBankAccOnBeforeBankAccLedgEntryInsert', '', false, false)]
    local procedure OnPostBankAccOnBeforeBankAccLedgEntryInsert(var GenJournalLine: Record "Gen. Journal Line"; var BankAccountLedgerEntry: Record "Bank Account Ledger Entry")
    begin
        BankAccountLedgerEntry."Account No. 1" := GenJournalLine."Account No. 1";
        BankAccountLedgerEntry."Account Type1" := GenJournalLine."Account Type1";
        if GenJournalLine."Account Type1" = GenJournalLine."Account Type1"::Loan then
            BankAccountLedgerEntry."Bank Type" := BankAccountLedgerEntry."Bank Type"::Loan;
        if GenJournalLine."Account Type1" = GenJournalLine."Account Type1"::"Bank Account" then
            BankAccountLedgerEntry."Bank Type" := BankAccountLedgerEntry."Bank Type"::Bank;
    end;

    var
        myInt: Integer;
}