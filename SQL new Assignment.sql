create database SQL_newassignment
--****************************************************************************
--CREATE TABLE Employee_Table
USE SQL_newassignment
CREATE TABLE Employee_Table
	(
		Employee_id INT Primary Key,
		First_Name VARCHAR(50),
		Last_Name VARCHAR(50),
		Salary float, 
		joining_date int,
		Department VARCHAR(50)
	)

	alter table Employee_Table
	alter column joining_date DATETIME  

	select * from Employee_Table

	INSERT INTO  Employee_Table VALUES
    (1, 'Anika','Arora',100000, '2020-02-14 9:00:00','HR')

	INSERT INTO  Employee_Table VALUES
    (2, 'Veena','Verma',80000, '2011-06-15 9:00:00','Admin'),
    (3, 'Vishal','Singhal',300000, '2020-02-16 9:00:00','HR'),
    (4, 'Sushanth','Singh',500000, '2020-02-17 9:00:00','Admin'),
    (5, 'Bhupal','Bhati',500000, '2011-06-18 9:00:00','Admin'),
    (6, 'Dheeraj','Diwan',200000, '2011-06-19 9:00:00','Account'),
    (7, 'Karan','Kumar',75000, '2020-01-14 9:00:00','Account'),
    (8, 'Chandrika','Chauhan',90000, '2011-04-15 9:00:00','Admin')

--****************************************************************************
--CREATE TABLE Employee_Bonus
CREATE TABLE Employee_Bonus
	(
		Employee_ref_id INT,
		Bonus_Amount float,
		Bonus_date DATETIME,
		foreign key (Employee_ref_id) references Employee_Table(Employee_id)
	)

	select * from Employee_Bonus

	INSERT INTO  Employee_Bonus VALUES
    (1, 5000, '2020-02-16 0:00:00'),
	(2, 3000, '2011-06-16 0:00:00'),
	(3, 4000, '2020-02-16 0:00:00'),
	(1, 4500, '2020-02-16 0:00:00'),
	(2, 3500, '2011-06-16 0:00:00')

--****************************************************************************
--CREATE TABLE Employee_Title_table
CREATE TABLE Employee_Title_table
	(
		Employee_ref_id INT,
		Employee_Title VARCHAR(50),
		Affective_date DATETIME,
		foreign key (Employee_ref_id) references Employee_Table(Employee_id)
	)
		select * from Employee_Title_table

	INSERT INTO  Employee_Title_table VALUES
    (1, 'Manager', '2016-02-20 0:00:00'),
	(2, 'Executive', '2016-06-11 0:00:00'),
	(8, 'Executive', '2016-06-11 0:00:00'),
	(5, 'Manager', '2016-06-11 0:00:00'),
	(4, 'Asst.Manager', '2016-06-11 0:00:00'),
	(7, 'Executive', '2016-06-11 0:00:00'),
	(6, 'Lead', '2016-06-11 0:00:00'),
	(3, 'Lead', '2016-06-11 0:00:00')

--****************************************************************************
--****************************************************************************

--1.Display the FIRST_NAME from the Employee Table using the alias name as Employee_name.

	select FIRST_NAME from Employee_Table as Employee_name

--2.Display LAST_NAME from the Employee Table in upper case.

	select UPPER( LAST_NAME)as LAST_NAME from  Employee_Table 

--3.Display unique values of Department from the Employee table.
	
	select Department from Employee_Table as Department 
	GROUP by  Department		--> for each Dept (unique values of Department)
	
--4. Display the first three character of LAST_NAME from the Employee Table.

	select left(( LAST_NAME),3)  AS first_threE_character from  Employee_Table  -->left operator for first three character

--5. Display unique values of Department from the Employee table and print its length.

	select Department, len(Department) as length -->length calculation for dept
	from Employee_Table group by  Department	 -->for each Dept (unique values of Department)

--6. Display the FIRST_NAME and LAST_NAME from the Employee Table into
	--a single column as FULL_NAME. A space char should separate them.

	select CONCAT( FIRST_NAME, ' ', LAST_NAME) as FULL_NAME --> CONCAT used to add 2 columns or names
	from Employee_Table 
	
--7. Display all employee details from the Employee Table order by FIRST_NAME ascending.

	SELECT * FROM Employee_Table
	ORDER BY First_Name ASC			-->order by FIRST_NAME ascending

--8. Display all employee details ordered by FIRST_NAME ascending and DEPARTMENT descending.

	SELECT * FROM Employee_Table
	ORDER BY First_Name ASC , DEPARTMENT DESC	 -->ordered by FIRST_NAME ascending and DEPARTMENT descending

