SELECT p.*
FROM Person.Person p
LEFT JOIN Person.EmailAddress e ON p.BusinessEntityID = e.BusinessEntityID
WHERE e.BusinessEntityID IS NULL;
