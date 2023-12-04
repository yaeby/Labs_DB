USE master
GO

ALTER TRIGGER SourceDataTrg
ON SourceData
AFTER INSERT, UPDATE, DELETE
AS
BEGIN

	DECLARE @AccountName NVARCHAR(255);
	DECLARE @Quantity INT;

	SELECT
        @AccountName = AccountName,
        @Quantity = Quantity
    FROM SourceData;

    IF EXISTS (SELECT 1 FROM AccountBalance WHERE AccountName = (SELECT AccountName FROM inserted))
BEGIN
    -- Update the existing record

    UPDATE AccountBalance
    SET TotalBalance = TotalBalance + @Quantity
    WHERE AccountName = @AccountName;
	PRINT 'YES EXISTS'
END
ELSE
BEGIN
    -- Insert a new record
    INSERT INTO AccountBalance (AccountName, TotalBalance)
    VALUES (@AccountName, @Quantity);
	PRINT 'SORRY DIDT FOUND :('
END;
END
GO