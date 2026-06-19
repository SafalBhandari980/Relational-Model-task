create database lms_db;
use lms_db;
create table students(
student_id int primary key auto_increment,
first_name varchar(50),
last_name varchar(50),
email varchar(100),
registration_date timestamp default current_timestamp,
country varchar(50));

create table instructors(
instructor_id int primary key auto_increment,
instructor_name varchar(100),
specialization varchar(100),
joining_date timestamp default current_timestamp);

create table courses(
course_id int auto_increment primary key,
course_name varchar(100),
category varchar(50),
course_fee decimal(10,2),
instructor_id int
);
alter table courses add constraint fk_inst_id foreign key(instructor_id) references instructors(instructor_id);

create table enrollments(
enrollment_id int auto_increment primary key,
student_id int,
course_id int,
enrollment_date timestamp default current_timestamp,
completion_status varchar(20));
drop table enrollments;
alter table enrollments add constraint fk_std_id foreign key(student_id) references students(student_id);
alter table enrollments add constraint fk_course_id foreign key(course_id) references courses(course_id);

create table assignments(
assignment_id int auto_increment primary key,
course_id int,
assignmnet_title varchar(100),
max_marks int,
due_date date
);
alter table assignments add constraint fk_crs_id foreign key(course_id) references courses(course_id);

create table assignment_submissions(
submission_id int auto_increment primary key,
assignment_id int,
student_id int,
marks_obtained int,
submission_date date);
alter table assignment_submissions add constraint fk_ass_id foreign key(assignment_id) references assignments(assignment_id);
alter table assignment_submissions add constraint fk_stddd_id foreign key(student_id) references students(student_id);

create table payments(payment_id int auto_increment primary key,
student_id int,
amount_paid decimal(10,2),
payment_date date,
payment_method varchar(20));
alter table payments add constraint fk_ste_id foreign key(student_id) references students(student_id);

INSERT INTO students (first_name, last_name, email, country)
VALUES
('Aarav','Shrestha','aarav.shrestha@example.com','Nepal'),
('Sita','Khadka','sita.khadka@example.com','Nepal'),
('Ramesh','Thapa','ramesh.thapa@example.com','India'),
('Maya','Rai','maya.rai@example.com','Nepal'),
('Prakash','Gurung','prakash.gurung@example.com','Bhutan'),
('Anjali','KC','anjali.kc@example.com','Nepal'),
('Dipesh','Magar','dipesh.magar@example.com','Nepal'),
('Sarita','Tamang','sarita.tamang@example.com','Nepal'),
('Nabin','Thapa','nabin.thapa@example.com','Nepal'),
('Sunita','Gurung','sunita.gurung@example.com','Nepal'),
('Kiran','Lama','kiran.lama@example.com','Nepal'),
('Ravi','Shrestha','ravi.shrestha@example.com','Nepal'),
('Sanjay','Adhikari','sanjay.adhikari@example.com','Nepal'),
('Milan','Koirala','milan.koirala@example.com','Nepal'),
('Pooja','Shah','pooja.shah@example.com','India'),
('Deepak','Joshi','deepak.joshi@example.com','Nepal'),
('Nisha','Bhandari','nisha.bhandari@example.com','Nepal'),
('Krishna','Maharjan','krishna.maharjan@example.com','Nepal'),
('Bikash','Basnet','bikash.basnet@example.com','Nepal'),
('Laxmi','Shrestha','laxmi.shrestha@example.com','Nepal');


INSERT INTO instructors (instructor_name, specialization)
VALUES
('Dr. Anil Sharma','Computer Science'),
('Prof. Sita Gurung','Mathematics'),
('Dr. Ramesh Koirala','Physics'),
('Prof. Maya Khadka','Business Management'),
('Dr. Prakash Rai','Data Science'),
('Prof. Sunita Lama','English Literature'),
('Dr. Dipesh Magar','Information Technology'),
('Prof. Sarita Tamang','Economics');


