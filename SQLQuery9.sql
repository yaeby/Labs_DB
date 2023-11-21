SELECT 
    c.FirstName,
    c.LastName,
    (
        SELECT TOP 1 AddressID
        FROM SalesLT.CustomerAddress ca
        WHERE ca.CustomerID = c.CustomerID AND ca.AddressType = 'Main Office' 
    ) AS AddressID
FROM 
    SalesLT.Customer c;