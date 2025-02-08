create database attendance;
use attendance;

## To create table employee
create table employee
(emp_id int primary key auto_increment
,name varchar(20),location varchar(25),shift char);


##To modify column
alter table employee modify shift enum('day','night');

insert into employee (emp_id,name,location,shift)values(1,"aji","valaechery","Day"),(2,"diya","Medavakkam","Day");
insert into employee (emp_id,name,location,shift)values(3,"ramya","guindy","night"),
(4,"Rahul","Tambaram","night"),(5,"Karthick","tharamani","day");
select * from  employee;

##To create table AttendanceRecords
create table attendancerecords(emp_id int auto_increment primary key,
day_in datetime,day_out datetime,
foreign key(emp_id) references employee(emp_id));
select* from attendancerecords;

insert into attendancerecords(emp_id,day_in,day_out)values(1,'2025-02-05 08:00:00', '2025-02-05 17:00:00'),(2, '2025-02-05 09:00:00', '2025-02-05 18:00:00'),
(3, '2025-02-05 09:00:00', '2025-02-05 18:00:00');

##To calculate working hours
select e.name,ar.day_in,ar.day_out,timestampdiff(hour,ar.day_in,ar.day_out) as hours_worked from attendancerecords ar join 
employee e on ar.emp_id=e.emp_id group by e.emp_id;
	
##To find employees absent or present
select e.name,
CASE
        WHEN ar.day_in IS NOT NULL AND ar.day_out IS NOT NULL THEN 'Present'
        WHEN ar.day_in IS NULL THEN 'Absent'
        ELSE 'Absent' 
END AS attendance_status from employee e 
left join attendancerecords ar on e.emp_id=ar.emp_id ;


##To create department table 
create table department(emp_id int auto_increment primary key,department varchar(20),
foreign key (emp_id) references employee(emp_id));
insert into department(emp_id,department)values(1,"HR"),(2,"HR"),(3,"Manager"),(4,"Team Leader"),(5,"Sales executive");
select * from department;


##To know number of employees in each department
create view employeedetails
as
select  count(e.emp_id),d.department from employee e right join
department d on e.emp_id=d.emp_id  group by d.department;
select * from employeedetails;

