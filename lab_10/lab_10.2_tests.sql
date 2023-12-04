--Testing the trigger
USE master
GO


SET NOCOUNT ON

INSERT INTO SourceData(AccountName, Quantity)
VALUES('Copta Adrian', 0)

INSERT INTO SourceData(AccountName, Quantity)
VALUES('Cristiano Ronaldo', 500)

UPDATE SourceData
SET Quantity = Quantity + 500
WHERE AccountName LIKE 'Copta Adrian'


DELETE FROM SourceData
WHERE AccountName LIKE 'Copta Adrian'

DELETE FROM SourceData
WHERE AccountName LIKE 'Cristiano Ronaldo'

DELETE FROM SourceData
DELETE FROM AccountBalance

SELECT * FROM SourceData
SELECT * FROM AccountBalance