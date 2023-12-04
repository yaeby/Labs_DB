select
dbo.getThreadNumber(Employee.BusinessEntityID, 5) as ThreadNumber,
count(*)
from HumanResources.Employee
group by dbo.getThreadNumber(Employee.BusinessEntityID, 5);