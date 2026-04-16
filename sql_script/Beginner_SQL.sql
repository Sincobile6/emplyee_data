--SQL beginner questions 

--(Select statement, top, distinct, count, as, max, min, avg)


--show everything from the table

select * from [SQL_Tutorial].[dbo].[EmployeeDemographics]

--display only first name and last names of the employees

select FirstName, LastName
from [SQL_Tutorial].[dbo].[EmployeeDemographics]

--show only 5 rows from the table

select  top(5)* from [SQL_Tutorial].[dbo].[EmployeeDemographics]

--show distinct First Names of the employees

select distinct (FirstName) 
from [SQL_Tutorial].[dbo].[EmployeeDemographics]

--show the unique genders in the data

select distinct (gender) 
from [SQL_Tutorial].[dbo].[EmployeeDemographics]

--count the number of last names we have

select count(LastName) As LastName_Count
from [SQL_Tutorial].[dbo].[EmployeeDemographics]


-- show the maximum salary of the employees

select max(Salary) As MAXIMUM_SALARY
from [SQL_Tutorial].[dbo].[EmployeeSalary]


-- display the minimum salary of the employees
select min(Salary) As MINIMUM_SALARY
from [SQL_Tutorial].[dbo].[EmployeeSalary]

--what is the average salary of the employees

select avg(Salary) As AVERAGE_SALARY
from [SQL_Tutorial].[dbo].[EmployeeSalary]

--(Where statement, =, <>, <, >, And, Or, Like, Null, Not Null, In)

--Show data where the first name of the employee is Jim

select* from [SQL_Tutorial].[dbo].[EmployeeDemographics]
where FirstName ='Jim'

--Show data where the first name of the employee is not Jim

select * from [SQL_Tutorial].[dbo].[EmployeeDemographics]
where FirstName <> 'Jim'

--display data for all the employees who are older than 30 years


select* from [SQL_Tutorial].[dbo].[EmployeeDemographics]
where Age>30

--display people who are less than 32 years old

select * from [SQL_Tutorial].[dbo].[EmployeeDemographics]
where Age<32

--show all males who are aged 32 and below

select *from [SQL_Tutorial].[dbo].[EmployeeDemographics]
where Age <= 32 And Gender = 'male'
--(And= both criterias will be met)

--(or= only one of the criteria has to be met)
select *from [SQL_Tutorial].[dbo].[EmployeeDemographics]
where Age <= 32 Or Gender = 'male'

--Display employees who have surnames starting with the letter S
select *from [SQL_Tutorial].[dbo].[EmployeeDemographics]
where LastName Like 'S%'

--Show employees whose surnames contain the letter S

select *from [SQL_Tutorial].[dbo].[EmployeeDemographics]
where LastName Like '%S%'

--
 select *from [SQL_Tutorial].[dbo].[EmployeeDemographics]
where LastName  is not null

select *from [SQL_Tutorial].[dbo].[EmployeeDemographics]
where LastName is null

--show data for Jim and Michael

select * from [SQL_Tutorial].[dbo].[EmployeeDemographics]
where FirstName IN ('Jim', 'Michael')

--(group by, order by)

--Show how many females and males we have 

select Gender, count(gender) as number_of_people
from [SQL_Tutorial].[dbo].[EmployeeDemographics]
group by gender

--Show how many females and males we have who are older than 31 years

select Gender, count(gender) as number_of_people
from [SQL_Tutorial].[dbo].[EmployeeDemographics]
where Age >31
group by gender

--display the ages of the employees in from oldest to youngest

select * from [SQL_Tutorial].[dbo].[EmployeeDemographics]
order by Age Desc

select Age, FirstName
from [SQL_Tutorial].[dbo].[EmployeeDemographics]
order by Age Desc

select Age
from [SQL_Tutorial].[dbo].[EmployeeDemographics]
order by Age Desc

