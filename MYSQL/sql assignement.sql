use assignment;

create table company(
	CompanyID int primary key,
    CompanyName varchar(45), 
    Street varchar(45),
    City varchar(45),
    State varchar(2),
    Zip int
    );
INSERT INTO Company (CompanyID, CompanyName, Street, City, State, Zip) VALUES
(1, 'TechCorp', '123 MG Road', 'Mumbai', 'MH', '400001'),
(2, 'MarketCo', '45 Connaught Place', 'Delhi', 'DL', '110001'),
(3, 'FinServe', '78 Park Street', 'Kolkata', 'WB', '700016'),
(4, 'EduSmart', '89 JP Nagar', 'Bangalore', 'KA', '560078'),
(5, 'HealthPlus', '11 Charminar Road', 'Hyderabad', 'TG', '500002'),
(6, 'GreenEnergy', '45 Sector 17', 'Chandigarh', 'CH', '160017'),
(7, 'AgriWorld', '88 MG Marg', 'Pune', 'MH', '411001'),
(8, 'BuildWell', '66 Civil Lines', 'Jaipur', 'RJ', '302001'),
(9, 'SoftLogic', '22 Nehru Place', 'Delhi', 'DL', '110019'),
(10, 'DataCloud', '99 Hitech City', 'Hyderabad', 'TG', '500081');
drop table contact;
create table contact(
	contactID int,
    companyID int primary key,
    firstName varchar(45),
    lastName varchar (45),
    street varchar(45),
    city varchar(45),
    State varchar(2),
    Zip int,
    IsMain Boolean,
    Email varchar(45),
    Phone varchar(45)
);
INSERT INTO Contact (ContactID, CompanyID, FirstName, LastName, Street, City, State, Zip, IsMain, Email, Phone) VALUES
(1, 1, 'Raj', 'Sharma', '12 Lane 1', 'Mumbai', 'MH', '400001', TRUE, 'raj@techcorp.com', '9876543210'),
(2, 2, 'Priya', 'Mehta', '14 Lane 2', 'Mumbai', 'MH', '400002', FALSE, 'priya@techcorp.com', '9876500001'),
(3, 3, 'Amit', 'Verma', '5 CP Road', 'Delhi', 'DL', '110001', TRUE, 'amit@marketco.com', '9876500002'),
(4, 4, 'Sneha', 'Rao', '6 CP Lane', 'Delhi', 'DL', '110002', FALSE, 'sneha@marketco.com', '9876500003'),
(5, 5, 'Deepak', 'Singh', 'Park St 3', 'Kolkata', 'WB', '700016', TRUE, 'deepak@finserve.com', '9876500004'),
(6, 6, 'Anjali', 'Kapoor', 'Park St 4', 'Kolkata', 'WB', '700017', FALSE, 'anjali@finserve.com', '9876500005'),
(7, 7, 'Vikram', 'Seth', 'JP Nagar 1', 'Bangalore', 'KA', '560078', TRUE, 'vikram@edusmart.com', '9876500006'),
(8, 8, 'Meera', 'Joshi', 'Charminar 11', 'Hyderabad', 'TG', '500002', TRUE, 'meera@healthplus.com', '9876500007'),
(9, 9, 'Arjun', 'Nair', 'Sector 17', 'Chandigarh', 'CH', '160017', TRUE, 'arjun@greenenergy.com', '9876500008'),
(10, 10, 'Rohit', 'Kumar', 'MG Marg 88', 'Pune', 'MH', '411001', TRUE, 'rohit@agriworld.com', '9876500009');

create table contactEmployee(
	ContactEmployeeID int,
    ContactID int primary key,
    EmployeeID int,
	ContactDate date,
	Description varchar(100)
);
    
INSERT INTO ContactEmployee (ContactEmployeeID, ContactID, EmployeeID, ContactDate, Description) 
VALUES
(1, 1, 1, '2023-01-05', 'Initial meeting about TechCorp needs'),
(2, 2, 3, '2023-01-10', 'Discussed software requirements'),
(3, 3, 2, '2023-01-15', 'MarketCo budget discussion'),
(4, 4, 4, '2023-01-20', 'Follow-up call with Sneha'),
(5, 5, 5, '2023-01-25', 'Financial solutions demo'),
(6, 6, 6, '2023-02-01', 'Technical support query'),
(7, 7, 7, '2023-02-05', 'Education software proposal'),
(8, 8, 8, '2023-02-10', 'HealthPlus product pitch'),
(9, 9, 9, '2023-02-15', 'GreenEnergy project consultation'),
(10, 10, 10, '2023-02-20', 'AgriWorld sales meeting');

