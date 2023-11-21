ALTER PROCEDURE InsertJournal
    @BusinessEntityId INT
AS
BEGIN
    DECLARE 
        @NationalIDNumber NVARCHAR(MAX),
        @JobTitle NVARCHAR(MAX),
        @BirthDate DATE,
        @FirstName NVARCHAR(MAX),
        @LastName NVARCHAR(MAX),
        @AnniversaryFlag NVARCHAR(1),
        @ThreadNumber INT,
        @EntryDatetime DATETIME2(7);

    SELECT 
        @NationalIDNumber = NationalIDNumber,
        @JobTitle = JobTitle,
        @BirthDate = BirthDate
    FROM AdventureWorks2019.HumanResources.Employee
    WHERE BusinessEntityID = @BusinessEntityId;

    SELECT 
        @FirstName = FirstName,
        @LastName = LastName
    FROM AdventureWorks2019.Person.Person
    WHERE BusinessEntityID = @BusinessEntityId;

    IF DATEDIFF(YEAR, @BirthDate, GETDATE()) % 10 = 0
        SET @AnniversaryFlag = 'Y'
    ELSE
        SET @AnniversaryFlag = 'N';

    SET @ThreadNumber = dbo.getThreadNumber(@BusinessEntityId, 5);

    SET @EntryDatetime = SYSDATETIME();

    INSERT INTO EmployeeJournal
    VALUES (
        @NationalIDNumber, 
        @JobTitle, 
        @BirthDate, 
        @AnniversaryFlag, 
        @FirstName, 
        @LastName, 
        @ThreadNumber, 
        @EntryDatetime
    );
END;