INSERT INTO courses (course_name, category, course_fee, instructor_id)
VALUES
('Python Programming','Computer Science',200.00,1),
('Database Systems','Computer Science',250.00,1),
('Linear Algebra','Mathematics',150.00,2),
('Business Analytics','Business',300.00,4),
('Physics Fundamentals','Physics',180.00,3),
('Data Science Basics','Data Science',350.00,5),
('English Composition','Literature',120.00,6),
('Microeconomics','Economics',200.00,8),
('Web Development','IT',280.00,7),
('Machine Learning','Data Science',400.00,5),
('Project Management','Business',220.00,4),
('Advanced SQL','Computer Science',270.00,1),
('Statistics','Mathematics',200.00,2),
('Cloud Computing','IT',320.00,7),
('Creative Writing','Literature',180.00,6);


INSERT INTO enrollments (student_id, course_id, completion_status)
VALUES
(1,1,'pending'),(2,2,'completed'),(3,3,'pending'),(4,4,'completed'),
(5,5,'pending'),(6,6,'pending'),(7,7,'completed'),(8,8,'pending'),
(9,9,'completed'),(10,10,'pending'),(11,11,'pending'),(12,12,'completed'),
(13,13,'pending'),(14,14,'completed'),(15,15,'pending'),(16,1,'pending'),
(17,2,'completed'),(18,3,'pending'),(19,4,'completed'),(20,5,'pending'),
(1,6,'pending'),(2,7,'completed'),(3,8,'pending'),(4,9,'completed'),
(5,10,'pending'),(6,11,'completed'),(7,12,'pending'),(8,13,'completed'),
(9,14,'pending'),(10,15,'completed'),(11,1,'pending'),(12,2,'completed'),
(13,3,'pending'),(14,4,'completed'),(15,5,'pending'),(16,6,'completed'),
(17,7,'pending'),(18,8,'completed'),(19,9,'pending'),(20,10,'completed'),
(1,11,'pending'),(2,12,'completed'),(3,13,'pending'),(4,14,'completed'),
(5,15,'pending'),(6,1,'completed'),(7,2,'pending'),(8,3,'completed');


INSERT INTO assignments (course_id, assignmnet_title, max_marks, due_date)
VALUES
(1,'Python Basics',100,'2026-07-01'),
(2,'SQL Queries',100,'2026-07-05'),
(3,'Matrix Problems',100,'2026-07-10'),
(4,'Business Case Study',100,'2026-07-12'),
(5,'Physics Lab Report',100,'2026-07-15'),
(6,'Data Cleaning',100,'2026-07-18'),
(7,'Essay Writing',100,'2026-07-20'),
(8,'Market Analysis',100,'2026-07-22'),
(9,'HTML Project',100,'2026-07-25'),
(10,'ML Model',100,'2026-07-28'),
(11,'Project Plan',100,'2026-07-30'),
(12,'Advanced Joins',100,'2026-08-02'),
(13,'Probability Problems',100,'2026-08-05'),
(14,'Cloud Setup',100,'2026-08-08'),
(15,'Short Story',100,'2026-08-10'),
(1,'Python Functions',100,'2026-08-12'),
(2,'Stored Procedures',100,'2026-08-15'),
(3,'Vector Spaces',100,'2026-08-18'),
(4,'Business Report',100,'2026-08-20'),
(5,'Physics Assignment',100,'2026-08-22'),
(6,'Data Visualization',100,'2026-08-25'),
(7,'Poetry Analysis',100,'2026-08-28'),
(8,'Economic Survey',100,'2026-08-30'),
(9,'CSS Styling',100,'2026-09-02'),
(10,'Regression Model',100,'2026-09-05'),
(11,'Risk Analysis',100,'2026-09-08'),
(12,'Triggers',100,'2026-09-10'),
(13,'Hypothesis Testing',100,'2026-09-12'),
(14,'Virtualization',100,'2026-09-15'),
(15,'Novel Review',100,'2026-09-18');



