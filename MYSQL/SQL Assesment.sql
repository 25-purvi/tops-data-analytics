Create database School;
use School;

create table students(
	student_id int primary key, 
    name Varchar(45), 
    country varchar(45), 
    registration_date date
);
INSERT INTO students (student_id, name, country, registration_date) VALUES
(1, 'Alice Johnson', 'USA', '2023-01-10'),
(2, 'Rahul Mehta', 'India', '2023-02-15'),
(3, 'Maria Lopez', 'Spain', '2023-03-05'),
(4, 'James Smith', 'UK', '2023-01-20'),
(5, 'Sofia Rossi', 'Italy', '2023-04-01'),
(6, 'Chen Wei', 'China', '2023-05-12'),
(7, 'Ahmed Khan', 'Pakistan', '2023-06-18'),
(8, 'Emily Brown', 'Canada', '2023-07-25'),
(9, 'Hiroshi Tanaka', 'Japan', '2023-08-02'),
(10, 'Laura Müller', 'Germany', '2023-09-14');

create table courses(
	course_id int primary key, 
    title Varchar(45), 
    subject varchar(45), 
    level varchar(45)
    );
INSERT INTO courses (course_id, title, subject, level) VALUES
(101, 'Python Basics', 'Programming', 'Beginner'),
(102, 'Advanced Python', 'Programming', 'Intermediate'),
(103, 'Data Science 101', 'Data Science', 'Beginner'),
(104, 'Machine Learning', 'Data Science', 'Advanced'),
(105, 'UI/UX Design', 'Design', 'Beginner'),
(106, 'Graphic Design Pro', 'Design', 'Intermediate'),
(107, 'Business Analytics', 'Business', 'Intermediate'),
(108, 'Digital Marketing', 'Business', 'Beginner'),
(109, 'Cloud Computing', 'IT', 'Intermediate'),
(110, 'Cybersecurity Basics', 'IT', 'Beginner');

create table enrollments(
	student_id int,
    course_id int ,
    enrollment_date date,
    primary key (student_id,course_id),
    foreign key(student_id) references students(student_id),
    foreign key(course_id) references courses(course_id)
    );
INSERT INTO enrollments (student_id, course_id, enrollment_date) VALUES
(1, 101, '2023-02-01'),
(2, 103, '2023-03-01'),
(3, 101, '2023-02-20'),
(4, 104, '2023-04-05'),
(5, 105, '2023-05-12'),
(6, 102, '2023-03-18'),
(7, 103, '2023-04-22'),
(8, 109, '2023-06-01'),
(9, 108, '2023-07-11'),
(10, 110, '2023-08-05');

create table progress(
	student_id int,
    course_id int ,
    completed_percent decimal(10,2),
    last_accessed varchar(45),
    primary key(student_id,course_id),
    foreign key (student_id) references students(student_id),
    foreign key (course_id) references courses(course_id)
    );
INSERT INTO progress (student_id, course_id, completed_percent, last_accessed) VALUES
(1, 101, 90, '2023-08-01'),
(1, 102, 60, '2023-08-15'),
(2, 103, 75, '2023-09-01'),
(2, 104, 85, '2023-09-10'),
(3, 105, 40, '2023-07-20'),
(4, 106, 95, '2023-09-02'),
(5, 107, 88, '2023-08-25'),
(6, 108, 50, '2023-09-05'),
(7, 109, 100, '2023-09-08'),
(8, 110, 30, '2023-09-12');

select * from students;
select * from enrollments;
select * from progress;
select * from courses;

/*1.Find the most popular course per subject (by enrollments).*/

select
	c.subject,
    c.title,
    count(e.student_id) as Total_Enrollments
	from courses c
	join enrollments e
	on c.course_id = e.course_id
	group by c.subject,
			c.title
	having count(e.student_id) = (
		select max(cnt)
			from(
			select count(e2.student_id) as cnt
				from courses c2
				join enrollments e2
				on c2.course_id = e2.course_id
				where c2.subject = c.subject
                group by c2.title
				) as sub
	);
    
/*2.List students who completed more than 80% in at least 3 courses*/

select
	progress.student_id,
    students.name,
    count(*) as "more 80"
from progress 
join students
on progress.student_id = students.student_id
where progress.completed_percent > 80.00
group by progress.student_id,students.name
having count(*) >=1
;

/*Calculate average course completion by level (e.g., beginner, intermediate).*/

select
	courses.level,
    avg(progress.completed_percent) as Avg_Completion
from progress
join courses
on courses.course_id = progress.course_id
group by courses.level;

/*Identify students inactive for more than 60 days.*/

select
	students.student_id,
    students.name,
    max(progress.last_accessed) as Last_Seen
from students
join progress
on students.student_id = progress.student_id
group by students.student_id,
		students.name
having datediff(curdate(),max(progress.last_accessed))>60
;

/*Determine the subject with the highest average completion rate.*/

select
	courses.subject,
    avg(progress.completed_percent) as avg_completion
from progress
join courses
on courses.course_id = progress.course_id
group by courses.subject
order by avg_completion desc
limit 1;
