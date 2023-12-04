DECLARE EmployeeCursor CURSOR SCROLL
    FOR SELECT BusinessEntityID, JobTitle FROM AdventureWorks2019.HumanResources.Employee
    WHERE JobTitle LIKE 'Production%';

DECLARE @BusinessEntityId INT;
DECLARE @JobTitle NVARCHAR(MAX);

OPEN EmployeeCursor;

FETCH FIRST FROM EmployeeCursor INTO @BusinessEntityId, @JobTitle;

WHILE @@FETCH_STATUS = 0
BEGIN
    -- Execute the InsertJournal procedure for the current row
    EXEC InsertJournal @BusinessEntityId;

    -- Fetch the next row
    FETCH NEXT FROM EmployeeCursor INTO @BusinessEntityId, @JobTitle;
END;

CLOSE EmployeeCursor;
DEALLOCATE EmployeeCursor;
