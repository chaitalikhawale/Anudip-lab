Enter password: ******
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 30
Server version: 8.0.42 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> create database lab;
Query OK, 1 row affected (0.05 sec)

mysql> use lab;
Database changed
mysql>  create table CUSTOMER(customer_id varchar(20) not null primary key,name varchar(20)not null,email varchar(30)not null,address varchar(50)not null,city varchar(20)not null,phone_no varchar(20)not null,pin_code varchar(10)not null);
Query OK, 0 rows affected (0.08 sec)

mysql>  create table PRODUCT(product_id varchar(10) not null primary key,product_name varchar(20)not null,category varchar(20)not null,Sub_category varchar(20)not null,Original_price varchar(10)not null,Selling_price varchar(10)not null,stock varchar(15)not null);
Query OK, 0 rows affected (0.03 sec)

mysql>  create table `ORDER`(order_id varchar(10) not null primary key,Customer_id varchar(20)not null,product_id varchar(10)not null, quantity int, total_price varchar(15)not null,payment_mode varchar(20)not null,order_date varchar(15)not null,order_status varchar(15)not null, FOREIGN KEY (Customer_id) REFERENCES CUSTOMER(customer_id) ,FOREIGN KEY(product_id) REFERENCES PRODUCT(product_id));
Query OK, 0 rows affected (0.09 sec)


mysql> insert into CUSTOMER values('C1','Chaitali','chaitali@gmail.com','vijay nagar','kalyan','8976642301','421306'),('C2','Rutuja','Rutu@gmail.com','ashok nagar','thane','9987471519','421302'),('C3','Sahil','sahil@gmail.com','samrat nagar','dombivli','9137974283','421308'),('C4','Vishva','vishva@gmail.com','amrai nagar','thakurli','5655354655','421305'),('C5','Manasi','manasi@gmail.com','gandhi nagar','mulund','7974273311','421304');
Query OK, 5 rows affected (0.02 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql insert into PRODUCT values  ('P101','Laptop','Electronics','Computers','500000','450000','10'),('P102','Smartphone','Electronics','mobiles','20000','18000','15'),('P103','Bike','Vehicle','Two wheeler','110000','10000','8'),('P104','Almonds','food','Dry-fruit','1000','890','10'),('P105','Bookshelf','Furniture','wooden','7000','6500','5');
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> insert into `Order` values('0101','C1','P101',1,'40000','Delivered','2025-07-01','Credit card'),('0102','C2','P102',2,'37000','Shipped','2025-07-02','COD'),('0103','C3','P103',3,'40000','Delivered','2025-07-03','UPI'),('0104','C4','P104',10,'50000','Delivered','2025-07-04','online'),('0105','C5','P105',3,'60000','Processing','2025-07-05','Debit card');
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select *from CUSTOMER;
+-------------+----------+--------------------+--------------+----------+------------+----------+
| customer_id | name     | email              | address      | city     | phone_no   | pin_code |
+-------------+----------+--------------------+--------------+----------+------------+----------+
| C1          | Chaitali | chaitali@gmail.com | vijay nagar  | kalyan   | 8976642301 | 421306   |
| C2          | Rutuja   | Rutu@gmail.com     | ashok nagar  | thane    | 9987471519 | 421302   |
| C3          | Sahil    | sahil@gmail.com    | samrat nagar | dombivli | 9137974283 | 421308   |
| C4          | Vishva   | vishva@gmail.com   | amrai nagar  | thakurli | 5655354655 | 421305   |
| C5          | Manasi   | manasi@gmail.com   | gandhi nagar | mulund   | 7974273311 | 421304   |
+-------------+----------+--------------------+--------------+----------+------------+----------+
5 rows in set (0.01 sec)

mysql> select *from PRODUCT;
+------------+--------------+-------------+--------------+----------------+---------------+-------+
| product_id | product_name | category    | Sub_category | Original_price | Selling_price | stock |
+------------+--------------+-------------+--------------+----------------+---------------+-------+
| P101       | Laptop       | Electronics | Computers    | 500000         | 450000        | 10    |
| P102       | Smartphone   | Electronics | mobiles      | 20000          | 18000         | 15    |
| P103       | Bike         | Vehicle     | Two wheeler  | 110000         | 10000         | 8     |
| P104       | Almonds      | food        | Dry-fruit    | 1000           | 890           | 10    |
| P105       | Bookshelf    | Furniture   | wooden       | 7000           | 6500          | 5     |
+------------+--------------+-------------+--------------+----------------+---------------+-------+
5 rows in set (0.00 sec)

mysql> select *from ORDER;
mysql> select *from `ORDER`;
+----------+-------------+------------+----------+-------------+--------------+------------+--------------+
| order_id | Customer_id | product_id | quantity | total_price | payment_mode | order_date | order_status |
+----------+-------------+------------+----------+-------------+--------------+------------+--------------+
| 0101     | C1          | P101       |        1 | 40000       | Delivered    | 2025-07-01 | Credit card  |
| 0102     | C2          | P102       |        2 | 37000       | Shipped      | 2025-07-02 | COD          |
| 0103     | C3          | P103       |        3 | 40000       | Delivered    | 2025-07-03 | UPI          |
| 0104     | C4          | P104       |       10 | 50000       | Delivered    | 2025-07-04 | online       |
| 0105     | C5          | P105       |        3 | 60000       | Processing   | 2025-07-05 | Debit card   |
+----------+-------------+------------+----------+-------------+--------------+------------+--------------+
5 rows in set (0.00 sec)

mysql> desc `ORDER`;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| order_id     | varchar(10) | NO   | PRI | NULL    |       |
| Customer_id  | varchar(20) | NO   | MUL | NULL    |       |
| product_id   | varchar(10) | NO   | MUL | NULL    |       |
| quantity     | int         | YES  |     | NULL    |       |
| total_price  | varchar(15) | NO   |     | NULL    |       |
| payment_mode | varchar(20) | NO   |     | NULL    |       |
| order_date   | varchar(15) | NO   |     | NULL    |       |
| order_status | varchar(15) | NO   |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
8 rows in set (0.02 sec)

mysql>