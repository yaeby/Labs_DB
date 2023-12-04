SELECT DISTINCT 
	StartDate,
	DATENAME(WEEKDAY, StartDate) as WeekDay_StartDay,
	dbo.getPbdDate(StartDate) as	PBDStartDate,
	DATENAME(WEEKDAY, dbo.getPbdDate(StartDate)) as WeekDay_PBDStartDay 
FROM Production.BillOfMaterials