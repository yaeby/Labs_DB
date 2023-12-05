ALTER PROCEDURE GetProductsByOccurrences(@countNumber AS INT)
AS
BEGIN
    WITH ProductOccurrences AS (
        SELECT
            p.ProductID,
            p.Name AS ProductName,
            COUNT(plph.ProductID) AS Occurrences,
            MAX(plph.ListPrice) AS MaxListPrice
        FROM
            Production.Product AS p
        JOIN
            Production.ProductListPriceHistory AS plph
        ON
            p.ProductID = plph.ProductID
        GROUP BY
            p.ProductID, p.Name
    )
    SELECT
        ProductID,
        ProductName,
        Occurrences,
        MaxListPrice
    FROM
        ProductOccurrences
    WHERE
        Occurrences = @countNumber;
END;
