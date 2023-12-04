WITH CTE AS (
    SELECT 
        P.BusinessEntityID, 
        P.FirstName, 
        P.LastName, 
        EA.EmailAddress, 
        PP.PhoneNumber
    FROM Person.Person AS P
    LEFT JOIN Person.EmailAddress AS EA ON P.BusinessEntityID = EA.BusinessEntityID
    LEFT JOIN Person.PersonPhone AS PP ON P.BusinessEntityID = PP.BusinessEntityID
    WHERE 
        EA.EmailAddress IS NULL OR 
        PP.PhoneNumber IS NULL
)

SELECT 
    BusinessEntityID, 
    FirstName, 
    LastName, 
    EmailAddress, 
    PhoneNumber
INTO #TempResult
FROM CTE;

SELECT * FROM #TempResult;

DROP TABLE #TempResult;