INSERT INTO assignments (course_id, assignment_title, max_marks, due_date) VALUES
(1,'Python Basics Assignment',100,'2026-02-15'),
(1,'Python Project',100,'2026-03-01'),
(2,'Data Cleaning Exercise',100,'2026-03-10'),
(2,'Exploratory Analysis',100,'2026-03-25'),
(3,'HTML/CSS Task',100,'2026-02-28'),
(3,'JavaScript Mini Project',100,'2026-03-20'),
(4,'SQL Queries Set',100,'2026-02-22'),
(4,'Database Design Task',100,'2026-03-18'),
(5,'ML Theory Quiz',100,'2026-04-01'),
(5,'Model Building Assignment',100,'2026-04-20'),
(6,'Cloud Basics Lab',100,'2026-03-30'),
(6,'Deploy App Exercise',100,'2026-04-25'),
(7,'Wireframe Assignment',100,'2026-03-12'),
(7,'Prototype Task',100,'2026-04-05'),
(8,'Security Fundamentals',100,'2026-04-10'),
(8,'Penetration Test Report',100,'2026-05-01'),
(9,'SE Case Study',100,'2026-03-28'),
(9,'Design Patterns Quiz',100,'2026-04-15'),
(10,'Neural Networks Assignment',100,'2026-05-10'),
(10,'DL Project',100,'2026-06-01'),
(11,'React Components Task',100,'2026-04-12'),
(11,'React App Project',100,'2026-05-05'),
(12,'NoSQL Modeling',100,'2026-04-20'),
(12,'Aggregation Exercises',100,'2026-05-10'),
(13,'CI/CD Pipeline Task',100,'2026-05-15'),
(13,'Infrastructure as Code',100,'2026-06-01'),
(14,'Product Research Assignment',100,'2026-04-18'),
(14,'Design Critique',100,'2026-05-08'),
(15,'Ethical Hacking Lab',100,'2026-05-20'),
(15,'Final Hacking Report',100,'2026-06-05');

-- 80 Assignment Submissions
-- We'll create multiple submissions per assignment by different students.
INSERT INTO assignment_submissions (assignment_id, student_id, marks_obtained, submission_date) VALUES
(1,1,92,'2026-02-14'),
(1,2,85,'2026-02-14'),
(1,3,78,'2026-02-15'),
(1,4,88,'2026-02-13'),
(2,1,95,'2026-02-28'),
(2,5,80,'2026-02-27'),
(2,6,70,'2026-03-01'),
(3,2,82,'2026-03-09'),
(3,3,76,'2026-03-10'),
(3,7,90,'2026-03-08'),
(4,1,89,'2026-03-24'),
(4,8,84,'2026-03-23'),
(4,9,77,'2026-03-25'),
(5,2,88,'2026-02-27'),
(5,10,73,'2026-02-28'),
(6,7,91,'2026-03-19'),
(6,11,79,'2026-03-20'),
(7,12,86,'2026-02-21'),
(7,13,74,'2026-02-22'),
(8,5,81,'2026-03-17'),
(8,14,69,'2026-03-18'),
(9,6,87,'2026-03-31'),
(9,15,90,'2026-03-30'),
(10,6,92,'2026-04-19'),
(10,16,78,'2026-04-20'),
(11,10,85,'2026-03-29'),
(11,17,80,'2026-03-30'),
(12,8,88,'2026-04-24'),
(12,18,75,'2026-04-23'),
(13,4,83,'2026-03-11'),
(13,19,79,'2026-03-12'),
(14,4,90,'2026-04-04'),
(14,20,72,'2026-04-05'),
(15,9,86,'2026-04-09'),
(15,11,81,'2026-04-10'),
(16,11,88,'2026-04-30'),
(16,12,76,'2026-05-01'),
(17,13,84,'2026-03-27'),
(17,14,70,'2026-03-28'),
(18,13,91,'2026-04-14'),
(18,15,82,'2026-04-15'),
(19,6,89,'2026-05-09'),
(19,16,77,'2026-05-08'),
(20,6,94,'2026-05-30'),
(20,17,85,'2026-05-29'),
(21,7,87,'2026-04-11'),
(21,18,78,'2026-04-12'),
(22,7,90,'2026-05-04'),
(22,19,83,'2026-05-03'),
(23,8,88,'2026-04-19'),
(23,20,75,'2026-04-20'),
(24,8,82,'2026-05-09'),
(24,1,79,'2026-05-08'),
(25,2,91,'2026-05-14'),
(25,3,80,'2026-05-13'),
(26,2,85,'2026-05-31'),
(26,4,76,'2026-05-30'),
(27,5,78,'2026-04-17'),
(27,9,84,'2026-04-16'),
(28,5,88,'2026-05-07'),
(28,10,73,'2026-05-06'),
(29,11,92,'2026-05-19'),
(29,12,81,'2026-05-18'),
(30,11,95,'2026-06-04'),
(30,13,86,'2026-06-03'),
(1,14,75,'2026-02-15'),
(2,15,82,'2026-02-28'),
(3,16,79,'2026-03-10'),
(4,17,68,'2026-03-18'),
(5,18,85,'2026-03-31'),
(6,19,77,'2026-04-19'),
(7,20,80,'2026-02-22'),
(8,1,83,'2026-03-17'),
(9,2,88,'2026-03-31'),
(10,3,90,'2026-04-19'),
(11,4,86,'2026-04-11'),
(12,5,74,'2026-04-24'),
(13,6,81,'2026-03-11'),
(14,7,79,'2026-04-04'),
(15,8,87,'2026-04-09'),
(16,9,92,'2026-04-30');


