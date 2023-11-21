SELECT 
    c.FirstName,
    c.LastName,
    ca.AddressID
FROM 
    SalesLT.Customer c
LEFT JOIN (
    SELECT CustomerID, AddressID
    FROM SalesLT.CustomerAddress
    WHERE AddressType = 'Main Office' AND AddressID IS NOT NULL
) ca ON c.CustomerID = ca.CustomerID
WHERE ca.AddressID IS NOT NULL;
