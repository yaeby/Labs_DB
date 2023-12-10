SELECT 
    p.FirstName,
    p.LastName,
    pp.PhoneNumber
FROM 
    Person.Person AS p
JOIN 
    Person.PersonPhone AS pp ON p.BusinessEntityID = pp.BusinessEntityID
JOIN 
    Person.PhoneNumberType AS pnt ON pp.PhoneNumberTypeID = pnt.PhoneNumberTypeID
WHERE 
    p.PersonType = 'EM' 
    AND pnt.Name = 'Work';