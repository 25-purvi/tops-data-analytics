create database Module_3;
use module_3;
drop table employees;
Create table Employees(
	Empno INT NOT NULL,
	Ename VARCHAR(45) ,
	Job VARCHAR(45),
	Mgr INT NULL,
	Hiredate DATE,
	Sal DECIMAL(7,2),
	Comm DECIMAL(7,2),
	Deptno INT,
	PRIMARY KEY (Empno),
    foreign key (Deptno) references Departments(Deptno)
);
INSERT INTO employees 
VALUES
(7369, 'SMITH', 'CLERK', 7902, '1980-12-17', 800.00, NULL, 20),
(7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600.00, 300.00, 30),
(7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1250.00, 500.00, 30),
(7566, 'JONES', 'MANAGER', 7839, '1981-04-02', 2975.00, NULL, 20),
(7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', 1250.00, 1400.00, 30),
(7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850.00, NULL, 30),
(7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450.00, NULL, 10),
(7788, 'SCOTT', 'ANALYST', 7566, '1987-06-11', 3000.00, NULL, 20),
(7839, 'KING', 'PRESIDENT',NULL, '1981-11-17', 5000.00, NULL, 10),
(7844, 'TURNER', 'SALESMAN', 7698, '1981-08-09', 1500.00, 0.00, 30),
(7876, 'ADAMS', 'CLERK', 7788, '1987-07-13', 1100.00, NULL, 20),
(7900, 'JAMES', 'CLERK', 7698, '1981-03-12', 950.00, NULL, 30),
(7902, 'FORD', 'ANALYST', 7566, '1981-03-12', 3000.00, NULL, 20),
(7934, 'MILLER', 'CLERK', 7782, '1982-01-23', 1300.00, NULL, 10)
;

Create table Departments(
	Deptno int,
    Dname varchar(14),
    Loc varchar(13),
    primary key (Deptno)
);
INSERT INTO departments 
VALUES
(10, 'ACCOUNTING', 'NEW YORK'),
(20, 'RESEARCH', 'DALLAS'),
(30, 'SALES', 'CHICAGO'),
(40, 'OPERATIONS', 'BOSTON');

Create table Students(
	Rno int not null,
    Sname Varchar(14),
    City varchar(20),
    State varchar(20),
    primary key (Rno)
);

Create table Employees_log(
	Emp_id int not null,
    log_date date,
    New_Salary int,
    Action varchar(20)
);
/* 1. select unique job from emp table?*/
select distinct job from employees;

/*2. List the details of the emps in asc order of the dptnos and desc of jobs?*/
select * from employees
order by Deptno asc, job desc;

/*3. Display all the unique job groups in the descending order?*/
select distinct job from employees
order by job desc;

/*4. List the emps who joined before 1981.*/
Select * from employees
where Hiredate < "1980-12-31";

/*5. List the Empno, Ename, Sal, Daily sal of all emps in the asc order of Annsal.*/
select 
	Empno,
    Ename,
    Sal,
    (sal/30) as Daily_sal,
    (sal*12) as Annual_sal
from employees
order by Annual_sal asc;

/*6. List the Empno, Ename, Sal, Exp of all emps working for Mgr 7369.*/
select 
	Empno,
    Ename,
    Sal,
    (year(curdate())-year(Hiredate)) as Experience
 from employees
 where Mgr = 7369;
 
 /*7. Display all the details of the emps who’s Comm. Is more than their Sal?*/
 select * from employees
 where comm > sal;
 
 /*8. List the emps who are either ‘CLERK’ or ‘ANALYST’ in the Desc order.*/
 select * from employees
 where job in ("clerk","Analyst")
 order by job desc;
 
 /*9. List the emps Who Annual sal ranging from 22000 and 45000.*/
 select 
		Empno,
        Ename,
        Sal,
        (sal*12) as Annual_sal
from employees
where  (sal*12) between 22000 and 45000
order by Annual_sal asc;

/*10. List the Enames those are starting with ‘S’ and with five characters.*/
select * from employees
where Ename like "s____";
 
/*11. List the emps whose Empno not starting with digit78.*/
select * from employees
where Empno not like '78%';

/*12. List all the Clerks of Deptno 20.*/
select * from employees
where job = "cleark" and deptno = 20;

select * from employees;
/*13. List the Emps who are senior to their own MGRS.*/
select 
	e.Ename,
	e.Empno,
    e.Hiredate as E_Hiredate,
    e.Mgr,
    m.Hiredate As M_Hiredate
from employees as e
join employees as m
on e.mgr = m.Empno
where e.Hiredate < m.Hiredate;

/*14. List the Emps of Deptno 20 who’s Jobs are same as Deptno10.*/
select * from employees
where Deptno = 20 and job in ( select job from employees where Deptno = 10)
;

/*15. List the Emps who’s Salary is same as FORD or SMITH in desc order of Salary.*/

select * from employees
where sal in (select sal from employees
where ename in ("ford","smith"))
order by sal desc;

/*16. List the emps whose jobs same as SMITH or ALLEN.*/
select * from employees
where job in 
(select job from employees
where Ename in ("Smith","Allen"));

/*17. Any jobs of deptno 10 those that are not found in deptno 20.*/
select distinct job  from employees
where Deptno =10 and job not in (select distinct job from employees
where  Deptno = 20)
;

/*18. Find the highest sal of EMP table.*/
select max(sal) from employees;

/*19. Find details of highest paid employee.*/
select * from employees
where sal in (select max(sal) from employees);

/*20. Find the total salary given to the MGR.*/
select sum(sal) from employees
where job = "manager";

/*21. List the emps whose names contains ‘A’.*/
select * from employees
where Ename like "%A%";

/*22. Find all the emps who earn the minimum Salary for each job      wise in ascending order.*/
select * from employees as e
where sal in (
select min(sal) from employees
where job = e.job)
order by sal asc;

/*23. List the emps whose salary greater than Blake’s salary.*/
select * from employees
where sal > (select sal from employees
where ename = "blake");