--9. Display details of employees with the first name as “VEENA '' and
	--“KARAN” from the Employee Table.
	
	SELECT First_Name FROM Employee_Table
	where First_Name =  'Veena'or First_Name = 'karan'  --  “VEENA '' and “KARAN” from the Employee Table.

--10. Display details of employees with DEPARTMENT name as “Admin”.

	SELECT * FROM Employee_Table
	where  DEPARTMENT = 'admin'  --> details of employees with DEPARTMENT name as “Admin”

--11. Display details of the employees whose FIRST_NAME contains ‘V’.

	SELECT First_Name FROM Employee_Table
	where  First_Name like 'V%'  --> details of the employees whose FIRST_NAME contains ‘V’

--12. Display details of the employees whose salary lies between 100000 and 500000.
	
	SELECT * FROM Employee_Table
	where  Salary between 100000 and 500000 --> details of the employees whose salary lies between 100000 and 500000

--13. Display details of the employees who have joined in February, 2020.

	SELECT * FROM Employee_Table
	where  joining_date >= 'February, 2020' --> details of the employees whose salary lies between 100000 and 500000

--14. Display employee names with salaries >= 50000 and <= 100000.

	SELECT * FROM Employee_Table
	where  Salary >= 50000 and Salary <= 100000 --> with salaries >= 50000 and <= 100000.

--15. Display the number of employees for each department in descending order.
	
	SELECT count(Employee_id) as Employee_id , Department 
	FROM Employee_Table
	group by  Department  --> the number of employees for each department in descending order
	
--16. Display details of employees who are also managers.
	

	Select * from  Employee_Table inner join Employee_Title_table
	on 	Employee_Table.Employee_id=Employee_Title_table.Employee_ref_id

--17. Display duplicate records having matching data in some fields of a table.

	SELECT * FROM Employee_Table full join Employee_Title_table
	--Select  * from  Employee_Table,Employee_Title_table
	 on Employee_Table.Employee_id=Employee_Title_table.Employee_ref_id
	
--18. Display only odd rows from a table.

	Select * from Employee_Table where (Employee_id % 2) = 1 --odd rows from a table.


--19. Clone a new table from the Employee Table.

	SELECT *
	INTO Employee_Table_1 --> new clone table
	FROM Employee_Table; --> orginal table

--20. Display the top 2 highest salaries from the table.
	
	select  * from Employee_Table 
	where salary in 
	(
	select distinct top 2 salary 
	from  Employee_Table 
	order by salary desc
	)

--21. Display the list of employees with the same salary.

	SELECT Employee_id,Department,First_Name,Last_Name, Salary
	FROM Employee_Table
	WHERE Salary IN (
    SELECT Salary
    FROM Employee_Table
    GROUP BY Salary
    HAVING COUNT(Salary) > 1
	) 


--22. Display the second highest salary from the table.


	SELECT MAX(SALARY) as second_max_salary FROM Employee_Table 
	WHERE SALARY < (SELECT MAX(SALARY) FROM Employee_Table);

--23. Display the first 50% records from a table

	Select * from Employee_Table

	WHERE Employee_ID <= (SELECT count(Employee_ID)/2 from Employee_Table);


--24. Display the departments that have less than 4 people in it.
	
	select Department, COUNT(employee_id) as no_of_people
	from Employee_Table
	group by Department
	having COUNT(*)<4

--25. Display all departments along with the number of people in there.

	select Department, COUNT(employee_id) as no_of_people
	from Employee_Table
	group by Department

--26. Display the name of employees having the highest salary in each department.

	SELECT *
	FROM Employee_Table
	WHERE ( salary) IN
    (
		SELECT  max(salary) as max_salary
		FROM Employee_Table
		GROUP BY Department
	 );
	
--27. Display the names of employees who earn the highest salary.	

	select first_name, salary
	from Employee_Table
	where Salary =
	(
	select MAX(salary) from Employee_Table
	)

--28. Display the average salaries for each department

	select Department, avg(salary)
	from Employee_Table
	group by Department

--29. Display the name of the employee who got the maximum bonus
	
	select CONCAT( FIRST_NAME, ' ', LAST_NAME) as Name_of_the_employee,Bonus_Amount
	from Employee_Table join Employee_Bonus
	on Employee_id = Employee_ref_id
		WHERE ( Bonus_Amount) IN
    (
		SELECT  max(Bonus_Amount) as max_Bonus_Amount
		FROM Employee_Bonus
	 );

--30. Display the first name and the title of the all the employees

	select  FIRST_NAME, Employee_Title
	from Employee_Table join Employee_Title_table
	on Employee_id = Employee_ref_id









