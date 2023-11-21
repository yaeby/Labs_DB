ALTER PROCEDURE getProduct
    @SafetyStockThreshold INT
AS
BEGIN
    SELECT *
    FROM Production.Product
    WHERE SafetyStockLevel >= @SafetyStockThreshold;
END;
