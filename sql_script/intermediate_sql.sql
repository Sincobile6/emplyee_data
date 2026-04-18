--SQL INTERMEDIATE QUESTIONS 

-- JOINS (combines tables through common column)

select * from [SQL_Tutorial].[dbo].[EmployeeDemographics]
select * from [SQL_Tutorial].[dbo].[EmployeeSalary]

--inner join
--Write a query to return all columns from both EmployeeDemographics and EmployeeSalary where the EmployeeID matches in both tables.

select * from [SQL_Tutorial].[dbo].[EmployeeDemographics]
inner join [SQL_Tutorial].[dbo].[EmployeeSalary]
on [SQL_Tutorial].[dbo].[EmployeeDemographics].EmployeeID = [SQL_Tutorial].[dbo].[EmployeeSalary].EmployeeID

 
--Write a query to calculate the average salary of employees with the JobTitle 'Salesman'.

select JobTitle,  AVG (Salary) as average_salary  from [SQL_Tutorial].[dbo].[EmployeeDemographics]
inner join [SQL_Tutorial].[dbo].[EmployeeSalary]
on [SQL_Tutorial].[dbo].[EmployeeDemographics].EmployeeID = [SQL_Tutorial].[dbo].[EmployeeSalary].EmployeeID
where JobTitle= 'Salesman'
group by Jobtitle

--Write a query to display EmployeeID, FirstName, LastName, JobTitle, and Salary using an INNER JOIN.

select [SQL_Tutorial].[dbo].[EmployeeDemographics].EmployeeID, FirstName, LastName, JobTitle, Salary
from [SQL_Tutorial].[dbo].[EmployeeDemographics]
inner join [SQL_Tutorial].[dbo].[EmployeeSalary]
on [SQL_Tutorial].[dbo].[EmployeeDemographics].EmployeeID = [SQL_Tutorial].[dbo].[EmployeeSalary].EmployeeID

--Write a query to return all employees except those named Michael, ordered by salary in descending order.

select [SQL_Tutorial].[dbo].[EmployeeDemographics].EmployeeID, FirstName, LastName, JobTitle, Salary
from [SQL_Tutorial].[dbo].[EmployeeDemographics]
inner join [SQL_Tutorial].[dbo].[EmployeeSalary]
on [SQL_Tutorial].[dbo].[EmployeeDemographics].EmployeeID = [SQL_Tutorial].[dbo].[EmployeeSalary].EmployeeID
where FirstName <> 'Michael'
order by Salary Desc

--full outer join

--Write a query to return all records from both tables, including unmatched rows from either table.

select * from [SQL_Tutorial].[dbo].[EmployeeDemographics]
full outer join [SQL_Tutorial].[dbo].[EmployeeSalary]
on [SQL_Tutorial].[dbo].[EmployeeDemographics].EmployeeID = [SQL_Tutorial].[dbo].[EmployeeSalary].EmployeeID

select [SQL_Tutorial].[dbo].[EmployeeDemographics].EmployeeID, FirstName, LastName, JobTitle, Salary
from [SQL_Tutorial].[dbo].[EmployeeDemographics]
full outer join [SQL_Tutorial].[dbo].[EmployeeSalary]
on [SQL_Tutorial].[dbo].[EmployeeDemographics].EmployeeID = [SQL_Tutorial].[dbo].[EmployeeSalary].EmployeeID

--right outer join

--Write a query to return all records from EmployeeSalary and matching records from EmployeeDemographics.

select * from [SQL_Tutorial].[dbo].[EmployeeDemographics]
right outer join [SQL_Tutorial].[dbo].[EmployeeSalary]
on [SQL_Tutorial].[dbo].[EmployeeDemographics].EmployeeID = [SQL_Tutorial].[dbo].[EmployeeSalary].EmployeeID

select [SQL_Tutorial].[dbo].[EmployeeDemographics].EmployeeID, FirstName, LastName, JobTitle, Salary
from [SQL_Tutorial].[dbo].[EmployeeDemographics]
right outer join [SQL_Tutorial].[dbo].[EmployeeSalary]
on [SQL_Tutorial].[dbo].[EmployeeDemographics].EmployeeID = [SQL_Tutorial].[dbo].[EmployeeSalary].EmployeeID

--left outer join

--Write a query to return all records from EmployeeDemographics and matching records from EmployeeSalary.

select * from [SQL_Tutorial].[dbo].[EmployeeDemographics]
left outer join [SQL_Tutorial].[dbo].[EmployeeSalary]
on [SQL_Tutorial].[dbo].[EmployeeDemographics].EmployeeID = [SQL_Tutorial].[dbo].[EmployeeSalary].EmployeeID

select [SQL_Tutorial].[dbo].[EmployeeDemographics].EmployeeID, FirstName, LastName, JobTitle, Salary
from [SQL_Tutorial].[dbo].[EmployeeDemographics]
left outer join [SQL_Tutorial].[dbo].[EmployeeSalary]
on [SQL_Tutorial].[dbo].[EmployeeDemographics].EmployeeID = [SQL_Tutorial].[dbo].[EmployeeSalary].EmployeeID

--unions (data is not seperated out)

--Write a query to combine rows from EmployeeDemographics and WareHouseEmployeeDemographics without duplicates.

select * FROM [SQL_Tutorial].[dbo].[EmployeeDemographics]
union
select * FROM [SQL_Tutorial].[dbo].[WareHouseEmployeeDemographics]

