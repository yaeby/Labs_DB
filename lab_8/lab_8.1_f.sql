ALTER FUNCTION getPbdDate (@StartDate AS DATETIME)
RETURNS DATETIME
AS
BEGIN
    DECLARE @previousDate AS DATETIME
    DECLARE @dayWeek AS INT

    SELECT @dayWeek = DATEPART(weekday, @StartDate)

    IF @dayWeek <= 2
        SELECT @previousDate = DATEADD(DAY, -(@dayWeek + 1), @StartDate)
    ELSE
        SELECT @previousDate = DATEADD(DAY, -1, @StartDate)

    RETURN @previousDate;
END