create table Employee(
	EmployeeID int primary key,
    FirstName varchar(45),
    LastName varchar(45),
	Salary int,
	HireDate date,
    JobTitle Varchar(45),
    Email varchar(45),
    Phone varchar(45)
    
);
INSERT INTO Employee (EmployeeID, FirstName, LastName, Salary, HireDate, JobTitle, Email, Phone) VALUES
(1, 'Karan', 'Patel', 55000.00, '2020-01-10', 'Manager', 'karan@marketco.com', '9811111111'),
(2, 'Simran', 'Kaur', 45000.00, '2021-02-15', 'Analyst', 'simran@marketco.com', '9811111112'),
(3, 'Ravi', 'Gupta', 60000.00, '2019-03-20', 'Developer', 'ravi@marketco.com', '9811111113'),
(4, 'Neha', 'Sharma', 50000.00, '2020-04-25', 'Sales Executive', 'neha@marketco.com', '9811111114'),
(5, 'Arjun', 'Reddy', 70000.00, '2018-05-30', 'HR Manager', 'arjun@marketco.com', '9811111115'),
(6, 'Pooja', 'Jain', 42000.00, '2022-06-10', 'Support Staff', 'pooja@marketco.com', '9811111116'),
(7, 'Aakash', 'Verma', 47000.00, '2021-07-14', 'Developer', 'aakash@marketco.com', '9811111117'),
(8, 'Shalini', 'Nair', 52000.00, '2020-08-18', 'Analyst', 'shalini@marketco.com', '9811111118'),
(9, 'Manoj', 'Iyer', 65000.00, '2019-09-22', 'Team Lead', 'manoj@marketco.com', '9811111119'),
(10, 'Tanya', 'Kapoor', 48000.00, '2021-10-01', 'Sales Executive', 'tanya@marketco.com', '9811111120');

/*In the Employee table, the statement that changes Lesley Bland’s phone number
to 215-555-8800*/
update employee
set Phone = "2155558800"
where firstname="arjun";

/*In the Company table, the statement that changes the name of “Urban
Outfitters, Inc.” to “Urban Outfitters” .*/
select *  from Company;

update company
set companyname = "Tata"
where companyid = 5;

/*In ContactEmployee table, the statement that removes Dianne Connor’s contact
event with Jack Lee (one statement).
HINT: Use the primary key of the ContactEmployee*/
select * from contactemployee;

delete from contactemployee
where contactID = 5;

/*Write the SQL SELECT query that displays the names of the employees that
have contacted Toll Brothers (one statement). Run the SQL SELECT query in
MySQL Workbench. Copy the results below as well.*/

select * from employee;
select * from company;
select*from contactemployee;
select * from contactemployee;
SELECT 
    c.CompanyName,
    e.FirstName,
    e.LastName
FROM Company c
LEFT JOIN Contact ct
    ON c.CompanyID = ct.CompanyID
LEFT JOIN ContactEmployee ce
    ON ct.ContactID = ce.ContactID
LEFT JOIN Employee e
    ON ce.EmployeeID = e.EmployeeID
WHERE c.CompanyName = 'FinServe';

/*8.What is the significance of “%” and “_” operators in the LIKE statement?

1. % (Percent Sign)
Represents zero, one, or many characters.

2. _ (Underscore)
Represents exactly one character.*/

/*9.Explain normalization in the context of databases.

Normalization is the process of organizing data in a database to reduce redundancy (duplicate data) and improve data integrity.
It involves breaking large, complex tables into smaller, related tables and defining relationships between them.*/

/*10.What does a join in MySQL mean?

A JOIN in MySQL is used to combine rows from two or more tables based on a related column between them 
(usually a primary key – foreign key relationship).

/*11.What do you understand about DDL, DCL, and DML in MySQL?

DDL (Data Definition Language)
Used to define and manage the structure of the database objects (tables, schemas, indexes, etc.).

DCL (Data Control Language)
Used to control access (permissions) to the database.

DML (Data Manipulation Language)
Used to manipulate or manage the data inside tables. */ 

/*Summary in One Line:
DDL = Defines database structure.
DML = Works with the data.
DCL = Controls permissions and access.*/

/*12.What is the role of the MySQL JOIN clause in a query, and what are some
common types of joins?

The JOIN clause in MySQL is used to combine rows from two or more tables based on a related column 
(usually a primary key in one table and a foreign key in another).

1.INNER JOIN
Returns rows that have matching values in both tables.

2.LEFT JOIN (LEFT OUTER JOIN)
Returns all rows from the left table and matching rows from the right.
If no match, right side shows NULL.

3.RIGHT JOIN (RIGHT OUTER JOIN)
Returns all rows from the right table and matching rows from the left.
If no match, left side shows NULL.

4.CROSS JOIN
Produces a Cartesian product (all combinations of rows).







