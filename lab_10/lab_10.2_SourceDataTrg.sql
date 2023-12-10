USE master
GO

ALTER TRIGGER SourceDataTrg
ON SourceData
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT 1 FROM inserted)
    BEGIN
        -- Update existing records
        UPDATE ab
        SET TotalBalance = ab.TotalBalance + i.Quantity
        FROM AccountBalance ab
        INNER JOIN inserted i ON ab.AccountName = i.AccountName;

        -- Insert new records
        INSERT INTO AccountBalance (AccountName, TotalBalance)
        SELECT i.AccountName, i.Quantity
        FROM inserted i
        WHERE NOT EXISTS (SELECT 1 FROM AccountBalance ab WHERE ab.AccountName = i.AccountName);
        
        PRINT 'TRIGGER EXECUTED';
    END;
END;
GO
