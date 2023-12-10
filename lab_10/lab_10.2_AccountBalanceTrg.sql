USE master
GO

ALTER TRIGGER AccountBalanceTrg
ON AccountBalance
AFTER INSERT
AS
BEGIN

	 -- Delete entries with TotalBalance equal to 0
    DELETE FROM AccountBalance
    WHERE TotalBalance = 0;

    PRINT 'AccountBalanceTrg EXECUTED';
END;
GO