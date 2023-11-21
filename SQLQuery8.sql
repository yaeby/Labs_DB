SELECT DISTINCT
    p.FirstName,
    p.LastName,
    COALESCE(pp.PhoneNumber, '8-800-555-35-35') AS PhoneNumber
FROM 
    HumanResources.JobCandidate jc
JOIN 
    HumanResources.Employee e ON jc.BusinessEntityID = e.BusinessEntityID
JOIN 
    Person.Person p ON e.BusinessEntityID = p.BusinessEntityID
LEFT JOIN 
    Person.PersonPhone pp ON p.BusinessEntityID = pp.BusinessEntityID
LEFT JOIN 
    Person.PhoneNumberType pnt ON pp.PhoneNumberTypeID = pnt.PhoneNumberTypeID
WHERE 
    pnt.Name = 'Work' OR pnt.Name IS NULL;