--Write a query to combine rows from the same tables including duplicates, and sort by EmployeeID.

select * FROM [SQL_Tutorial].[dbo].[EmployeeDemographics]
union all
select * FROM [SQL_Tutorial].[dbo].[WareHouseEmployeeDemographics]
order by EmployeeID


select EmployeeID, FirstName, Age FROM [SQL_Tutorial].[dbo].[EmployeeDemographics]
union
select EmployeeID, JobTitle, Salary FROM [SQL_Tutorial].[dbo].[EmployeeSalary]

--a join to contrast the difference between a union and a join
select * from [SQL_Tutorial].[dbo].[EmployeeDemographics]
full outer join [SQL_Tutorial].[dbo].[WareHouseEmployeeDemographics]
on  [SQL_Tutorial].[dbo].[EmployeeDemographics].EmployeeID= [SQL_Tutorial].[dbo].[WareHouseEmployeeDemographics].EmployeeID

--Case Statements ( allows to specify condition and what is returned if condition is met)

--Write a query to categorize employees as: ('old' if Age > 30,  'young' otherwise)

SELECT FirstName, LastName, Age,
 case 
 when Age >30 then 'old'
 else 'young'
 end
  FROM [SQL_Tutorial].[dbo].[EmployeeDemographics]
  where Age is not null
  order by Age
  
  --Modify the query to:('old' if Age > 30, 'young' if Age is between 27 and 30, 'baby' otherwise)

  SELECT FirstName, LastName, Age,
 case 
 when Age >30 then 'old'
 when Age between 27 and 30 then 'young'
 else 'baby'
 end
  FROM [SQL_Tutorial].[dbo].[EmployeeDemographics]
  where Age is not null
  order by Age

  --Write a query to calculate a new salary:

--Write a query to calculate a new salary: (Salesman → +10%,Accountant → +5%, HR → +0.000001% ,Others → +3%)

--Name the new column Salary_After_Raise.

  select FirstName, LastName, JobTitle, Salary,
  case
  when JobTitle = 'salesman' then Salary + (salary* .10)
  when JobTitle ='accountant' then Salary + (Salary * .05)
  when JobTitle = 'HR' then Salary + (Salary * .000001)
  else Salary + (Salary * .03)
  end as Salary_After_Raise
 from  [SQL_Tutorial].[dbo].[EmployeeDemographics]
  join [SQL_Tutorial].[dbo].[EmployeeSalary]
  on [SQL_Tutorial].[dbo].[EmployeeDemographics].EmployeeID = [SQL_Tutorial].[dbo].[EmployeeSalary].EmployeeID


  --Having Clause

  --Write a query to count how many employees are in each JobTitle, but only show job titles that appear more than once.

  select JobTitle, Count(JobTitle)
  from  [SQL_Tutorial].[dbo].[EmployeeDemographics]
  join [SQL_Tutorial].[dbo].[EmployeeSalary]
  on [SQL_Tutorial].[dbo].[EmployeeDemographics].EmployeeID = [SQL_Tutorial].[dbo].[EmployeeSalary].EmployeeID
  group by JobTitle
  having count(Jobtitle)>1

  --Write a query to return job titles where the average salary is greater than 45,000, sorted by average salary.

  select JobTitle, Avg(Salary)
  from  [SQL_Tutorial].[dbo].[EmployeeDemographics]
  join [SQL_Tutorial].[dbo].[EmployeeSalary]
  on [SQL_Tutorial].[dbo].[EmployeeDemographics].EmployeeID = [SQL_Tutorial].[dbo].[EmployeeSalary].EmployeeID
  group by JobTitle
  having AVG(salary)> 45000
  order by AVG(Salary)

  --updating and deleting data

  select * from [SQL_Tutorial].[dbo].[EmployeeDemographics]

  update [SQL_Tutorial].[dbo].[EmployeeDemographics]
  set EmployeeID=1012, Age=31, Gender= 'Female'
  where FirstName ='holly' and LastName='Flax'

  --note that a delete statement cannot be reversed

  delete from [SQL_Tutorial].[dbo].[EmployeeDemographics]
  where employeeID=1005


  --Aliasing (changing table name to read script more easily, ## more used in aggregate functions)
  --refrain from using a, b , c = No context
  
  select FirstName 
  from [SQL_Tutorial].[dbo].[EmployeeDemographics]

  select FirstName as FN 
  from [SQL_Tutorial].[dbo].[EmployeeDemographics]

  select FirstName +'  ' +LastName  as FullName 
  from [SQL_Tutorial].[dbo].[EmployeeDemographics]

  select demo.EmployeeID, Sal.Salary
  from [SQL_Tutorial].[dbo].[EmployeeDemographics] as demo
  join [SQL_Tutorial].[dbo].[EmployeeSalary] as Sal
  on demo.EmployeeID= Sal.EmployeeID

  --Partition by 


  select FirstName, LastName, Gender, Salary,
  count(gender) over (partition by Gender) as Total_Gender
  from [SQL_Tutorial].[dbo].[EmployeeDemographics] as dem
join [SQL_Tutorial].[dbo].[EmployeeSalary] as sal
on dem.EmployeeID=sal.EmployeeID

select  Gender, 
  count(gender) 
  from [SQL_Tutorial].[dbo].[EmployeeDemographics] as dem
join [SQL_Tutorial].[dbo].[EmployeeSalary] as sal
on dem.EmployeeID=sal.EmployeeID
group by  Gender


 