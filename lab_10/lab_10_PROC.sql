ALTER PROCEDURE insertLegacy
    @LegacyValueID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @LegacyValue VARCHAR(255);
    DECLARE @LegacyValueInt INT;

    SELECT @LegacyValue = LegacyValue
    FROM SourceLegacyValues
    WHERE LegacyValueID = @LegacyValueID;

    IF @@ROWCOUNT > 0
    BEGIN
        -- Convert LegacyValue to INT
        BEGIN TRY
            SET @LegacyValueInt = CAST(@LegacyValue AS INT);
        END TRY
        BEGIN CATCH
            -- If conversion fails
            INSERT INTO Exceptions (LegacyValueID, ExceptionBody)
            VALUES (@LegacyValueID, 'Unable to insert LegacyValue');
            RETURN; 
        END CATCH

        -- Insert 
        INSERT INTO TargetLegacyValues (LegacyValueINT)
        VALUES (@LegacyValueInt);
    END
    ELSE
    BEGIN
        -- If no record found
        INSERT INTO Exceptions (LegacyValueID, ExceptionBody)
        VALUES (@LegacyValueID, 'No corresponding record found in SourceLegacyValues');
    END
END;