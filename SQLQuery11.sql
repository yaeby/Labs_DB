SELECT
    SUBSTRING(LoginID, CHARINDEX('\', LoginID) + 1, LEN(LoginID)) AS Username
FROM
    HumanResources.Employee;