INSERT INTO payments (student_id, amount_paid, payment_date, payment_method) VALUES
(1,199.00,'2026-01-11','card'),
(1,299.00,'2026-02-01','card'),
(2,199.00,'2026-01-21','bank_transfer'),
(2,499.00,'2026-02-05','card'),
(3,299.00,'2026-02-11','card'),
(3,249.00,'2026-02-20','bank_transfer'),
(4,199.00,'2026-01-19','card'),
(4,149.00,'2026-03-06','card'),
(5,249.00,'2026-02-21','bank_transfer'),
(5,279.00,'2026-03-11','card'),
(6,399.00,'2026-03-13','card'),
(6,299.00,'2026-03-16','bank_transfer'),
(7,199.00,'2026-04-02','card'),
(7,299.00,'2026-04-06','card'),
(8,229.00,'2026-04-11','bank_transfer'),
(8,249.00,'2026-04-13','card'),
(9,299.00,'2026-02-26','card'),
(9,199.00,'2026-01-26','bank_transfer'),
(10,319.00,'2026-03-21','card'),
(10,149.00,'2026-03-23','card'),
(11,349.00,'2026-04-16','bank_transfer'),
(11,279.00,'2026-04-19','card'),
(12,229.00,'2026-04-21','card'),
(12,319.00,'2026-04-23','bank_transfer'),
(13,179.00,'2026-05-02','card'),
(13,229.00,'2026-05-04','card'),
(14,179.00,'2026-05-06','bank_transfer'),
(14,379.00,'2026-05-08','card'),
(15,199.00,'2026-01-31','card'),
(15,499.00,'2026-02-03','bank_transfer'),
(16,299.00,'2026-02-11','card'),
(16,249.00,'2026-02-13','card'),
(17,399.00,'2026-03-02','bank_transfer'),
(17,299.00,'2026-03-04','card'),
(18,149.00,'2026-03-11','card'),
(18,199.00,'2026-03-13','bank_transfer'),
(19,279.00,'2026-04-02','card'),
(19,319.00,'2026-04-04','card'),
(20,199.00,'2026-04-06','bank_transfer'),
(20,229.00,'2026-04-08','card');

select * from courses;

select concat(first_name,' ',last_name) as s_name from students s 
join courses c on s.student_id = c.course_id where
 c.course_fee  > (select avg(amount_paid) from payments);

select course_name from courses where course_fee > (select avg(course_fee) from courses);

select * from instructors;

select instructor_name from instructors i 
join courses c on i.instructor_name = c.instructor_id 
where c.course_fee = (select max(course_fee) from courses);

select concat(first_name, ' ',last_name) as s_name from students s 
join courses c on s.student_id = c.course_id where
c.course_fee = (select max(course_fee) from courses);

select * from assignments;

select assignmnet_title, max_marks from assignments 
where max_marks >= (select avg(max_marks) from assignments);



select * from assignment_submissions;

select * from students;

select concat(first_name,' ',last_name) as s_name from students 
where student_id in (select student_id from assignment_submissions);

select concat(first_name,' ',last_name) as s_name from students 
where student_id not in (select student_id from assignment_submissions);

select * from courses;
select * from enrollments;

select course_name from courses c join enrollments e
on c.course_id = e.course_id where c.course_id in (select e.course_id from enrollments);

select course_name from courses c join enrollments e
on c.course_id = e.course_id where c.course_id not in (select e.course_id from enrollments);

select i.instructor_name from instructors i where not exists 
(select 1 from courses c where c.instructor_id = i.instructor_id);

select concat(first_name, ' ',last_name) as s_name from students s 
join payments p on s.student_id = p.student_id where
amount_paid =(select avg(amount_paid) from payments); 