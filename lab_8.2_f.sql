ALTER FUNCTION getThreadNumber (@BusinessEntityID AS INT, @N AS INT)
RETURNS INT
AS
BEGIN
    DECLARE @ThreadID INT;
    SELECT @ThreadID = (@BusinessEntityID % @N) + 1;
    RETURN @ThreadID;
END
