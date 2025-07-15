/*
Lab 1: Use the Student management system Database and table from our previous lab and write a sql query to achieve the below scenario. 

 Assume you are managing a university database that tracks student enrollments in various courses. You have two tables, "Student" and "Enrollment". The goal is to retrieve information about each student's ID, first name, last name, and their enrollment details, including the enrollment ID and the associated course ID. 
*/


Enter password: ******
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 10
Server version: 8.0.42 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| anp_d1379          |
| employee           |
| empolyee           |
| information_schema |
| lab                |
| mysql              |
| performance_schema |
| product            |
| sakila             |
| sys                |
| world              |
+--------------------+
11 rows in set (0.08 sec)

mysql> use lab;
Database changed
mysql> create table Student(Stud_id varchar(15)not null primary key,first_name varchar(20)not null,last_name varchar(20)not null,mobile_no varchar(15));
Query OK, 0 rows affected (0.07 sec)

mysql> desc Students;
ERROR 1146 (42S02): Table 'lab.students' doesn't exist
mysql> desc Student;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| Stud_id    | varchar(15) | NO   | PRI | NULL    |       |
| first_name | varchar(20) | NO   |     | NULL    |       |
| last_name  | varchar(20) | NO   |     | NULL    |       |
| mobile_no  | varchar(15) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
4 rows in set (0.02 sec)

mysql> insert into Student values('S101','chaitali','khawale','8976642301'),('S102','rutuja','mopkar','5453232421'),('S103','rutvika','sawant','4542651451'),('S104','Aftab','choudhary','8543454214'),('S105','praniti','chauvan','154635640');
Query OK, 5 rows affected (0.02 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from Student;
+---------+------------+-----------+------------+
| Stud_id | first_name | last_name | mobile_no  |
+---------+------------+-----------+------------+
| S101    | chaitali   | khawale   | 8976642301 |
| S102    | rutuja     | mopkar    | 5453232421 |
| S103    | rutvika    | sawant    | 4542651451 |
| S104    | Aftab      | choudhary | 8543454214 |
| S105    | praniti    | chauvan   | 154635640  |
+---------+------------+-----------+------------+
5 rows in set (0.01 sec)

mysql> create table enrollment(enrollment_id varchar(10)not null primary key,Stud_id varchar(15)not null,Course_id varchar(20)not null,Course_name varchar(15)not null,FOREIGN KEY(Stud_id) REFERENCES Student(Stud_id));
Query OK, 0 rows affected (0.04 sec)

mysql> insert into enrollment values('E101','S101','C101','AI'),('E102','S102','C102','ML'),('E103','S103','C103','CSE'),('E104','S104','C104','EM'),('E105','S105','C105','SE');
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select *from enrollment;
+---------------+---------+-----------+-------------+
| enrollment_id | Stud_id | Course_id | Course_name |
+---------------+---------+-----------+-------------+
| E101          | S101    | C101      | AI          |
| E102          | S102    | C102      | ML          |
| E103          | S103    | C103      | CSE         |
| E104          | S104    | C104      | EM          |
| E105          | S105    | C105      | SE          |
+---------------+---------+-----------+-------------+
5 rows in set (0.00 sec)

mysql>  select S.Stud_id,S.first_name,S.last_name,S.mobile_no,e.enrollment_id,e.Stud_id,e.Course_id,e.course_name from Student S join enrollment e on S.Stud_id = e.Stud_id;
+---------+------------+-----------+------------+---------------+---------+-----------+-------------+
| Stud_id | first_name | last_name | mobile_no  | enrollment_id | Stud_id | Course_id | course_name |
+---------+------------+-----------+------------+---------------+---------+-----------+-------------+
| S101    | chaitali   | khawale   | 8976642301 | E101          | S101    | C101      | AI          |
| S102    | rutuja     | mopkar    | 5453232421 | E102          | S102    | C102      | ML          |
| S103    | rutvika    | sawant    | 4542651451 | E103          | S103    | C103      | CSE         |
| S104    | Aftab      | choudhary | 8543454214 | E104          | S104    | C104      | EM          |
| S105    | praniti    | chauvan   | 154635640  | E105          | S105    | C105      | SE          |
+---------+------------+-----------+------------+---------------+---------+-----------+-------------+
5 rows in set (0.00 sec)

mysql>