create database alishba;
use alishba;

--Schema 01

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
    (1, 'HR'),
    (2, 'IT'),
    (3, 'Finance');
select * from Departments;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY identity,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT not null,
    Salary DECIMAL(10, 2),
    Foreign key (DepartmentID) references Departments (DepartmentID)
);
INSERT INTO Employees (FirstName, LastName, DepartmentID, Salary)
VALUES
    ('John', 'Doe', 1, 60000.00),
    ('Jane', 'Smith', 2, 55000.00),
    ('Mike', 'Johnson', 1, 65000.00),
    ('Emily', 'Williams', 3, 70000.00),
    ('David', 'Brown', 2, 50000.00),
    ('Sarah', 'Miller', 1, 62000.00),
    ('Chris', 'Wilson', 3, 75000.00),
    ('Anna', 'Jones', 2, 53000.00),
    ('Brian', 'Taylor', 1, 58000.00),
    ('Laura', 'Anderson', 3, 72000.00);

	select * from Employees;

create table Projects(
ProjectID int not null,
ProjectName varchar(255),
StartDate Date,
EmployeeID int not null,
Foreign key (EmployeeID) references Employees (EmployeeID)
);


insert into  Projects  ( ProjectID,ProjectName,StartDate ,EmployeeID) values (1,'Database','2023-12-19',2),
(2,'web application','2023-01-24',1),
 (4,'Frontend','2024-01-01',8),
 (1,'Database','2023-12-19',4),
(3,'Backend','2023-11-11',5),
(5,'Desktop application','2023-10-16',7),
(7,'Laravel ','2023-12-23',9),
(6,'Mobile application','2024-01-02',6),
(7,'Laravel ','2023-12-23',10),
(5,'Desktop application','2023-10-16',3);

select *from Projects; 
select * from Employees;
select * from Departments;

--Queries:
--5)
select * from Employees where Salary > 50000;
--6)
select emp.EmployeeID, emp.FirstName, emp.LastName, dept.DepartmentName from Employees emp
join Departments dept  on emp.DepartmentID=dept.DepartmentID;
--7)
select * from Employees where LastName like 's%';
--8)
select emp.EmployeeID, emp.FirstName, emp.LastName, proj.ProjectName, proj.ProjectID, proj.StartDate
from Employees emp join Projects proj on emp.EmployeeID=proj.EmployeeID where ProjectName like '%database%';
--9)
select SUM(Salary)as TotalSalary from Employees;
--10)
select DepartmentID, AVG(Salary) as AverageSalary from Employees group by DepartmentID ;
select AVG(Salary) as HighestSalary from Employees where DepartmentID = 3;


--Schema 02

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50)
);

INSERT INTO Courses (CourseID, CourseName)
VALUES
    (1, 'Introduction to Programming'),
    (2, 'Web Development Basics'),
    (3, 'Database Management'),
    (4, 'Data Structures and Algorithms'),
    (5, 'JavaScript Fundamentals'),
    (6, 'Mobile App Development'),
    (7, 'Software Engineering Principles'),
    (8, 'Networking Essentials'),
    (9, 'Artificial Intelligence Basics'),
    (10, 'Cybersecurity Fundamentals');

select * from Courses;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    GPA DECIMAL(3, 2),
	CourseID INT ,
	Foreign key (CourseID) references Courses (CourseID)
);

INSERT INTO Students (StudentID, FirstName, LastName, Age, GPA,CourseID)
VALUES
    (1, 'Alice', 'Johnson', 20, 3.75,3),
    (2, 'Bob', 'Smith', 22, 3.50,null),
    (3, 'Charlie', 'Davis', 21, 3.80,8),
    (4, 'Diana', 'Brown', 23, 3.90,2),
    (5, 'Eva', 'Miller', 20, 3.65,7),
    (6, 'Frank', 'Jones', 22, 3.70,null),
    (7, 'Grace', 'Wilson', 21, 3.85,1),
    (8, 'Henry', 'Anderson', 23, 3.95,2),    
    (9, 'Ivy', 'Taylor', 20, 3.60,10),
    (10, 'Jack', 'Clark', 22, 3.75,3);

select * from Students;
select * from Courses;

--Queries :
--1)
select std.StudentID,std.FirstName, std.LastName, c.CourseName from Students std 
left join Courses c on std.CourseID=c.CourseID ;
--2)
select std.StudentID,std.FirstName, std.LastName, c.CourseName from Students std 
join Courses c on std.CourseID=c.CourseID  where CourseName ='Web Development Basics';
--3)
select c.CourseID, c.CourseName from Courses c
left join Students std on c.CourseID=std.CourseID where std.CourseID is null;
--4)
select std.FirstName, std.LastName, c.CourseName from Students std 
join Courses c on std.CourseID=c.CourseID ;
--5)
select c.CourseName, COUNT(std.StudentID) as StudentCount from Courses c 
left join Students std  on c.CourseID=std.CourseID GROUP BY c.CourseName;


