-- Declare a variable for @LegacyValueID
DECLARE @LegacyValueIDParam INT;

-- Set the value for @LegacyValueIDParam
SET @LegacyValueIDParam = 6; -- Replace 123 with the actual LegacyValueID you want to use

-- Execute the insertLegacy stored procedure
EXEC insertLegacy @LegacyValueID = @LegacyValueIDParam;
