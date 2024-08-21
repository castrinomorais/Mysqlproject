create database Gm;
use Gm;

create table Customer 
(
CUST_ID int primary key,
CUST_NAME varchar(30),
CITY varchar(30),
GRADE int,
DOT date
);
Insert into customer 
values
(1,'ram','tuty', 3, "2022-10-06"),
(2,'sidu', 'tvl',2, "2022-10-22"),
(3,'ranjan','trichy', 4, "2023-01-02"),
(4,'kumar','theni',5, "2023-02-02");

select * from Customer;

/* Sql query to update city of a paticular customer id 4*/
update Customer
set CITY='madurai'where CUST_ID=4;

/* Sql query to display all the information about all customers*/
select * from Customer;

/* Sql query to display like name and grade of the customer */
select CUST_NAME, GRADE from Customer;

/*Sql query to display name and city of customers who belong to madurai*/
select CUST_NAME, CITY from Customer where CITY='madurai';

/* Sql query to display all the customer who have grade above 2*/
select * from Customer
where GRADE>2;

/*Sql query to display customer who have grade above 2 and belongs to city madurai*/
 select * from Customer
where GRADE>2 and CITY='madurai';

/*Sql query to display customer who have either  grade above 2 or belongs to city madurai*/
 select * from Customer
where GRADE>2 or CITY='madurai';

/* Sql query to display customer who have either grade not above 2 or belongs to city madurai*/
select * from Customer
where GRADE<=2 or CITY='madurai';



/* Sql query to display customers who lives other than tuty and  madurai*/
 select * from Customer
 where CITY not in ('tuty','madurai');
 
 /*SQL statement to find those customers with date of transaction between oct 06 2022 to oct 22  2022*/ 
 select * from Customer
 where DOT between '2022-10-06'and '2022-10-22';
 
 /*SQL statement to find those customers other than date of transaction between oct 06 2022 to oct 22  2022*/ 
select * from Customer
where DOT not between '2022-10-06'and '2022-10-22';
 
 /* SQL statement to find all those customers with all information whose names are ending with the letter 'n'.*/
 select * from Customer
 where CUST_NAME like '%n';
 
 /*SQL statement to find those customer with all information whose name containing the 1st character is 'n' and the 4th character is 'a' and rests may be any character.*/
 select * from Customer
 where CUST_NAME like 'n__a%';
 
 /* SQL statement to find that customer with all information who gets a grade except NULL value.*/
 select * from Customer
 where grade is not null;
 
 /* SQL statement to find that customer with all information who does not get any grade except NULL with cte. */
 with To_check_for_null as (
  select * from Customer
 where grade is null)
 select * from To_check_for_null;
 
 create database Customerdetails;
 use  Customerdetails;
 
 create table customerinfo 
(
CUST_ID int primary key,
CUST_NAME varchar(30),
PRODUCT varchar(30),
PRICE int,
CITY varchar(30),
COUNTRY varchar(30)
);

 
 Insert into customerinfo
values
(1,'Ram','Watch',13000,'Chennai','India'),
(2,'Sidu','Ring',15000, 'Kovai','India'),
(3,'Ranjan','Chain',32322, 'Lyon','France'),
(4,'Kumar','Bracelet',45121, 'Perth','Australia');

select * from customerinfo;
 /* Select all records from the table, sort the result reversed
alphabetically by the column City. */
select * from customerinfo
order by CITY desc;

/*SQL statement to Select all records from the table, sort the result
alphabetically, first by the column Country, then, by the column City */
select * from customerinfo
order by COUNTRY asc, CITY asc;

/* SQL statement to select the record with the smallest value of the Price column*/
select min(PRICE) from customerinfo;

/* SQL statement to select the record with the highest value of the Price column*/
select max(PRICE) from customerinfo;

/* query to return the number of records that have the Price value set to 200*/
select * from customerinfo
where PRICE=200;

/* the sum of all the Price column values in
the table */

select sum(PRICE) from customerinfo;

/* SQL statement to select all the records where the value of the Country column
is alphabetically between 'X' and 'Y'.*/
select * from customerinfo
where COUNTRY between 'X' and 'Y';

/* SQL statement to List the number of customers in each country.*/
select  COUNTRY ,count(CUST_ID)
from customerinfo
group by(COUNTRY);

/* SQL query to List the number of customers in each country, ordered by the
country with the most customers first*/
select  COUNTRY ,count(CUST_ID) as customer_count
from customerinfo
group by(COUNTRY)
order by customer_count desc;

create table customerinfotwo
(
Custid int primary key  ,
Grade int check(grade<11),
Openingamt int ,
Receiveamt int,
Paymentamt int ,
Phno int,
Custcity varchar(30),
Country varchar(30)
);



insert into customerinfotwo
values
(1,2, 4500, 5300, 2700,232550, 'Texas', 'Usa'),
(2,2, 5300, 2800, 3600,424565, 'Turin','Italy'),
(3,4,6400, 5822, 14222,858899, 'Milan','Italy'),
(4,3, 5300,3712,2588, 595477, 'Lyon','France'),
(5,4,85000, 4500, 3588, 8544935, 'London','England'),
(6,3,44500,4678, 5888, 45779654, 'Chennai','India'),
(7,1, 2522,56664,4877, 8577666, 'Kovai','India'),
(8,2, 28564,3547,48744,2324175, 'Tuty','India'),
(9,4,5841,6574,8241,777888, 'Trichy', 'India'),
(10,3, 2544, 6564,664141, 5457877,'Madurai', 'India');

/* Sql query to get customer having grades 2,4,3*/
select * from customerinfotwo
where Grade in(2,4,3);

/* To get list of cust_city, sum of opening_amt, average of receive_amt and
maximum payment_amt from customer table with following conditionsi.
grade of customer table must be 2,
ii. average of receive_amt for each group of cust_city must be more than
500*/
select Custcity, sum(Openingamt), avg(Receiveamt), max(Paymentamt)
from customerinfotwo
where grade=2
group by( Custcity)
having avg(Receiveamt)>500;

/* To get list of cust_city, sum of opening_amt, average of receive_amt and
maximum payment_amt from customer table with following conditions.
grade of customer table must be 2,
ii. average of receive_amt for each group of cust_city must be more than
500,
iii. the output should be arranged in the ascending order of SUM
(opening_amt)*/

select custcity, sum(openingamt),avg(receiveamt), max(paymentamt)
from customerinfotwo
where grade=2
group by(custcity)
having avg(receiveamt)>500
order by sum(openingamt) asc;

create database Salesdetails;
use Salesdetails;
Create Table Sales(
Sid int primary key,
Sname varchar(30),
Sales int ,
Locationid int
);

Insert Into Sales
values
(1,'Sampath',300000,400),
(2,'Rahim',450000,401),
(3,'Sam',250000,402),
(4,'Raju',310000,403),
(5,'Prabhu',5000000,404);

select * from Sales;

Create Table Location (
locationid int primary key,
locationname varchar(30)
);

select * from sales;

Create Table Location (
Locationid int primary key,
Locationname varchar(30)
);
Insert into Location
values
(401,'Chennai'),
(402,'Kovai'),
(403,'Madurai'),
(400,'Trichy'),
(404,'Tuticorin');

select * from location;
/*Write a SQL statement to display SId, SName, LocationId with corresponding
Location names.*/
select Sales.Sid,Sales.Sname,Sales.Locationid,Location.Locationname
from Sales join Location
on Sales. Locationid=Location.Locationid;

/*Write a SQL statement to display SName, Sales and corresponding location names
who have achieved Sales between 300000 and 500000.*/
select Sales.Sname, Sales.Sales,Location.Locationname
from Sales join Location
on Sales. Locationid=Location.Locationid and Sales.Sales between 300000 and 500000;

/*Write a SQL statement to display names of those salesman who have ‘Raj’ in their
names.*/
select Sales.Sname from Sales where Sales.Sname like '%Raj%';

/* Write a SQL statement to display SName and LocationName of all the records where
the sales is more than 100000.*/
select Sales.Sname, Location.Locationname
from Sales join Location
on Sales.Locationid=Location.Locationid and Sales.Sales>100000;

/* Write a SQL statement to list all the SName who sold in ‘Tuty’ and ‘Madurai’.*/
select Sales.Sname
from Sales join Location
on Sales.Locationid=Location.Locationid and Location.Locationname in('Tuticorin','Madurai');

/* Write a SQL statement to display all the LocationId from both the tables.*/
SELECT Locationid 
FROM Sales

UNION All

SELECT Locationid 
FROM Location;


/*Write a SQL statement to display all the distinct LocationId from both the tables.*/
select distinct Sales.Locationid, Location.Locationid
from Sales join Location
on Sales.Locationid=Location.Locationid;

/*Write a SQL statement to display common LocationId from both the tables.*/
select Sales.Locationid, Location.Locationid
from Sales join Location
on Sales.Locationid=Location.Locationid;
select *  from Location;
select * from Sales;
/* Write a SQL statement to display SName,LocationName and Sales of record which
has highest sale in table.*/
select Sales.Sname, Location.Locationname,Sales.Sales
from Location inner join Sales
on Sales.Locationid=Location.Locationid and  Sales.Sales = (
select max(Sales) from Sales );

create Table Loan(
LoanId int,
Branch varchar(8),
Amount int 
);

Insert into Loan 
values
(1,'B1',15000),
(2,'B2',10000),
(3,'B3',20000),
(4,'B4',100000),
(5,'B5',1500000);

select * from Loan;

create Table  Borrower(
CustID int,
CustName varchar(33),
LoanID int 
);

Insert into Borrower 
values
(1 	,'Sonakshi Dixit', 1),
(2 	,'Shital Garg', 4),
(3 ,'Swara Joshi ',	5),
(5,'Swati Bose', 7),
(6 	,'Asha Kapoor', 10),
(7 	,'Nandini Shah',9);
select * from Borrower ;
/* To display the CustName and Loan Amount */
select Borrower.CustName, Loan.Amount
from Borrower Left join Loan
on Borrower.LoanID=Loan.LoanId; 

create Table Employee(
EmployeeID int,
Employee_Name varchar(20),
Employee_Salary int 
);

Insert into Employee
values
(1 	,'Arun Tiwari', 50000),
(2,'Sachin Rathi', 	64000),
(3 ,'Harshal Pathak' ,48000),
(4 	,'Arjun Kuwar' , 46000),
(5 	,'Sarthak Gada', 62000);

create table Department(
DepartmentID int ,
Department_Name varchar(20),
EmployeeID int 
);
Insert into Department
values
(3 ,	'Marketing', 	4),
(4 ,	'Accounts', 	5),
(5, 	'Development', 	7),
(6, 	'HR', 	        9),
(7, 	'Sales',       10);

select * from Department ;
select * from Employee ;


/* query to display records using cross join */
select * from Employee cross join Department;

/* query to display employee from both tables using self join*/
select e1.Employee_Name, e2.Employee_Name
from Employee as e1 , Employee as e2
where  e1.EmployeeID=e2.EmployeeID;

create database Purchaseinfo;
use Purchaseinfo;

create table salesman ( 
Salesmanid int primary key,
salesmanname varchar(38),
City varchar(30),
Commission float(2)
) ;

INSERT INTO salesman
values
(5001,'James Hoog','NewYork',0.15),
(5002,'Nail KNite','Paris',0.13),
(5005,'Pit Alex','London',0.11),
(5006,'MC Lyon','Paris',0.14),
(5007,'Paul Adam','Rome',0.13),
(5003,'Lausen Hen','san Jose',0.12);

select * from salesman;

CREATE TABLE customer
(
Customerid int primary key,
Custname varchar(20) ,
City varchar(28),
Grade int ,
Salesmanid int
);

INSERT INTO customer
values
(3002 ,'Nick Rimando','New York', 100, 5001),
(3007 ,'Brad Davis', 'New York', 200,5001),
(3005,'Graham Zusi' ,'California',200 ,5002),
(3008 ,'Julian Green' ,'London' ,300 , 5002),
(3004 ,'Fabian Johnson' ,'Paris' , 300 ,5006),
(3009,'Geoff Cameron' ,' Berlin', 100 , 5003),
(3003 , 'Jozy Altidor' ,' Moscow ',200,5007),
(3001 ,'Brad Guzan' ,'London' ,null ,5005);

select *  from customer;

create table orders (
Ordno int primary key,
Purchamt float(2),
Orddate DATE , 
Customerid int,
Salesmanid int
);

Insert Into orders
values
(70001, 150.5 ,"2012-10-05", 3005 ,5002 ),
(70009 ,270.65 ,"2012-09-10", 3001 ,5005 ),
(70002 ,65.26 ,"2012-10-05", 3002 ,5001), 
(70004 ,110.5 ,"2012-08-17", 3009 ,5003),
(70007 ,948.5 ,"2012-09-10" ,3005 ,5002),
(70005 ,2400.6, "2012-07-27", 3007 ,5001), 
(70008 ,5760 ,"2012-09-10", 3002 ,5001), 
(70010 ,1983.43, "2012-10-10", 3004, 5006), 
(70003 ,2480.4 ,"2012-10-10" ,3009 ,5003), 
(70012 ,250.45 ,"2012-06-27" ,3008 ,5002), 
(70011 ,75.29 ,"2012-08-17" ,3003 ,5007), 
(70013  ,3045.6 ,"2012-04-25", 3002 ,5001);

show Tables;
/* SQL query to find all the orders issued by the
salesman 'Paul Adam'. Return ord_no, purch_amt, ord_date, customer_id and
salesman_id.*/
select * from salesman;
select * from orders;
select * from customer;

select * from orders
where Salesmanid=(select Salesmanid  from salesman where salesmanname='Paul Adam');

/*SQL query to find all orders generated by Londonbased
salespeople. Return ord_no, purch_amt, ord_date, customer_id, salesman_id*/
select * from orders
 where Salesmanid=(select Salesmanid from salesman where City='London');

/*SQL query to find those salesman who receive a
higher commission than the salesman with ID 5006. Return name, city.*/
select salesman.salesmanname, salesman.City from salesman
where Commission>(select Commission from salesman where Salesmanid=5006 );

/* SQL query to find all orders generated by the
salespeople who may work for customers whose id is 3007. Return ord_no,
purch_amt, ord_date, customer_id, salesman_id.*/

select orders.Ordno, orders.Purchamt, orders.Orddate, orders.Customerid, orders.Salesmanid
from orders where Salesmanid=(select Salesmanid from customer where Customerid=3007);

/* SQL query to determine the commission of the
salespeople in Paris. Return commission.*/
select salesmanname,Commission from salesman where City='Paris';

/* write a SQL query to find those salespeople who earned
the maximum commission. Return ord_no, purch_amt, ord_date, and salesman_id.*/
select orders.Ordno, orders.Purchamt, orders.Orddate, orders.Salesmanid from orders
where salesmanid in (select salesmanid from salesman where commission = 
     (select max(commission) from salesman));
     
/* SQL query to find salespeople who had more than
one customer. Return salesman_id and name.*/
select salesman.Salesmanid, salesman.salesmanname
from salesman where Salesmanid in(select salesmanid from customer group by salesmanid
having count(customerid)>1);

select * from salesman;
create Database Films;
use  Films;

CREATE TABLE Movie
 (
  Id VARCHAR(10) NOT NULL,
  Title VARCHAR(200) DEFAULT NULL,
  Year INT DEFAULT NULL,
  Date_published DATE DEFAULT null,
  Duration INT,
  Country VARCHAR(250),
  Worlwide_gross_income VARCHAR(30),
  Languages VARCHAR(200),
  Production_company VARCHAR(200)

);

INSERT INTO Movie
VALUES
('tt0012494','Der mÃ¼de Tod',2017,'2017-06-09',97,'Germany','$ 12156','German','Decla-Bioscop AG'),
('tt0038733','A Matter of Life and Death',2017,'2017-12-08',104,'UK','$ 124241','English, French, Russian','The Archers'),
('tt0361953','The Nest of the Cuckoo Birds',2017,'2017-10-16',81,'USA',null,'English','Bert Williams Motion Pictures and Distributor'),
('tt0235166','Against All Hope',2017,'2017-10-20',90,'USA',null,'English',null),
('tt0337383','Vaikai is Amerikos viesbucio',2017,'2017-03-09',88,'Soviet Union',null,'Lithuanian, Russian','Lietuvos Kinostudija'),
('tt0116851','Leila',2017,'2017-12-06',102,'Iran','$ 8231','Persian','Farabi Cinema Foundation'),
('tt0493407','Cook Off!',2017,'2017-11-17',98,'USA',null,'English',null),
('tt0443474','Crazy',2017,'2017-01-19',106,'USA',null,'English','FN Crazy Film LLC'),
('tt0499469','Emilio',2017,'2017-02-17',102,'USA',null,'English, Spanish','Emilio Productions'),
('tt0915458','Fast Girl',2017,'2017-01-01',95,'USA',null,'English','Matador Motion Pictures'),
('tt1253859','Road to Hell',2017,'2017-01-27',87,'USA',null,'English','Curnan Motion Picture Services (CMPS )'),
('tt1281966','SEAL Team VI',2017,'2017-01-12',99,'USA',null,'English','Four Minute Mile Productions'),
('tt1134664','Boogie Woogie',2017,'2017-09-29',94,'UK','$ 47527','English','The Works International'),
('tt1194238','Polytechnique',2017,'2017-01-14',77,'Canada',null,'French','Remstar Media Partners'),
('tt1431347','Zadboom',2017,'2017-08-09',111,'Iran',null,'Persian, German, English','Farabi Cinema Foundation'),
('tt1286146','The Eagle Path',2017,'2017-01-01',108,'Thailand, Hong Kong, USA',null,'English','Full Love Productions'),
('tt1604064','Zombie Beach',2017,'2017-02-21',71,'Canada',null,'English','Asopa Films Incorporation'),
('tt1736046','The Mitchell Tapes',2017,'2017-09-29',84,'USA',null,'English','Nikkso Productions'),
('tt1650535','The Entitled',2017,'2017-07-08',91,'Canada',null,'English','South Creek Pictures'),
('tt1718998','3 Times a Charm',2017,'2017-06-11',87,'USA',null,'English','DAVED Productions'),
('tt1727396','Bai lu yuan',2017,'2017-04-16',45,'China',null,'Chinese','Bai Lu Yuan Film Company'),
('tt1748051','Identical',2017,'2017-03-21',80,'USA',null,'English','Land Of The Free'),
('tt1791687','Without',2017,'2017-10-01',88,'USA',null,'English','Industry Standard Films'),
('tt1855282','Soog',2017,'2017-07-01',85,'Iran',null,'Persian',null),
('tt2002742','Nobel Chor',2017,'2017-07-28',100,'India',null,'Bengali','Impact Films'),
('tt2011223','Scenes from a Gay Marriage',2017,'2017-06-01',83,'USA',null,'English','Bring Chase Productions'),
('tt2125650','The Garlock Incident',2017,'2017-09-15',78,'USA',null,'English','Loudcat'),
('tt2149360','Found',2017,'2017-01-10',103,'USA',null,'English','Forbidden Films (II)'),
('tt2293272','Centro HistÃ³rico',2017,'2017-11-23',96,'Portugal','$ 5633','Portuguese, English','Globalstone RV Films'),
('tt2304662','Watashi no dorei ni narinasai',2017,'2017-11-01',96,'Japan',null,'Japanese','Cine Bazar'),
('tt1859476','No somos animales',2017,'2017-01-01',90,'USA, Argentina','$ 1902','English, Spanish','New Crime Productions'),
('tt2073600','Lad: A Yorkshire Story',2017,'2017-04-05',96,'UK',null,'English',null),
('tt2198235','Monsoon Shootout',2017,'2017-12-15',92,'India, UK, Netherlands, France',null,'Hindi','Yaffle Films'),
('tt2578608','Krampus: The Christmas Devil',2017,'2017-08-21',82,'USA',null,'English','Snowdog Studio'),
('tt2625948','Seventy-Nine',2017,'2017-06-08',82,'USA',null,'English','Magic Elevator'),
('tt1663222','Dead Sea',2017,'2017-11-04',90,'USA',null,'English','Dead Sea Films'),
('tt1715751','Chambers Gate',2017,'2017-02-15',81,'Canada',null,'English','Asopa Films Incorporation'),
('tt2170667','Wheels',2017,'2017-02-01',115,'USA',null,'English','Loaded Dice Films'),
('tt2274604','Eat with Me',2017,'2017-10-08',95,'USA',null,'English','Eat With Me Productions'),
('tt2369600','Muffin Top: A Love Story',2017,'2017-01-01',97,'USA',null,'English','Cameron Productions'),
('tt2425466','Warren',2017,'2017-02-04',84,'USA',null,'English','Watson Pictures'),
('tt2633076','Dig Two Graves',2017,'2017-03-24',85,'USA',null,'English',null),
('tt2782232','Circus of the Dead',2017,'2017-01-13',102,'USA',null,'English','Bell Cow Films'),
('tt2805676','Ascent to Hell',2017,'2017-03-14',90,'USA',null,'English','Rumpus Room Productions'),
('tt2962932','Mining for Ruby',2017,'2017-01-02',95,'USA',null,'English','Lock and Monkey Productions'),
('tt3082826','Kelly & Cal',2017,'2017-04-12',111,'USA','$ 17702','English','Spring Pictures'),
('tt3086078','4:48',2017,'2017-02-22',88,'France',null,'French','Les Illuminations'),
('tt3116438','Day of the Mummy',2017,'2017-06-20',81,'USA, Venezuela',null,'English','Omni Media Arts'),
('tt3334390','Sleeping Beauty',2017,'2017-07-13',88,'USA',null,'English','Robert Amstler Productions'),
('tt3479530','Teenkahon',2017,'2017-06-11',124,'India',null,'Bengali','A Little Lamb Films Production'),
('tt3581478','Heidi',2017,'2017-01-01',97,'USA',null,'English','Neon Mirage'),
('tt3596436','Home for Christmas',2017,'2017-11-10',102,'UK',null,'English','Jump Start Productions'),
('tt4059652','Cruel',2017,'2017-02-01',108,'France',null,'French','De Pure Fiction'),
('tt4329098','Sugar Daddies',2017,'2017-01-29',90,'USA',null,'English','Johnson Production Group'),
('tt1517471','Dough',2017,'2017-06-02',94,'UK, Hungary','$ 1647429','English','Docler Entertainment'),
('tt1646972','Jasmine',2017,'2017-05-12',80,'USA, Hong Kong','$ 24248','English','Shanghai Street Films'),
('tt1837636','Queen of the Desert',2017,'2017-04-14',128,'USA, Morocco','$ 1592853','English, Arabic, Turkish, French','Benaroya Pictures'),
('tt1841642','Demonic',2017,'2017-10-10',83,'USA','$ 3387774','English','Dimension Films'),
('tt2179734','A Life Not to Follow',2017,'2017-07-04',106,'USA',null,'English','Creepy Kid Productions'),
('tt2181282','A Patch of Fog',2017,'2017-01-24',92,'UK',null,'English','Jones Company'),
('tt2241475','Riot',2017,'2017-01-04',84,'UK',null,'English','Chata Pictures'),
('tt2361746','Haraamkhor',2017,'2017-01-13',90,'India',null,'Hindi','Khussro Films'),
('tt2392383','Her Composition',2017,'2017-01-01',93,'USA, Germany',null,'English','Picture Train Company'),
('tt2484224','The Answer',2017,'2017-07-11',83,'USA',null,'English','Schoolfield Media'),
('tt2566644','Seoul Searching',2017,'2017-12-15',105,'South Korea, China, USA','$ 18654','English, Korean, German','Seoul Searching'),
('tt2575290','Train Station',2017,'2017-02-03',97,'USA, Colombia, Iran, Kenya, Germany, Romania, Spain, China, UK, Greece, South Africa, Portugal, United Arab Emirates, India, Brazil, Philippines, Italy, Norway, Malaysia, France, Singapore, Indonesia, Bolivia, Bulgaria, Sudan',null,'English, Persian, Indonesian, Spanish, Italian, German, Greek, Chinese, Hindi, Portuguese, Arabic, Romanian, Filipino, Malay','Ex Film Collective'),
('tt2602338','Malady',2017,'2017-07-11',93,'UK',null,'English','Realist Productions'),
('tt2741564','Angelica',2017,'2017-11-17',95,'USA',null,'English, Italian','Pierpoline Films'),
('tt2848324','Touched with Fire',2017,'2017-05-10',106,'USA','$ 146487','English','40 Acres & A Mule Filmworks'),
('tt3148552','Convergence',2017,'2017-03-15',100,'USA',null,'English','Frame 29 Films'),
('tt3163224','The Carrier',2017,'2017-01-26',90,'UK',null,'English','Megatopia Films'),
('tt3201654','Neckan',2017,'2017-03-03',95,'Spain, Morocco','$ 5078','Spanish, Arabic','Gaia Audiovisuals S.L.'),
('tt3222852','Victor',2017,'2017-03-24',105,'USA','$ 117755','English','GW Films'),
('tt3231390','Valley of the Sasquatch',2017,'2017-02-07',92,'USA',null,'English','The October People'),
('tt3245848','Aram, Aram',2017,'2017-02-15',79,'USA',null,'English, Armenian','Tilted Windmill Productions'),
('tt3305176','The Hollow One',2017,'2017-07-01',95,'USA',null,'English','Compulsion Films'),
('tt3503460','Embers',2017,'2017-01-01',85,'Poland, USA',null,'English','Papaya Films'),
('tt3510304','Free in Deed',2017,'2017-09-08',100,'New Zealand, USA',null,'English','Greyshack Films'),
('tt3583382','The Night Is Young',2017,'2017-01-10',91,'USA',null,'English',null),
('tt3591696','The Dark Below',2017,'2017-03-10',75,'USA','$ 7095','English','Dead Wait Productons'),
('tt3591836','Date of the Dead',2017,'2017-08-17',98,'USA',null,'English','Double Bastard Films'),
('tt3625516','MindGamers',2017,'2017-03-28',97,'Austria','$ 43750','English','Terra Mater Factual Studios'),
('tt3639656','The Inherited',2017,'2017-05-28',90,'USA',null,'English','Bright October Productions'),
('tt3646836','Body of Deceit',2017,'2017-09-19',92,'Italy',null,'English','Project i Productions'),
('tt3673036','Anna',2017,'2017-07-05',96,'France, Colombia','$ 52393','French, Spanish','Noodles Production'),
('tt3707514','A Horse Tail',2017,'2017-03-04',85,'USA',null,'English',null),
('tt3713030','I Am Michael',2017,'2017-01-27',98,'USA','$ 3995','English','Patriot Pictures'),
('tt3717324','Zombieworld',2017,'2017-12-26',100,'USA',null,'English','Dread Central Media'),
('tt3719158','Madar-e ghalb atomi',2017,'2017-05-31',97,'Iran',null,'Persian, Arabic, English',null),
('tt3733098','Rosa Chumbe',2017,'2017-06-08',75,'Peru',null,'Spanish','Yin Zhang Films'),
('tt3813334','Hank Boyd Is Dead',2017,'2017-06-27',76,'USA',null,'English','Bag Of Cats Productions'),
('tt3815424','3000 Layla',2017,'2017-01-04',103,'Palestine, France, Jordan, Lebanon, Qatar, United Arab Emirates',null,'Arabic, Hebrew','Arab Fund for Arts and Culture'),
('tt3841424','Under sandet',2017,'2017-08-04',100,'Denmark, Germany','$ 3169553','German, Danish, English','Nordisk Film'),
('tt3848072','Stuff',2017,'2017-02-07',98,'USA',null,'English','Aspire Productions'),
('tt3863542','Tercer grado',2017,'2017-03-30',80,'Spain','$ 2009','Spanish','Breaking Pictures'),
('tt3866526','Natasha',2017,'2017-04-28',93,'Canada','$ 8325','Russian, English',null),
('tt3867396','Proof of the Devil',2017,'2017-11-23',75,'USA',null,'English','SuperNormal Pictures'),
('tt3867816','Pikadero',2017,'2017-03-16',98,'Spain, UK',null,'Basque, Spanish','Caravan Cinema'),
('tt3876382','Kidnap Capital',2017,'2017-04-24',93,'Canada',null,'English',null),
('tt3899154','Savageland',2017,'2017-02-24',80,'USA',null,'English','The Massive Film Company'),
('tt3954876','Don Quixote',2017,'2017-11-07',83,'USA',null,'English','Elysium Bandini Studios'),
('tt3967826','My First Miracle',2017,'2017-11-14',111,'USA',null,null,'Yale Productions'),
('tt4015930','Braxton',2017,'2017-07-03',111,'UK',null,'English','Whats Next Films'),
('tt4076926','The Heyday of the Insensitive Bastards',2017,'2017-10-27',97,'USA',null,'English','Elysium Bandini Studios'),
('tt4080728','En man som heter Ove',2017,'2017-06-30',116,'Sweden','$ 30691696','Swedish, Persian','Tre VÃ¤nner Produktion AB'),
('tt4157510','For Here or to Go?',2017,'2017-03-31',105,'USA, India',null,'English','Many Cups of Chai Films'),
('tt4184744','Full of Grace',2017,'2017-02-27',83,'USA','$ 34830','English','Justin Bell Productions'),
('tt4238858','The Fits',2017,'2017-01-11',72,'USA','$ 169236','English','Yes, Maam!'),
('tt4295258','Across the Line',2017,'2017-08-01',87,'Canada',null,'English','Circle Blue Entertainment'),
('tt4422796','Frisky',2017,'2017-03-14',99,'USA, Australia',null,'English','Cliff House Productions'),
('tt4482858','Tikkun',2017,'2017-01-12',119,'Israel','$ 13671','Hebrew, Yiddish','Plan B Productions'),
('tt4498604','Cyber Case',2017,'2017-05-21',87,'USA',null,'English','Cartel Pictures'),
('tt4511200','Manifesto',2017,'2017-11-23',95,'Germany','$ 416389','English','Bayerischer Rundfunk (BR)'),
('tt4544008','Jess & James',2017,'2017-08-17',92,'Argentina','$ 514','Spanish','Los Griegos Films'),
('tt4603640','The Silence',2017,'2017-10-06',91,'India',null,'Hindi, Marathi','SMR Films'),
('tt4679144','Blanka',2017,'2017-07-29',75,'Italy, Philippines, Japan','$ 2042','Tagalog','Biennale College - Cinema'),
('tt4835698','Together For Ever',2017,'2017-01-13',98,'Lithuania, Romania','$ 27119','Lithuanian','Alien Film'),
('tt4881362','Thithi',2017,'2017-03-13',123,'India, USA',null,'Kannada','Maxmedia'),
('tt4929720','Patchwork',2017,'2017-06-06',86,'Canada, USA',null,'English','Infinite Lives Entertainment'),
('tt4935190','How Heavy This Hammer',2017,'2017-02-17',75,'Canada',null,'English','Medium Density Fibreboard Films'),
('tt4957446','Kang rinpoche',2017,'2017-06-20',115,'China','$ 15441412','Tibetan','He Li Chen Guang International Culture Media Co.'),
('tt4986830','Pure Hearts: Into Chinese Showbiz',2017,'2017-09-20',96,'China','$ 368543','Chinese',null),
('tt5004766','Psiconautas, los niÃ±os olvidados',2017,'2017-05-24',76,'Spain, Japan','$ 52366','Spanish, English','Abrakan Estudio'),
('tt5050788','Loev',2017,'2017-05-01',92,'India',null,'Hindi, English','Bombay Berlin Film Productions'),
('tt5111754','Khaneye dokhtar',2017,'2017-10-11',80,'Iran',null,'Persian',null),
('tt5207166','Rekvijem za gospodju J',2017,'2017-03-16',93,'Serbia, Bulgaria, Republic of Macedonia, Russia, France, Germany','$ 2713','Serbian','See Film Pro'),
('tt5210324','Almacenados',2017,'2017-05-19',93,'Mexico',null,'Spanish','Avanti Pictures'),
('tt5216674','Nilalang',2017,'2017-01-10',90,'Philippines',null,'Filipino, Tagalog, English, Japanese','Welovepost'),
('tt8216024','Nun-gil',2017,'2017-03-01',122,'South Korea',null,'Korean',null),
('tt0490215','Silence',2017,'2017-01-01',161,'USA, UK, Taiwan, Japan, Mexico, Italy','$ 23737523','English, Japanese, Latin','SharpSword Films'),
('tt1082807','The Belko Experiment',2017,'2017-04-21',89,'USA','$ 11084630','English','Orion Pictures'),
('tt1148205','The Bronx Bull',2017,'2017-01-06',94,'USA',null,'English','Sunset Pictures'),
('tt1212428','The Lost City of Z',2017,'2017-03-24',141,'USA','$ 19263938','English, Portuguese, Tupi, Spanish, German','Keep Your Head'),
('tt1330018','The Devil and the Deep Blue Sea',2017,'2017-10-20',106,'USA',null,'English','The Darwin Collective'),
('tt1366338','Lowriders',2017,'2017-04-28',98,'USA','$ 6312033','English','Blumhouse Productions'),
('tt1401621','A Boy Called Po',2017,'2017-09-01',95,'USA','$ 4550','English','Commonwealth Film Manufacturing'),
('tt1558259','Simple Creature',2017,'2017-07-25',92,'USA','$ 23918','English','Old Loyal Films'),
('tt1564777','Fallen',2017,'2017-03-10',91,'UK, Hungary','$ 2578927','English','Apex Entertainment'),
('tt1610525','The Bleeder',2017,'2017-05-05',98,'USA','$ 502518','English','Millennium Films'),
('tt1619029','Jackie',2017,'2017-01-20',100,'USA, France, Chile, China, Germany, UK','$ 24270399','English, Spanish','Fox Searchlight Pictures'),
('tt1661275','Their Finest',2017,'2017-04-21',117,'UK, Sweden','$ 12597262','English, Hungarian, Polish, French','BBC Films'),
('tt1712192','Message from the King',2017,'2017-05-10',102,'UK, France, Belgium, USA','$ 315132','English, Armenian','Backup Media'),
('tt1718924','A Family Man',2017,'2017-07-28',108,'Canada, USA','$ 1641235','English','G-BASE'),
('tt1753786','Mercury Plains',2017,'2017-02-23',102,'USA',null,'English, Spanish','Number 5 Films'),
('tt1774591','Teenage Cocktail',2017,'2017-01-15',88,'USA',null,'English','Backup Media'),
('tt1800302','Gold',2017,'2017-02-03',120,'USA','$ 14880939','English, Indonesian','Black Bear Pictures'),
('tt1895315','Brimstone',2017,'2017-09-29',148,'Netherlands, France, Germany, Belgium, Sweden, UK, USA','$ 2140941','English, Dutch','N279 Entertainment'),
('tt1928334','All Out Dysfunktion!',2017,'2017-01-04',85,'USA',null,'English','Exertion Films'),
('tt1966385','City of Tiny Lights',2017,'2017-04-07',110,'UK','$ 54903','English','BBC Films'),
('tt1967614','The Comedian',2017,'2017-02-03',120,'USA','$ 1659002','English','Cinelou Films'),
('tt2034800','The Great Wall',2017,'2017-02-17',103,'USA, China, Hong Kong, Australia, Canada','$ 334933831','English, Mandarin, Spanish','Legendary East'),
('tt2076826','Chokeslam',2017,'2017-02-10',102,'Canada',null,null,'Chaos, a Film Company'),
('tt2119532','Hacksaw Ridge',2017,'2017-01-26',139,'Australia, USA','$ 175302354','English, Japanese','Cross Creek Pictures'),
('tt2186712','Long Nights Short Mornings',2017,'2017-01-24',100,'USA',null,'English','Last Pictures'),
('tt2262315','The Good Neighbor',2017,'2017-08-14',98,'USA','$ 90573','English','Anonymous Content'),
('tt2277834','Dark Cove',2017,'2017-05-30',84,'Canada',null,'English','Tall Grass Films'),
('tt2278870','ISRA 88',2017,'2017-02-07',119,'USA',null,'English','Eenie Ienie Over Productions'),
('tt2315582','Una',2017,'2017-09-01',94,'UK, Canada, USA','$ 508169','English','BRON Studios'),
('tt2324928','Alienate',2017,'2017-05-05',90,'USA',null,'English','Film Base'),
('tt2330973','Manhattan Undying',2017,'2017-06-06',90,'Canada, USA',null,'English','Distinctive Entertainment'),
('tt2349944','To agÃ³ri sti gÃ©fyra',2017,'2017-05-11',85,'Cyprus',null,'Greek','AMP Filmworks'),
('tt2361317','Live by Night',2017,'2017-01-13',129,'USA','$ 22678555','English, Spanish','Appian Way'),
('tt2371365','La VinganÃ§a',2017,'2017-02-02',90,'Brazil, Argentina','$ 34048','Portuguese, Spanish','Bionica Filmes'),
('tt2375585','Taryn Barker: Demon Hunter',2017,'2017-06-07',85,'USA, Ireland',null,'English','Constant Motion Pictures'),
('tt2392830','A Quiet Passion',2017,'2017-04-07',125,'UK, Belgium, USA, Canada','$ 4159246','English','Gibson & MacLeod'),
('tt2515456','Destined',2017,'2017-01-01',95,'USA',null,'English','Confluential Films'),
('tt2516966','1974: La posesiÃ³n de Altair',2017,'2017-04-07',82,'Mexico','$ 200362','Spanish','Nemesis'),
('tt2556676','Blowtorch',2017,'2017-02-07',80,'USA',null,'English','Breslin Media'),
('tt2565974','Razors: The Return of Jack the Ripper',2017,'2017-05-08',88,'UK',null,'English','Magic Mask Pictures Limited'),
('tt2592614','Resident Evil: The Final Chapter',2017,'2017-02-03',107,'USA, Germany, France, Canada, South Africa, Australia, UK, Japan','$ 312242626','English','Constantin Film'),
('tt2671706','Fences',2017,'2017-02-17',139,'USA, Canada','$ 64414761','English','BRON Studios'),
('tt2712758','Displacement',2017,'2017-04-28',112,'USA',null,'English','Maderfilm Productions'),
('tt2720826','Birth of the Dragon',2017,'2017-08-25',95,'China, Canada, USA','$ 7215027','English, Mandarin','Groundswell Productions'),
('tt2800340','On the Milky Road',2017,'2017-02-25',125,'Serbia, UK, USA','$ 1075258','Serbian, Italian','Pinball London'),
('tt2822672','Rock Dog',2017,'2017-06-16',90,'China, USA','$ 23157646','English','Summit Premiere'),
('tt2931140','New Life',2017,'2017-10-19',88,'USA',null,'English','Argentum Entertainment'),
('tt2936884','Paris pieds nus',2017,'2017-03-08',83,'France, Belgium','$ 2082381','French, English','Courage Mon Amour'),
('tt2938464','The Hatching',2017,'2017-09-26',90,'UK',null,'English','Creativity Capital'),
('tt2948530','Wild for the Night',2017,'2017-01-13',100,'USA','$ 18847','English','Tri Destined Studios'),
('tt2989524','Carrie Pilby',2017,'2017-04-04',98,'USA','$ 28430','English','Braveart Films'),
('tt3026488','Alone in Berlin',2017,'2017-06-30',103,'UK, France, Germany','$ 1205598','English','X-Filme Creative Pool'),
('tt3038542','Tie the Knot',2017,'2017-02-21',90,'USA, India',null,'English','Starlight Global Films'),
('tt3059304','Spaceship',2017,'2017-05-19',90,'UK','$ 14044','English','Belly Productions'),
('tt3061222','Alcoholist',2017,'2017-05-18',105,'Italy',null,'English','Dea Film'),
('tt3074952','Welcome to Willits',2017,'2017-09-22',84,'USA',null,'English','Yale Productions'),
('tt3079222','The Man Who Was Thursday',2017,'2017-09-14',95,'USA, Hungary, Italy, Romania',null,'English','Cobera Capital Group'),
('tt3108658','Redemoinho',2017,'2017-02-09',100,'Brazil',null,'Portuguese','Bananeira Filmes'),
('tt3122390','Beacon Point',2017,'2017-07-01',85,'USA',null,'English',null),
('tt3142468','Fluefangeren',2017,'2017-04-21',106,'Norway',null,'Albanian','Good Wolf Bad Wolf'),
('tt3180912','The Architect',2017,'2017-06-15',95,'USA',null,'English','Parker Film Company'),
('tt3212910','Folk Hero & Funny Guy',2017,'2017-05-12',88,'USA',null,'English','Spitfire Studios'),
('tt3228088','Spark: A Space Tail',2017,'2017-05-26',91,'Canada, South Korea, USA, China','$ 1040689','English','ToonBox Entertainment'),
('tt3238502','Ibiza Undead',2017,'2017-03-20',95,'UK',null,'English','Capital City Entertainment'),
('tt3283864','Some Freaks',2017,'2017-08-04',97,'USA, Mexico',null,'English','Mountview Creative'),
('tt3286560','The Last Face',2017,'2017-07-28',130,'USA','$ 1161751','English','River Road Entertainment'),
('tt3289956','The Autopsy of Jane Doe',2017,'2017-03-31',86,'UK','$ 5983416','English','42'),
('tt3292080','The Journey Is the Destination',2017,'2017-04-18',123,'USA',null,'English','Prospero Pictures'),
('tt3305308','Trespass Against Us',2017,'2017-03-03',99,'UK','$ 517197','English','Potboiler Productions'),
('tt3315656','Split',2017,'2017-03-18',127,'USA',null,'English','Clear Eye Productions'),
('tt3320500','The Axe Murders of Villisca',2017,'2017-05-05',78,'USA','$ 182467','English','Ketchum Labs'),
('tt3342332','No Way to Live',2017,'2017-01-01',84,'USA',null,'English','ModerncinÃ©'),
('tt3344694','The Secret Scripture',2017,'2017-03-24',108,'Ireland','$ 694981','English','Screen Ireland'),
('tt3416532','A Monster Calls',2017,'2017-01-01',108,'UK, Spain, USA','$ 47309313','English','Participant'),
('tt3424690','Havenhurst',2017,'2017-02-10',85,'USA','$ 289299','English','Protocol Entertainment'),
('tt3430548','Away',2017,'2017-05-12',105,'UK',null,'English','Flare Film'),
('tt3444008','Land of the Little People',2017,'2017-07-05',83,'Israel, Palestine',null,'Hebrew','Fresco Films'),
('tt3449588','Abduct',2017,'2017-05-28',88,'UK',null,'English','Abduct Films'),
('tt3470600','Sing',2017,'2017-01-27',108,'Japan, USA','$ 634151679','English, Japanese, Ukrainian','Dentsu'),
('tt3520216','Fair Haven',2017,'2017-03-01',90,'USA',null,'English','Trick Candle Productions'),
('tt3548276','Retribution',2017,'2017-09-02',75,'UK',null,'English','From The Ashes Films'),
('tt3598108','Bad Girl',2017,'2017-04-27',87,'Australia',null,'English','Kmunications'),
('tt3613314','The Ghoul',2017,'2017-08-04',85,'UK','$ 18459','English','Ghoul Film'),
('tt3620120','Candiland',2017,'2017-02-07',85,'Canada',null,'English','Motorcycle Boy Productions'),
('tt3646058','La carga',2017,'2017-10-13',94,'Mexico',null,'Spanish','Esfera Films Entertainment'),
('tt3655972','El olivo',2017,'2017-03-17',100,'Spain, Germany','$ 2090232','Spanish, German, English, French','Morena Films'),
('tt3663020','So B. It',2017,'2017-10-06',98,'USA','$ 47627','English','Branded Pictures Entertainment'),
('tt3666024','La tortue rouge',2017,'2017-05-26',80,'France, Belgium, Japan, Poland, Netherlands, Hungary, UK, Germany, China, Thailand, Italy, Denmark, USA','$ 6591789','None','Prima Linea Productions'),
('tt3666492','Beach Massacre at Kill Devil Hills',2017,'2017-09-12',99,'USA',null,'English','No One Left Behind Productions'),
('tt3684500','Downhill',2017,'2017-01-14',82,'Canada, Mexico, Chile',null,'Spanish, English','341 House Productions'),
('tt3687316','Youth in Oregon',2017,'2017-02-03',105,'USA',null,'English','Sundial Pictures'),
('tt3687898','Palace of Fun',2017,'2017-10-23',80,'UK',null,'English',null),
('tt3692652','Eloise',2017,'2017-02-03',89,'USA','$ 372137','English','Buy Here Pay Here Entertainment'),
('tt3699372','Let Me Make You a Martyr',2017,'2017-06-06',102,'USA',null,'English','Iscariot Films'),
('tt3704298','Vincent N Roxxy',2017,'2017-06-02',102,'USA','$ 23896','English','Unified Pictures'),
('tt3709442','Quarries',2017,'2017-03-10',83,'USA',null,null,'Quarries Group'),
('tt3716530','Elle',2017,'2017-03-10',130,'France, Germany, Belgium','$ 12748594','French','SBS Productions'),
('tt3717252','Underworld: Blood Wars',2017,'2017-01-13',91,'USA','$ 81093313','English, Saami','Screen Gems'),
('tt3721954','Maudie',2017,'2017-08-04',115,'Ireland, Canada','$ 9733932','English','Painted House Films'),
('tt3741834','Lion',2017,'2017-01-20',118,'UK, Australia, USA','$ 140312928','English, Hindi, Bengali','The Weinstein Company'),
('tt3756046','Die Blumen von gestern',2017,'2017-01-12',125,'Austria, Germany, France',null,'German, French, English','Dor Film-West Produktionsgesellschaft'),
('tt3771792','Cult of the Vampire',2017,'2017-05-05',77,'USA',null,'English','Andrew Amsden Films'),
('tt3778010','Dead Awake',2017,'2017-05-12',99,'USA','$ 21675','English','Gama Entertainment Partners'),
('tt3778354','Bear with Us',2017,'2017-08-15',94,'USA',null,'English','Arjay Entertainment'),
('tt3783958','La La Land',2017,'2017-01-12',128,'USA, Hong Kong','$ 446092357','English','Summit Entertainment'),
('tt3784042','Sticky Notes',2017,'2017-04-11',90,'USA',null,'English','Mustard & Co'),
('tt3794028','Mal de pierres',2017,'2017-06-23',120,'France, Belgium, Canada','$ 13025034','French, Spanish, German','TrÃ©sor Films'),
('tt3794392','After the Reality',2017,'2017-04-25',85,'USA',null,'English','USofAnderson I'),
('tt3823672','A.R.C.H.I.E.',2017,'2017-06-07',88,'Canada',null,null,'Creation Ink'),
('tt3829276','El tamaÃ±o sÃ­ importa',2017,'2017-01-27',96,'Mexico','$ 1575662','Spanish','Cyclus Producciones'),
('tt3838802','Blood Stripe',2017,'2017-09-29',92,'USA',null,'English','Wakemup Productions'),
('tt3839880','Infinity Chamber',2017,'2017-09-15',103,'USA',null,'English','Latest Trick Productions'),
('tt3853830','The Tiger Hunter',2017,'2017-09-22',94,'USA','$ 62398','English','Sneaky Sneaky Films'),
('tt3886604','Between Us',2017,'2017-01-06',100,'USA',null,'English','Caviar'),
('tt3893280','The Ticket',2017,'2017-04-07',97,'USA',null,'English','BCDF Pictures'),
('tt3896738','Hounds of Love',2017,'2017-06-01',108,'Australia','$ 234419','English','Factor 30 Films'),
('tt3901944','Country Crush',2017,'2017-03-14',96,'Canada',null,'English','Good Soldier Films'),
('tt3904278','We Go On',2017,'2017-02-07',89,'USA',null,'English','Filmed Imagination'),
('tt3908142','The Love Witch',2017,'2017-03-10',120,'USA','$ 246218','English','Anna Biller Productions'),
('tt3914332','(Dean)',2017,'2017-06-02',94,'USA','$ 254536','English','Abbolita Productions'),
('tt3948764','Chicago Rot',2017,'2017-04-04',100,'USA',null,'English','Dakini Productions'),
('tt3954660','Suntan',2017,'2017-04-28',104,'Greece, Germany','$ 157267','Greek, English','Faliro House Productions'),
('tt3969208','Trust Fund',2017,'2017-07-18',107,'USA','$ 36885','English','KC Film Office'),
('tt3973012','Women Who Kill',2017,'2017-07-26',93,'USA',null,'English',null),
('tt3974320','Bieffekterna',2017,'2017-03-20',93,'Sweden',null,'Swedish','Climent / Hedetoft Film'),
('tt3990782','Radio Dreams',2017,'2017-05-19',93,'USA, Iran','$ 27836','Persian, English, Assyrian Neo-Aramaic, Dari','Butimar Productions'),
('tt4010848','Lost Solace',2017,'2017-01-01',106,'Canada',null,'English',null),
('tt4016934','Ah-ga-ssi',2017,'2017-04-14',145,'South Korea','$ 37767206','Korean, Japanese','Moho Film'),
('tt4034228','Manchester by the Sea',2017,'2017-01-13',137,'USA','$ 78988148','English','Amazon Studios'),
('tt4034390','Cut to the Chase',2017,'2017-03-07',90,'USA',null,'English','Capital Arts Entertainment'),
('tt4047846','Home',2017,'2017-01-11',103,'Belgium',null,'Flemish, Dutch','Centre du CinÃ©ma et de lAudiovisuel de la FÃ©dÃ©ration Wallonie-Bruxelles'),
('tt4048272','Toni Erdmann',2017,'2017-02-03',162,'Germany, Austria, Monaco, Romania, France, Switzerland','$ 11784207','German, English, Romanian','Komplizen Film'),
('tt4058012','96 Souls',2017,'2017-05-26',112,'USA',null,'English','SJPL Films'),
('tt4061944','Te Ata',2017,'2017-10-13',105,'USA','$ 73236','English','Chickasaw Nation Productions'),
('tt4066836','Miles',2017,'2017-06-09',90,'USA','$ 2537','English','Cranium Entertainment'),
('tt4068586','Year by the Sea',2017,'2017-09-08',114,'USA',null,'English','Montabela Productions'),
('tt4074928','Realive',2017,'2017-01-13',112,'Belgium, Spain, France','$ 125680','English','Arcadia Motion Pictures'),
('tt4078162','Monochrome',2017,'2017-06-06',113,'UK',null,'English','Electric Flix'),
('tt4125372','Dusty and Me',2017,'2017-01-01',94,'UK',null,'English','Keep Your Trap Shut'),
('tt4126434','Before the Fall',2017,'2017-05-30',92,'USA',null,'English','Washington House'),
('tt4126694','One Night',2017,'2017-02-10',80,'USA',null,'English','Sorrento Productions'),
('tt4129802','Vermelho Russo',2017,'2017-04-27',90,'Brazil, Portugal, Russia','$ 817','English, Portuguese, Russian, Spanish','MuiraquitÃ£ Filmes'),
('tt4156972','Opening Night',2017,'2017-06-02',90,'USA',null,'English','Dark Factory Entertainment'),
('tt4158096','Free Fire',2017,'2017-03-31',91,'UK','$ 3719383','English','Film4'),
('tt4160706','Live Cargo',2017,'2017-03-31',88,'Bahamas, USA',null,'English','SimonSays Entertainment'),
('tt4181270','Window Horses: The Poetic Persian Epiphany of Rosie Ming',2017,'2017-11-10',85,'Canada',null,'English',null),
('tt4185566','Another Evil',2017,'2017-05-05',90,'USA',null,'English','Memory'),
('tt4191702','Norman: The Moderate Rise and Tragic Fall of a New York Fixer',2017,'2017-06-09',118,'Israel, USA','$ 6217567','English, Hebrew','Blackbird'),
('tt4197474','Tatara Samurai',2017,'2017-05-20',135,'Japan','$ 431640','Japanese','Aoi Promotion'),
('tt4210112','Nakom',2017,'2017-03-03',90,'Ghana, USA',null,'English','Rasquache Films'),
('tt4211312','The White King',2017,'2017-01-27',89,'UK, Germany, Sweden, Hungary','$ 14074','English','Oiffy'),
('tt4227282','Wrecker',2017,'2017-01-06',83,'Canada',null,'English','IW Wrecker Productions'),
('tt4242100','My Father Die',2017,'2017-01-20',90,'USA','$ 4252','American Sign Language, English','KnightMarcher'),
('tt4250438','11:55',2017,'2017-06-09',80,'USA',null,'English','Gigi Films'),
('tt4255304','The Void',2017,'2017-03-31',90,'Canada','$ 368372','English','120dB Films'),
('tt4276820','The Founder',2017,'2017-02-17',115,'USA','$ 24121245','English, Yiddish','The Weinstein Company'),
('tt4283414','And Punching the Clown',2017,'2017-02-24',95,'USA',null,'English','Permut Presentations'),
('tt4291600','Lady Macbeth',2017,'2017-04-28',89,'UK','$ 5401447','English','Sixty Six Pictures'),
('tt4303202','American Wrestler: The Wizard',2017,'2017-05-16',117,'USA',null,'English, Persian, French, Spanish','ESX Entertainment'),
('tt4305148','Lovesong',2017,'2017-02-17',84,'USA','$ 10626','English','Autumn Productions'),
('tt4334266','The Bad Batch',2017,'2017-06-23',118,'USA','$ 201890','English','Human Stew Factory'),
('tt4357714','The Sex Trip',2017,'2017-08-22',90,'USA','$ 14178','English','Bridgegate FIlms'),
('tt4371680','Icaros: A Vision',2017,'2017-05-19',91,'Peru, USA','$ 5510','English, Spanish','Conibo Productions'),
('tt4372390','Detour',2017,'2017-05-26',97,'UK, South Africa, United Arab Emirates','$ 1788','English','Head Gear Films'),
('tt4373956','TereddÃ¼t',2017,'2017-03-10',105,'Turkey, France, Germany, Poland','$ 49667','Turkish','Ustaoglu Production'),
('tt4375268','Enclosure',2017,'2017-02-03',100,'USA',null,'English','Black Bear Studios'),
('tt4379536','Slam: Tutto per una ragazza',2017,'2017-03-23',100,'Italy','$ 163771','Italian','Indigo Film'),
('tt4385888','20th Century Women',2017,'2017-02-10',119,'USA','$ 7214806','English','A24'),
('tt4399590','FirstBorn',2017,'2017-04-13',86,'UK',null,'English','Little House Productions'),
('tt4404296','The Gatehouse',2017,'2017-12-04',97,'UK',null,'English','Lost Eye Films'),
('tt4411618','In Dubious Battle',2017,'2017-02-17',110,'USA','$ 213982','English','Thats Hollywood'),
('tt4418398','We Still Steal the Old Way',2017,'2017-01-09',90,'UK',null,'English','Evolution Pictures'),
('tt4422164','Smoking Guns',2017,'2017-09-11',93,'UK',null,'English, Turkish','Liontari Pictures'),
('tt4424292','Crazy Lake',2017,'2017-10-01',80,'USA',null,'English','Digital Caviar'),
('tt4428714','Faut pas lui dire',2017,'2017-01-04',96,'Belgium, France','$ 1009445','French','Entre Chien et Loup'),
('tt4429194','Bonjour Anne',2017,'2017-07-07',92,'Japan, USA','$ 13203541','English, French','Lifetime Films'),
('tt4432980','Maquinaria Panamericana',2017,'2017-06-09',90,'Mexico, Poland',null,'Spanish','Amondo Films'),
('tt4441098','Cold Moon',2017,'2017-10-06',92,'USA',null,'English','Curmudgeon Films'),
('tt4443658','Better Watch Out',2017,'2017-12-08',89,'Australia, USA','$ 176288','English','Storm Vision Entertainment'),
('tt4444438','As You Are',2017,'2017-02-24',110,'USA',null,'English','Votiv Films'),
('tt4446472','Porto',2017,'2017-04-21',76,'Portugal, France, Poland, USA','$ 107062','English, Portuguese, French','Double Play Films (II)'),
('tt4460854','Chronically Metropolitan',2017,'2017-08-04',90,'USA',null,'English, Italian','The Film Community'),
('tt4462372','AWOL',2017,'2017-05-22',82,'USA',null,'English','Race Point Films'),
('tt4466358','The Bouncer',2017,'2017-02-03',107,'France, Israel',null,'Hebrew','Bizibi'),
('tt4466648','Smrt u Sarajevu',2017,'2017-08-23',85,'France, Bosnia and Herzegovina','$ 46475','Bosnian, French, English','Margo Cinema'),
('tt4467176','Going to Brazil',2017,'2017-03-29',94,'France','$ 470508','French','Chapter 2'),
('tt4467194','Cessez-le-feu',2017,'2017-04-19',103,'France, Belgium','$ 301087','French, French Sign Language','Polaris Film Production & Finance'),
('tt4468634','Certain Women',2017,'2017-03-03',107,'USA','$ 1526698','English','Film Science'),
('tt4473378','Ali Mizah wa Ibrahim',2017,'2017-03-01',98,'Egypt, France, Qatar, United Arab Emirates, Germany','$ 33370','Arabic','Arab Fund for Arts and Culture'),
('tt4480398','Attack of the Killer Donuts',2017,'2017-11-17',85,'USA',null,'English','Restless Nomad Films'),
('tt4482572','Moth',2017,'2017-02-21',81,'UK, Hungary, USA',null,'English','Elekes Pictures'),
('tt4486838','The Receptionist',2017,'2017-06-23',102,'UK, Taiwan','$ 10814','English, Mandarin, Min Nan','British Film Company'),
('tt4486986','All I See Is You',2017,'2017-10-27',109,'Thailand, USA','$ 678150','English','2DUXÂ²'),
('tt4494094','Search Engines',2017,'2017-09-15',98,'USA','$ 19033','English','Ridgestone Media'),
('tt4517450','Zazy',2017,'2017-03-30',98,'Germany, Italy',null,'German, Swedish, Italian','Gilles Mann Filmproduktion'),
('tt4518260','Albion: The Enchanted Stallion',2017,'2017-04-04',106,'USA, Bulgaria',null,'English','Character Brigade'),
('tt4524678','Az Ã¡llampolgÃ¡r',2017,'2017-01-26',109,'Hungary','$ 57744','Hungarian','Popfilm'),
('tt4529162','Even Lovers Get the Blues',2017,'2017-08-30',95,'Belgium',null,'French','Stenola Productions'),
('tt4536768','Science Fiction Volume One: The Osiris Child',2017,'2017-05-18',95,'Australia','$ 135532','English','Storm Vision Entertainment'),
('tt4539140','Marija',2017,'2017-03-09',100,'Germany, Switzerland',null,'English, German, Ukrainian, Turkish, Romanian','Pandora Filmproduktion'),
('tt4540710','Miss Sloane',2017,'2017-05-12',132,'France, USA','$ 9101546','English','Transfilm'),
('tt4544696','My Honor Was Loyalty',2017,'2017-03-01',95,'Italy',null,'German, English',null),
('tt4551318','Ray',2017,'2017-01-19',130,'Russia, Germany','$ 945991','Russian, German, French, Yiddish','Production Center of Andrei Konchalovsky'),
('tt4552700','La mano invisible',2017,'2017-04-28',83,'Spain','$ 11743','Spanish',null),
('tt4572514','Patriots Day',2017,'2017-02-23',133,'Hong Kong, USA','$ 50549909','English, Chinese, Arabic','Bluegrass Films'),
('tt4572984','Pushing Dead',2017,'2017-11-09',110,'USA',null,'English','Bugsby Pictures'),
('tt4573516','Sleight',2017,'2017-04-28',89,'USA','$ 3989705','English','Diablo Entertainment (II)'),
('tt4575930','Custody',2017,'2017-02-19',104,'USA',null,'English','Lucky Monkey Pictures'),
('tt4578118','Rupture',2017,'2017-04-28',102,'Canada, USA','$ 31238','English','Ambi Pictures'),
('tt4584718','Imperfections',2017,'2017-07-28',109,'USA',null,'English','Imperfections'),
('tt4587780','Unleashed',2017,'2017-08-25',96,'USA','$ 144718','English','Movie Trailer House'),
('tt4590092','I Love You Both',2017,'2017-06-09',90,'USA','$ 4661','English',null),
('tt4601504','Haze',2017,'2017-10-17',106,'USA',null,'English',null),
('tt4607748','Paralytic',2017,'2017-12-28',87,'USA',null,'English','Mighty Tripod Productions'),
('tt4623856','Wolves',2017,'2017-03-03',109,'USA',null,'English','Process Media'),
('tt4625334','The Other Half',2017,'2017-03-10',103,'Canada',null,'English','Motel Pictures'),
('tt4627352','Shepherds and Butchers',2017,'2017-03-23',106,'South Africa, USA, Germany','$ 79711','English, Afrikaans','Videovision Entertainment'),
('tt4637598','Pyromanen',2017,'2017-01-13',98,'Norway','$ 431768','Norwegian','GlÃ¸r Film AS'),
('tt4637878','A Woman, a Part',2017,'2017-03-22',97,'USA','$ 23562','English','Speculative Pictures'),
('tt4645330','Denial',2017,'2017-01-27',109,'UK, USA','$ 7994527','English, German, Hebrew','BBC Films'),
('tt4645368','Juste la fin du monde',2017,'2017-02-24',97,'Canada, France','$ 9231823','French, English','Sons of Manual'),
('tt4653950','Swing Away',2017,'2017-10-13',98,'USA',null,'English, Greek','Ancient Game Productions'),
('tt4655630','Drifter',2017,'2017-02-24',86,'USA',null,'English','Flint Films'),
('tt4660172','Brave New Jersey',2017,'2017-08-04',86,'USA','$ 16544','English','The Shot Clock'),
('tt4661276','Terror 5',2017,'2017-01-05',78,'Argentina, Mexico','$ 38972','Spanish','Camargo Cine'),
('tt4661680','Left Behind: Vanished - Next Generation',2017,'2017-01-27',88,'USA',null,'English','EchoLight Studios'),
('tt4664244','Sanctuary',2017,'2017-07-07',87,'Ireland',null,'English','Broadcasting Authority of Ireland'),
('tt4666726','Christine',2017,'2017-01-27',119,'UK, USA','$ 313465','English','BorderLine Films'),
('tt4669986','Loving',2017,'2017-02-03',123,'UK, USA','$ 12957265','English','Raindog Films'),
('tt4670016','Wolves at the Door',2017,'2017-04-18',73,'USA',null,'English','New Line Cinema'),
('tt4671002','American Fable',2017,'2017-02-17',96,'USA',null,'English',null),
('tt4680182','Colossal',2017,'2017-05-19',109,'Canada, USA, Spain, South Korea','$ 4531320','English, Korean','Toy Fight Productions'),
('tt4680980','Lavender',2017,'2017-03-03',92,'Canada, USA',null,'English','South Creek Pictures'),
('tt4686862','Almost Adults',2017,'2017-02-07',90,'Canada',null,'English','Unsolicited Pictures'),
('tt4688294','Parasites',2017,'2017-01-24',81,'USA',null,'English','Crappy World Films'),
('tt4696310','People You May Know',2017,'2017-02-28',101,'USA, Spain',null,'English, Spanish','La Panda'),
('tt4699202','Gurgaon',2017,'2017-08-04',107,'India',null,'Hindi','Jar Pictures'),
('tt4701908','Nong Hak',2017,'2017-04-21',101,'Laos, Estonia, France',null,'Lao, Estonian, English, Thai','Lao Art Media'),
('tt4711924','Monolith',2017,'2017-08-12',83,'Italy','$ 423981','English','Sky Italia'),
('tt4714782','Personal Shopper',2017,'2017-03-17',105,'France, Germany, Czech Republic, Belgium','$ 2840408','English, French, Swedish, German','CG CinÃ©ma'),
('tt4715356','Money',2017,'2017-05-12',86,'USA, Spain','$ 3041','English, Spanish','Create Entertainment'),
('tt4721124','The Exception',2017,'2017-06-02',107,'UK, USA','$ 834572','English','Egoli Tossell KLK'),
('tt4723724','Do You Take This Man',2017,'2017-07-07',92,'USA',null,'English','Modern Love'),
('tt4726636','Ma Loute',2017,'2017-06-16',122,'France, Germany, Belgium','$ 4928465','French, English','3B Productions'),
('tt4728386','Killing Ground',2017,'2017-08-24',88,'Australia','$ 80051','English','Hypergiant Films'),
('tt4731136','A Cure for Wellness',2017,'2017-02-24',146,'USA, Germany','$ 26620002','English, German','Regency Enterprises'),
('tt4733640','The Limehouse Golem',2017,'2017-09-01',109,'UK','$ 2327419','English, Irish, Chinese, Hebrew','New Sparta Films'),
('tt4741376','Jamais contente',2017,'2017-01-11',90,'France','$ 172835','French','Agat Films & Cie'),
('tt4746516','Orpheline',2017,'2017-03-29',111,'France','$ 365257','French','Les Films Hatari'),
('tt4747380','Bankoku naitsu',2017,'2017-02-25',183,'Thailand, Laos, Japan, France',null,'Thai, English, Japanese, Lao, French','Bangkok Planning'),
('tt4763340','Altar',2017,'2017-06-02',84,'USA',null,'English','Movie Heroes Studios'),
('tt4769214','Whisky Galore',2017,'2017-05-19',98,'UK','$ 653866','English','Whisky Galore Movie Ltd'),
('tt4776998','The Promise',2017,'2017-04-28',133,'Spain, USA','$ 12448676','English, Armenian, German, French, Turkish','Babieka'),
('tt4778424','El Cristo Ciego',2017,'2017-04-13',85,'Chile, France',null,'Spanish','CinÃ©-Sud Promotion'),
('tt4778988','LBJ',2017,'2017-11-03',98,'USA','$ 2510151','English','Acacia Filmed Entertainment'),
('tt4779026','I Had a Bloody Good Time at House Harker',2017,'2017-10-13',80,'USA',null,'English','625 Productions'),
('tt4799064','Mindhorn',2017,'2017-05-05',89,'UK','$ 815829','English','BBC Films'),
('tt4805316','A Dark Song',2017,'2017-04-07',100,'Ireland, UK','$ 23742','English, French, German','Samson Films'),
('tt4807830','Lipstick Under My Burkha',2017,'2017-07-21',117,'India','$ 12657','Hindi','Prakash Jha Productions'),
('tt4813254','Blood of the Tribades',2017,'2017-01-20',78,'USA',null,'English','Launch Over'),
('tt4814760','Here Alone',2017,'2017-05-18',98,'USA','$ 25043','English, French','Easy Open Productions'),
('tt4818776','Lens',2017,'2017-06-01',109,'India',null,'English, Malayalam, Tamil, Hindi',null),
('tt4826674','The Journey',2017,'2017-05-05',94,'UK','$ 482209','English','Greenroom Entertainment'),
('tt4827878','The Rendezvous',2017,'2017-11-20',92,'USA',null,'English',null),
('tt4835894','MiddleMan',2017,'2017-06-09',104,'USA',null,'English',null),
('tt4838534','The Sweet Life',2017,'2017-09-13',90,'USA',null,'English','Mockingbird Pictures'),
('tt4846340','Hidden Figures',2017,'2017-02-17',127,'USA','$ 235956898','English','Fox 2000 Pictures'),
('tt4857264','Contratiempo',2017,'2017-01-06',106,'Spain','$ 31191910','Spanish','Atresmedia Cine'),
('tt4881364','Anti Matter',2017,'2017-09-08',109,'UK','$ 22384','English, Spanish','The Cast Iron Picture Co.'),
('tt4895668','SÃ£o Jorge',2017,'2017-03-09',112,'Portugal, France','$ 256281','Portuguese','Filmes do Tejo'),
('tt4895790','Moon Dogs',2017,'2017-09-01',93,'UK, Ireland','$ 3616','English','Ripple World Pictures'),
('tt4902904','The Resurrection of Gavin Stone',2017,'2017-01-20',91,'USA','$ 2308355','English','Blumhouse Productions'),
('tt4916744','Karate Kill',2017,'2017-07-18',89,'Japan, USA',null,'Japanese, English','Mamezo Pictures - K.K. TÃ´rin'),
('tt4935746','Las tinieblas',2017,'2017-10-13',92,'Mexico',null,'Spanish','Varios Lobos'),
('tt4936122','WÃ¹lu',2017,'2017-06-14',95,'France, Senegal','$ 37765','French, Bambara','La Chauve Souris'),
('tt4936450','Bacalaureat',2017,'2017-03-31',128,'Romania, France, Belgium','$ 2029693','Romanian','Canal+'),
('tt4943218','The Worthy',2017,'2017-02-23',99,'United Arab Emirates, Romania','$ 127839','Arabic, English','Abis Studio'),
('tt4943706','Les derniers Parisiens',2017,'2017-02-22',105,'France','$ 93433','French','La Rumeur Filme'),
('tt4950192','Fixeur',2017,'2017-01-27',100,'Romania, France','$ 9669','Romanian, French','4 Proof Film'),
('tt4954522','Grave',2017,'2017-04-07',99,'France, Belgium, Italy','$ 3096815','French','Petit Film'),
('tt4955566','Almost Friends',2017,'2017-11-17',101,'USA','$ 35842','English','Let It Play'),
('tt4961380','From a House on Willow Street',2017,'2017-03-24',90,'South Africa','$ 63514','English','Fat Cigar Productions'),
('tt4972582','Split',2017,'2017-01-20',117,'Japan, USA','$ 278454358','English','Universal Pictures'),
('tt4975280','A martfÃ¼i rÃ©m',2017,'2017-11-17',121,'Hungary','$ 208999','Hungarian','FocusFox Studio'),
('tt4975722','Moonlight',2017,'2017-02-24',111,'USA','$ 65046687','English','A24'),
('tt4985848','Pitchfork',2017,'2017-01-13',94,'USA',null,'English','Pioneer Motion Pictures (PMP)'),
('tt4990516','Tu Hai Mera Sunday',2017,'2017-10-06',119,'India',null,'Hindi','Love & Faith'),
('tt4991512','Tramps',2017,'2017-04-21',82,'USA',null,'English','Animal Kingdom'),
('tt5000698','Presumed',2017,'2017-07-16',102,'USA',null,'English','Cartel Pictures'),
('tt5001426','Cage',2017,'2017-04-01',80,'UK',null,'English','Sixty6Media Film'),
('tt5003186','Plan de fuga',2017,'2017-04-28',105,'Spain','$ 1253363','Spanish','Atresmedia Cine'),
('tt5016946','Handsome Devil',2017,'2017-04-21',95,'Ireland','$ 129391','English, Latin','Treasure Entertainment'),
('tt5025550','Der traumhafte Weg',2017,'2017-04-27',86,'Germany',null,'German, English, Greek','Filmgalerie 451'),
('tt5027116','Corniche Kennedy',2017,'2017-01-18',94,'France','$ 109292','French','Everybody on the Deck'),
('tt5027724','A Guidebook to Killing Your Ex',2017,'2017-06-07',71,'Hungary, USA, UK',null,'English, Hungarian','Elekes Pictures'),
('tt5029608','Frantz',2017,'2017-05-12',113,'France, Germany','$ 7478354','French, German','Mandarin Films'),
('tt5029642','Dans la forÃªt',2017,'2017-02-15',103,'France, Sweden','$ 69311','French, English, Swedish','Les Films de FranÃ§oise'),
('tt5030402','Little Boxes',2017,'2017-04-14',84,'USA',null,'English','Kid Noir Productions'),
('tt5032468','Fare',2017,'2017-02-21',75,'USA',null,'English','Bad Theology'),
('tt5033018','In the Radiant City',2017,'2017-07-18',95,'USA',null,'English','Candlewood Entertainment'),
('tt5034474','The Assignment',2017,'2017-03-03',95,'France, Canada, USA','$ 388789','English','SBS Films'),
('tt5039088','The Transfiguration',2017,'2017-04-21',97,'USA','$ 28631','English','Transfiguration Productions'),
('tt5039860','Dalida',2017,'2017-01-11',127,'France','$ 5623134','French, Italian, English, Arabic','BethsabÃ©e Mucho'),
('tt5048406','Jours de France',2017,'2017-03-22',137,'France','$ 12273','French, English, Italian','Chaz Productions'),
('tt5050904','Masaryk',2017,'2017-03-09',114,'Czech Republic, Slovakia, Germany','$ 2000121','Czech, Slovak, English, French','In Film Praha'),
('tt5058998','Losing in Love',2017,'2017-04-01',96,'USA',null,'English','Martin Papazian Productions'),
('tt5061582','Die Einsiedler',2017,'2017-10-12',110,'Germany, Austria',null,'German','Zischlermann Filmproduktion'),
('tt5065762','Ãšltimos dÃ­as en La Habana',2017,'2017-04-07',93,'Cuba, Spain','$ 31506','Spanish','Besa Films'),
('tt5066598','Los del tÃºnel',2017,'2017-01-20',95,'Spain','$ 1165413','Spanish','Lanube PelÃ­culas'),
('tt5067984','Era o Hotel Cambridge',2017,'2017-03-16',99,'Brazil, France, Spain',null,'Portuguese, French, Arabic, Spanish, Lingala, English','Aurora Filmes'),
('tt5068650','The Dark Tapes',2017,'2017-04-18',98,'USA',null,'English','Thunder Road Incorporated'),
('tt5073620','Below Her Mouth',2017,'2017-02-17',94,'Canada','$ 33673','English','Serendipity Point Films'),
('tt5081606','Deuces',2017,'2017-04-01',87,'USA',null,'English','Flavor Unit Entertainment'),
('tt5082662','Nila',2017,'2017-03-01',96,'India',null,'Tamil',null),
('tt5088378','Alberta',2017,'2017-03-09',96,'Netherlands, Belgium, Canada',null,'Dutch, English','Fu Works'),
('tt5100046','X500',2017,'2017-02-25',104,'Canada, Colombia, Mexico','$ 15590','Spanish, French, English, Tagalog','Peripheria Productions'),
('tt5120400','Red Christmas',2017,'2017-08-25',82,'Australia','$ 2255','English','Red Christmas'),
('tt5136060','Ira',2017,'2017-03-03',93,'Spain, Iceland, Iran, Mexico, Sweden, USA','$ 12968','Spanish','Harold Entertainment'),
('tt5152640','Shortwave',2017,'2017-10-24',85,'USA',null,'English','Cue Mark Films'),
('tt5153860','Female Fight Club',2017,'2017-11-16',90,'USA','$ 22253','English, Spanish','Cineville'),
('tt5154288','Prevenge',2017,'2017-02-10',88,'UK','$ 103885','English','Gennaker'),
('tt5158522','The Levelling',2017,'2017-05-12',83,'UK','$ 118451','English','Oldgarth Media'),
('tt5160928','Mean Dreams',2017,'2017-03-17',108,'Canada','$ 36146','English','Woods Entertainment'),
('tt5161784','Blessed Benefit',2017,'2017-08-17',83,'Germany, Jordan, Netherlands',null,'Arabic','Twenty Twenty Vision Filmproduktion GmbH'),
('tt5167934','The Chamber',2017,'2017-03-10',88,'UK, USA','$ 1319','English','Edicis'),
('tt5170810','Inside',2017,'2017-07-28',89,'Spain, UK, USA, France','$ 824414','English','Inside ProducciÃ³n'),
('tt5175274','Le passÃ© devant nous',2017,'2017-02-08',110,'Belgium, Netherlands, Denmark, France',null,'French','41 Shadows'),
('tt5180240','Primaire',2017,'2017-01-04',105,'France','$ 1225280','French','Lionceau Films'),
('tt5182856','Fuchi ni tatsu',2017,'2017-05-05',120,'Japan, France','$ 153283','Japanese','Comme des CinÃ©mas'),
('tt5186236','Powidoki',2017,'2017-01-13',98,'Poland','$ 1032768','Polish','Akson Studio'),
('tt5186714','Forushande',2017,'2017-03-17',124,'Iran, France','$ 6953604','Persian, English','Arte France CinÃ©ma'),
('tt5195412','Wakefield',2017,'2017-05-19',106,'USA','$ 798214','English','Mockingbird Pictures'),
('tt5196472','Compte tes blessures',2017,'2017-01-25',80,'France',null,'French','Kazak Productions'),
('tt5201142','Volt',2017,'2017-02-02',80,'Germany, France',null,'German','Augenschein Filmproduktion'),
('tt5204636','Another Forever',2017,'2017-03-16',72,'Brazil, Netherlands, USA, Colombia, Austria, Germany','$ 2523','English','Zapata Filmes'),
('tt5205210','Strange Weather',2017,'2017-07-28',92,'USA',null,'English','Kalamalka Productions Limited'),
('tt5219770','Dev Bhoomi',2017,'2017-03-09',92,'India, Serbia',null,'Hindi, English','Nova Film'),
('tt5221894','Eteros ego',2017,'2017-01-19',101,'Greece','$ 371528','Greek, French','Green Dragon Movies'),
('tt5224746','Toen mijn vader een struik werd',2017,'2017-03-22',84,'Croatia, Belgium, Netherlands',null,'Dutch','Lemming Film'),
('tt5240878','Koisaika Miyamoto',2017,'2017-01-28',117,'Japan','$ 3960502','Japanese','Dentsu'),
('tt5252396','Ouvert la nuit',2017,'2017-01-11',97,'France','$ 707875','French','Les Productions en Cabine'),
('tt5254640','Spa Night',2017,'2017-11-02',93,'USA','$ 38578','Korean, English, Spanish','Nonetheless Productions'),
('tt5256722','Il a dÃ©jÃ  tes yeux',2017,'2017-01-18',95,'France, Belgium','$ 9755458','French, Wolof, Romanian, Norwegian','Nolita Cinema'),
('tt5260026','The Wedding Party',2017,'2017-06-13',112,'USA',null,'English','Picture Movers Anonymous'),
('tt5281134','Dark Night',2017,'2017-08-18',85,'USA','$ 363','English','Ringling College Studio Labs'),
('tt5286250','Fleur de Tonnerre',2017,'2017-01-18',100,'France, Belgium','$ 109862','French','JPG Films'),
('tt5287168','Sameblod',2017,'2017-03-03',110,'Norway, Denmark, Sweden','$ 442416','Swedish, Saami','Bautafilm'),
('tt5287852','Le divan de Staline',2017,'2017-01-11',92,'France, Portugal, Russia','$ 151589','French','Alfama Films'),
('tt5287914','Luca tanzt leise',2017,'2017-01-19',69,'Germany',null,'German','Hildebrandt Film'),
('tt5289520','6.9 pe scara Richter',2017,'2017-01-20',117,'Romania, Bulgaria, Hungary','$ 105000','Romanian','Cinema-Film H.I.P.'),
('tt5294198','Catfight',2017,'2017-03-10',95,'USA','$ 2666','English','MPI Media Group'),
('tt5294966','Umi yori mo mada fukaku',2017,'2017-06-02',118,'Japan','$ 5382886','Japanese','Aoi Promotion'),
('tt5326364','Nelly',2017,'2017-08-24',100,'Canada','$ 3751','French, English','Cactus Films'),
('tt5346228','Mama, gohan mada?',2017,'2017-02-11',117,'Japan','$ 5813','Japanese, Min Nan','Is.Field'),
('tt5351044','Offline - Das Leben ist kein Bonuslevel',2017,'2017-02-23',91,'Germany',null,'German','Rat Pack Filmproduktion'),
('tt5371266','Callback',2017,'2017-01-20',80,'Spain','$ 6270','English','Zabriskie Films'),
('tt5424898','Akher ayam el madina',2017,'2017-09-07',118,'Egypt, Germany, UK, United Arab Emirates',null,'Arabic','Zero Production'),
('tt5432114','Claire in Motion',2017,'2017-01-13',83,'USA',null,'English','Sacha Pictures'),
('tt5439424','Railway Children',2017,'2017-12-22',120,'India',null,'Kannada, Hindi','Tin Drum Beats'),
('tt5447816','From Nowhere',2017,'2017-02-17',89,'USA','$ 8109','English','No Place for Films'),
('tt5449214','Park',2017,'2017-03-09',100,'Greece, Poland',null,'Greek, English, Danish','Faliro House Productions'),
('tt5450328','Orecchie',2017,'2017-05-18',90,'Italy','$ 54681','Italian','Matrioska'),
('tt5451054','Bezbog',2017,'2017-03-09',99,'Bulgaria, Denmark, France','$ 6763','Bulgarian','Klas Film'),
('tt5456706','Les mauvaises herbes',2017,'2017-04-05',105,'Canada','$ 64352','French','Coop VidÃ©o de MontrÃ©al'),
('tt5460068','Emo the Musical',2017,'2017-05-04',94,'Australia',null,'English','Matthewswood Productions'),
('tt5460118','Break-Up Nightmare',2017,'2017-08-13',90,'USA',null,'English','The Asylum'),
('tt5466056','A Cidade onde EnvelheÃ§o',2017,'2017-02-09',99,'Brazil, Portugal',null,'Portuguese',null),
('tt5515670','Bravo Virtuoso',2017,'2017-03-03',107,'France, Belgium, Armenia',null,'Armenian, Russian','Agat Films & Cie'),
('tt5531032','#Screamers',2017,'2017-11-30',85,'USA',null,'English','Trick Candle Productions'),
('tt5531346','Animal polÃ­tico',2017,'2017-06-08',76,'Brazil',null,'Portuguese',null),
('tt5535436','Brakes',2017,'2017-11-24',88,'UK','$ 11352','English','Solution 3 Productions'),
('tt5537140','The Red Maple Leaf',2017,'2017-05-01',132,'Canada, USA',null,'English','In Your Ear Productions'),
('tt5538568','My Entire High School Sinking Into the Sea',2017,'2017-07-16',75,'USA','$ 68883','English','Washington Square Films'),
('tt5539474','Corps Ã‰tranger',2017,'2017-02-22',92,'France, Tunisia',null,'French, Arabic','Mon Voisin Productions'),
('tt5541206','La idea de un lago',2017,'2017-02-02',82,'Argentina, Switzerland, Netherlands, Qatar','$ 9669','Spanish','Alina Film'),
('tt5546300','La confession',2017,'2017-03-08',116,'France, Belgium',null,'French','Nebo Productions'),
('tt5560592','GukÃ´roku',2017,'2017-02-18',120,'Japan','$ 23096','Japanese','Bandai Visual'),
('tt5590712','Tramontane',2017,'2017-03-01',105,'Lebanon, France, Qatar, United Arab Emirates','$ 1035','Arabic','ARTE'),
('tt5598100','Patients',2017,'2017-03-01',110,'France','$ 8700784','French','Mandarin Films'),
('tt5599692','Eshtebak',2017,'2017-04-21',97,'Egypt, France, Germany','$ 143121','Arabic, English','Sampek Productions'),
('tt5634088','Kaleidoscope',2017,'2017-11-10',100,'UK','$ 6980','English','Dignity Film Finance'),
('tt5647250','On the Road',2017,'2017-09-29',121,'UK','$ 3237','English','Lorton Entertainment'),
('tt5651272','5 Frauen',2017,'2017-05-04',98,'Germany',null,'German','Emerge & See Filmproduktion'),
('tt5657776','Fala Comigo',2017,'2017-07-13',92,'Brazil',null,'Portuguese','Syndrome Films'),
('tt5662288','12 kedziu',2017,'2017-01-27',110,'Lithuania','$ 343078','Lithuanian','Film Jam'),
('tt5672952','Maudite poutine',2017,'2017-01-01',91,'Canada',null,'French','Metafilms'),
('tt5679536','Los decentes',2017,'2017-11-02',104,'Argentina, South Korea, Austria','$ 1441','Spanish','Nabis Filmgroup'),
('tt5688178','The Erlprince',2017,'2017-08-18',101,'Poland',null,'Polish, English, German, French','Stowarzyszenie Filmowcow Polskich'),
('tt5695668','Omor Shakhsiya',2017,'2017-03-01',90,'Israel','$ 39195','Arabic, Hebrew','Yellow Dawn Production'),
('tt5698578','Le parc',2017,'2017-01-04',71,'France',null,'French','MLD Films'),
('tt5707304','Madre',2017,'2017-04-27',95,'Chile',null,'Spanish','Bh5'),
('tt5728374','The Stranger Inside',2017,'2017-07-22',84,'USA',null,'English','Cartel Pictures'),
('tt5735280','It Stains the Sands Red',2017,'2017-07-28',92,'USA, Canada','$ 3599','English','Digital Interference Productions'),
('tt5736592','Sam Was Here',2017,'2017-04-06',75,'France, USA',null,'English','KuroKitsu'),
('tt5736696','Raid dingue',2017,'2017-02-01',105,'France, Belgium','$ 34598750','French, English, Serbian','PathÃ©'),
('tt5742306','Raftan',2017,'2017-10-25',74,'Afghanistan, Iran',null,'Persian, Dari','Aseman Parvaz Film'),
('tt5750534','Tracktown',2017,'2017-05-12',88,'USA',null,'English','Bay Bridge Productions Inc.'),
('tt5771640','Noces',2017,'2017-02-22',98,'Belgium, Pakistan, Luxembourg, France','$ 634861','French, Urdu','Daylight Films'),
('tt5786588','Hipersomnia',2017,'2017-03-30',90,'Argentina','$ 84893','Spanish','Benteveo Producciones'),
('tt5791884','Ne gledaj mi u pijat',2017,'2017-05-11',105,'Croatia, Denmark',null,'Croatian','Kinorama'),
('tt5795752','MaÃ±ana a esta hora',2017,'2017-08-04',85,'Colombia, Canada','$ 5258','Spanish',null),
('tt5801556','Trampolin',2017,'2017-03-09',82,'Croatia',null,'Croatian','Interfilm'),
('tt5810122','Let Her Out',2017,'2017-10-20',89,'Canada',null,'English','Black Fawn Films'),
('tt5811512','Die Hannas',2017,'2017-08-10',102,'Germany',null,'German','Tellfilm Deutschland'),
('tt5813568','Ho amici in paradiso',2017,'2017-02-02',95,'Italy',null,'Italian','Golden hour films s.r.l'),
('tt5820148','Afterlov',2017,'2017-05-18',94,'Greece','$ 13627','Greek','Marni Films'),
('tt5820466','Mala Junta',2017,'2017-05-11',89,'Chile',null,'Spanish','Lanza Verde'),
('tt5820812','The Rehearsal',2017,'2017-07-07',102,'New Zealand','$ 50507','English, Maori','Hibiscus Films'),
('tt5821664','Istirahatlah kata-kata',2017,'2017-01-19',97,'Indonesia',null,'Indonesian','KawanKawan Film'),
('tt5834036','1:54',2017,'2017-03-15',106,'Canada',null,'French','CinÃ©maginaire Inc.'),
('tt5843670','The Stakelander',2017,'2017-02-07',81,'USA','$ 34752','English','Glass Eye Pix'),
('tt5846676','Sventasis',2017,'2017-09-22',96,'Lithuania, Poland','$ 280831','Lithuanian','M-Films'),
('tt5867800','Aruvi',2017,'2017-12-15',130,'India',null,'Tamil','Dream Warrior Pictures'),
('tt5880296','Hermia & Helena',2017,'2017-08-03',87,'Argentina, USA','$ 44156','English, Spanish','Trapecio Cine'),
('tt5890000','Sabaibaru famirÃ®',2017,'2017-02-11',117,'Japan','$ 6882845','Japanese','Altamira Pictures Inc.'),
('tt5892354','Mon ange',2017,'2017-05-03',80,'Belgium','$ 20010','French','AprÃ¨s le DÃ©luge'),
('tt5903708','Sole cuore amore',2017,'2017-05-04',113,'Italy','$ 142270','Italian','Fandango'),
('tt5907852','Lev shaket meod',2017,'2017-01-26',92,'Israel',null,'Hebrew, English','Green Productions'),
('tt5918074','A Death in the Gunj',2017,'2017-06-02',110,'India',null,'English, Hindi, Bengali','Skywalk Films'),
('tt5928396','Werewolf',2017,'2017-03-22',80,'Canada',null,'English',null),
('tt5932894','JesÃºs',2017,'2017-10-26',85,'Chile, France, Germany, Greece, Colombia',null,'Spanish','Burning Blue'),
('tt5933966','Ascent',2017,'2017-05-18',80,'Netherlands, Japan','$ 46850','English, Japanese','Antithesis Films'),
('tt5943690','Mister Universo',2017,'2017-03-09',90,'Italy, Austria',null,'Italian','Vento Film'),
('tt5959698','La tutora',2017,'2017-01-01',114,'Argentina',null,'Spanish','Noel Films'),
('tt5961906','Howaito rirÃ®',2017,'2017-02-11',80,'Japan',null,'Japanese','Django Film'),
('tt5970290','Haus Ohne Dach',2017,'2017-08-31',117,'Germany, Iraq, Qatar',null,'German, Kurdish, English','Mitos Film'),
('tt5973032','Anchiporuno',2017,'2017-01-28',76,'Japan',null,'Japanese','Django Film'),
('tt5974388','Bar Bahar',2017,'2017-01-05',103,'Israel, France','$ 1679952','Hebrew, Arabic','Channel 10'),
('tt5974624','Pi sheng shang de hun',2017,'2017-08-18',142,'China','$ 491294','Tibetan','He Li Chen Guang International Culture Media(Beijing)'),
('tt5978194','Bhouri',2017,'2017-02-24',140,'India',null,'Hindi','Angel Entertainment'),
('tt5997928','Hotel Salvation',2017,'2017-04-07',102,'India','$ 81540','Hindi','Red Carpet Moving Pictures'),
('tt6010518','Bornless Ones',2017,'2017-02-10',81,'USA',null,'English','Black Drone Media'),
('tt6041030','Yat nim mou ming',2017,'2017-03-30',101,'Hong Kong','$ 1322500','Cantonese',null),
('tt6041312','El auge del humano',2017,'2017-08-03',99,'Argentina, Brazil, Portugal','$ 758','Spanish, Portuguese, Visayan','Ruda Cine'),
('tt6047852','Malaria',2017,'2017-10-04',86,'Iran, Poland',null,'Persian','Dreamlab Films'),
('tt6060960','El futuro perfecto',2017,'2017-07-13',65,'Argentina','$ 115','Spanish, Mandarin','Murillo Cine'),
('tt6069442','KÃ©kszakÃ¡llÃº',2017,'2017-01-05',72,'Argentina','$ 1289','Spanish','ARTE'),
('tt6096528','Elon NÃ£o Acredita na Morte',2017,'2017-04-27',75,'Brazil',null,'Portuguese','Entrefilmes'),
('tt6107412','Stockholm, My Love',2017,'2017-03-24',88,'Sweden, UK','$ 16241','English, Swedish',null),
('tt6118258','Ba yue',2017,'2017-03-21',106,'China','$ 624929','Mandarin','Beijing Mailis Pictures'),
('tt6121564','7 Giorni',2017,'2017-08-24',96,'Italy, Switzerland','$ 6568','Italian, French','LOffice Federal de la Culture Suisse'),
('tt6127024','Mawlana',2017,'2017-01-04',130,'Egypt',null,'Arabic','iProductions'),
('tt6129128','Bai yi',2017,'2017-03-17',95,'Taiwan',null,'Mandarin','Big Houses Film Production'),
('tt6132490','Mrs K',2017,'2017-09-07',97,'Hong Kong, Malaysia',null,'Mandarin, Cantonese','Sonneratia Capital'),
('tt6143998','Comeback: Um Matador Nunca se Aposenta',2017,'2017-05-25',89,'Brazil',null,'Portuguese','Rio Bravo Filmes'),
('tt6151714','Plateia Amerikis',2017,'2017-03-23',86,'Greece, UK, Germany','$ 31703','Greek, English, Arabic','Ilioupolis Films'),
('tt6151774','Emtehan Nahaee',2017,'2017-04-19',93,'Iran',null,'Persian',null),
('tt6186430','Die Beautiful',2017,'2017-07-22',120,'Philippines',null,'Filipino, Tagalog','The IdeaFirst Company'),
('tt6197848','Kissing?',2017,'2017-10-19',77,'Greece',null,'Greek','Arctos Films SA'),
('tt6204184','La Ãšltima Tarde',2017,'2017-04-27',81,'Colombia, Peru',null,'Spanish',null),
('tt6206564','Trapped',2017,'2017-03-17',105,'India','$ 38349','Hindi','Phantom Films'),
('tt6208104','Baradaram Khosro',2017,'2017-05-10',90,'Iran',null,'Persian',null),
('tt6210808','Ã€ mon Ã¢ge je me cache encore pour fumer',2017,'2017-04-26',90,'France, Greece, Algeria','$ 89784','Arabic, French','K.G. Productions'),
('tt6211418','Haft mahegi',2017,'2017-01-04',77,'Iran',null,'Persian','Filmiran'),
('tt6215590','Noghteh kor',2017,'2017-04-26',76,'Iran',null,'Persian','Mantra Film'),
('tt6219484','A House on 41st Street',2017,'2017-01-11',86,'Iran',null,'Persian','Simaye Mehr'),
('tt6250500','Nima',2017,'2017-12-07',94,'Greece',null,'Greek, French','Logline'),
('tt6257640','Soldado Argentino solo conocido por Dios',2017,'2017-04-06',102,'Argentina','$ 195201','Spanish','Cita con la Vida Emprendimientos Audiovisuales'),
('tt6259890','Baka bukas',2017,'2017-03-01',84,'Philippines',null,'Filipino, Tagalog',null),
('tt6259946','2 Cool 2 Be 4gotten',2017,'2017-03-15',95,'Philippines',null,'English, Filipino','Cinema One Originals'),
('tt6281166','Mes nuits feront Ã©cho',2017,'2017-01-01',98,'Canada, China, Mexico',null,'Spanish, French, English, Mandarin',null),
('tt6298498','El Amparo',2017,'2017-10-13',99,'Venezuela, Colombia',null,'Spanish','Tumbarrancho Films'),
('tt6302006','Yeo-gyo-sa',2017,'2017-01-04',96,'South Korea','$ 842596','Korean','Filmmaker R&K'),
('tt6333284','Plan B: ScheiÃŸ auf Plan A',2017,'2017-06-08',98,'Germany','$ 6666','German','Lightburst Pictures'),
('tt6355584','Revelations',2017,'2017-03-01',118,'India',null,'Tamil, English','Tournage Productions'),
('tt6359118','Solitaire',2017,'2017-03-16',92,'Lebanon, Jordan, Egypt','$ 141862','Arabic','Screen Project'),
('tt6386132','Gwat mooi',2017,'2017-02-23',97,'Hong Kong, Macao, Taiwan',null,'Cantonese, Mandarin','One Cool Film Production'),
('tt6430360','Deo Te-i-beul',2017,'2017-08-24',72,'South Korea','$ 715227','Korean','Vol Media'),
('tt6475250','Assassination Classroom: 365 Days',2017,'2017-03-23',92,'Japan','$ 183551','Japanese','Lerche'),
('tt6500276','Posle tebya',2017,'2017-03-16',119,'Russia','$ 223014','Russian',null),
('tt6550794','Siew Lup',2017,'2017-02-23',82,'Singapore',null,'Mandarin',null),
('tt6589330','The Last of Us',2017,'2017-04-05',95,'Tunisia, Qatar, United Arab Emirates, Lebanon',null,'None','Exit Productions'),
('tt6616286','Criando ratas',2017,'2017-01-07',78,'Spain',null,'Spanish',null),
('tt6892250','Absurd Accident',2017,'2017-05-19',97,'China','$ 1905999','Mandarin','Heyi Pictures'),
('tt9011132','Diamond Sword',2017,'2017-01-05',133,'Kazakhstan',null,'Kazakh','Centaurus'),
('tt0137204','Joe Finds Grace',2017,'2017-04-22',83,'Canada',null,'English','Bradeway Pictures'),
('tt0331314','Bunyan and Babe',2017,'2017-01-12',84,'USA, India','$ 72060','English','Exodus Film Group'),
('tt0339736','The Evil Within',2017,'2017-08-30',98,'USA',null,'English','Supernova LLC'),
('tt0451201','Sludge',2017,'2017-09-19',95,'USA',null,'English','Xeno Films'),
('tt0451279','Wonder Woman',2017,'2017-06-01',141,'USA, China, Hong Kong','$ 821847012','English, German, Dutch, French, Spanish, Chinese, Greek, Ancient (to 1453),
, North American Indian','Warner Bros.'),
('tt0460890','The Only Living Boy in New York',2017,'2017-08-11',89,'USA','$ 2550321','English','Amazon Studios'),
('tt0491175','Suburbicon',2017,'2017-11-24',105,'UK, USA','$ 12751667','English','Black Bear Pictures'),
('tt0493405','CHIPS',2017,'2017-03-24',100,'USA','$ 26800152','English, Spanish','Primate Pictures'),
('tt0498381','Rings',2017,'2017-02-03',102,'USA','$ 83080890','English','Macari/Edelstein'),
('tt0974015','Justice League',2017,'2017-11-17',120,'USA, Canada, UK','$ 657924295','English, Irish, Russian, Icelandic','Warner Bros.'),
('tt1024855','Gunned Down',2017,'2017-07-17',95,'UK','$ 47737','English','Impact Entertainment'),
('tt1034385','Cold Skin',2017,'2017-10-20',108,'Spain, France','$ 737478','English','Babieka'),
('tt1131724','2:22',2017,'2017-06-30',98,'Australia, USA','$ 3945729','English','Lightstream Entertainment'),
('tt1139592','Jeepers Creepers 3',2017,'2017-11-02',100,'USA','$ 4017852','English','Infinity Films'),
('tt1219827','Ghost in the Shell',2017,'2017-03-30',107,'USA, India, Hong Kong, China, UK','$ 169801921','English, Japanese','Paramount Pictures'),
('tt1225856','Retina',2017,'2017-01-01',87,'USA','$ 41280','English','CGF Films'),
('tt1230168','Same Kind of Different as Me',2017,'2017-10-20',119,'USA','$ 6423605','English','Disruption Entertainment'),
('tt1241317','Death Note',2017,'2017-08-25',101,'USA',null,'English, Japanese, Spanish','Netflix'),
('tt1293847','xXx: Return of Xander Cage',2017,'2017-01-19',107,'China, Canada, USA','$ 346118277','English, Spanish, Portuguese, Mandarin, Tagalog, Russian','Huahua Media'),
('tt1338635','Locked Away',2017,'2017-09-01',98,'USA',null,'English','Say Hello Productions'),
('tt1380151','Blood Honey',2017,'2017-09-01',95,'Canada',null,'English','Lumanity Productions'),
('tt1386691','Shimmer Lake',2017,'2017-06-09',83,'Canada, USA',null,'English','Footprint Features'),
('tt1396484','It',2017,'2017-09-08',135,'USA, Canada','$ 700449318','English','New Line Cinema'),
('tt1412528','Table 19',2017,'2017-04-07',87,'USA','$ 5042014','English','3311 Productions'),
('tt1454700','Truth',2017,'2017-11-28',80,'USA',null,'English','Victory of the People Productions'),
('tt1458169','Kidnap',2017,'2017-08-04',95,'USA','$ 34814102','English','Di Bonaventura Pictures'),
('tt1469304','Baywatch',2017,'2017-05-29',116,'UK, China, USA','$ 177856751','English, Spanish','Paramount Pictures'),
('tt1485796','The Greatest Showman',2017,'2017-12-26',105,'USA','$ 434993183','English','Chernin Entertainment'),
('tt1507571','The Tribes of Palos Verdes',2017,'2017-12-01',104,'USA','$ 11603','English','Relativity Media'),
('tt1536537','What Happened to Monday',2017,'2017-08-18',123,'UK, France, Belgium','$ 27975429','English','Vendome Pictures'),
('tt1544608','Voice from the Stone',2017,'2017-04-28',94,'USA, Italy','$ 87273','English, Italian','Zanuck Independent'),
('tt1615160','The Foreigner',2017,'2017-09-30',113,'UK, China, USA','$ 145374099','English, Mandarin','STX Entertainment'),
('tt1633217','La mÃ©lodie',2017,'2017-11-08',102,'France','$ 957355','French','Mizar Films'),
('tt1640605','Scary Story Slumber Party',2017,'2017-01-17',76,'USA',null,'English','Psychokillers Films'),
('tt1648190','The Dark Tower',2017,'2017-08-18',95,'USA','$ 113231078','English','Columbia Pictures'),
('tt1653665','Goodbye Christopher Robin',2017,'2017-09-29',107,'UK','$ 7401949','English','DJ Films'),
('tt1666185','All Eyez on Me',2017,'2017-06-30',139,'USA','$ 55668698','English','Morgan Creek Entertainment'),
('tt1674768','An American in Texas',2017,'2017-10-13',97,'USA, Poland, Norway',null,'English','Film Exchange'),
('tt1680140','The Stolen',2017,'2017-11-23',98,'UK, Germany, United Arab Emirates, New Zealand','$ 27741','Chinese, English, Maori, French','Cork Films'),
('tt1691916','Before I Fall',2017,'2017-03-03',98,'USA','$ 16373843','English','Awesomeness Films'),
('tt1691924','Blood Redd',2017,'2017-03-10',90,'USA',null,'English','Clockwork Mind Pictures'),
('tt1698655','Souleater',2017,'2017-01-17',86,'USA',null,'English','Centurion Cinema Company LLC'),
('tt1699518','Le jeune Karl Marx',2017,'2017-03-02',118,'France, Belgium, Germany','$ 4870373','German, French, English','Agat Films & Cie'),
('tt1720621','Trafficked',2017,'2017-10-06',104,'USA','$ 19698','English','Habitat Media Group'),
('tt1724970','Beyond Skyline',2017,'2017-01-01',106,'UK, China, Canada, Indonesia, Singapore, USA','$ 992181','English, Indonesian','Beyond The Mothership'),
('tt1727497','Het Tweede Gelaat',2017,'2017-10-25',127,'Belgium',null,'Dutch','Eyeworks Film & TV Drama'),
('tt1734493','Unlocked',2017,'2017-05-05',98,'Czech Republic, Switzerland, UK, USA','$ 4699125','English, Arabic, German','Bloom'),
('tt1740683','Mesteren',2017,'2017-03-02',94,'Denmark, Norway, Czech Republic','$ 8184','Danish, Norwegian','Nimbus Film Productions'),
('tt1758810','The Snowman',2017,'2017-10-13',119,'UK, USA, China, Sweden, Japan','$ 43084060','English, Russian','Universal Pictures'),
('tt1781058','Wilson',2017,'2017-03-24',94,'USA','$ 848646','English','Ad Hominem Enterprises'),
('tt1785635','The Vault',2017,'2017-09-01',91,'USA','$ 346729','English','Redwire Pictures'),
('tt1790809','Pirates of the Caribbean: Dead Men Tell No Tales',2017,'2017-05-25',129,'USA','$ 794861794','English, Spanish','Walt Disney Pictures'),
('tt1791611','Spreading Darkness',2017,'2017-11-14',101,'USA',null,'English','Black Elephant Productions'),
('tt1806913','Golmaal Again',2017,'2017-10-20',140,'India','$ 2057329','Hindi','Mangal Murti Films'),
('tt1856101','Blade Runner 2049',2017,'2017-10-05',164,'USA, UK, Hungary, Canada, Spain','$ 260512487','English, Finnish, Japanese, Hungarian, Russian, Somali, Spanish','Alcon Entertainment'),
('tt1863293','Khibula',2017,'2017-11-15',97,'Georgia, France, Germany',null,'Georgian, Russian','42film'),
('tt1869347','Crooked House',2017,'2017-11-21',115,'UK, USA','$ 3682156','English','Stage 6 Films'),
('tt1880415','Battlecreek',2017,'2017-11-03',97,'USA',null,'English','Maindiner Music & Film'),
('tt1935089','Blind',2017,'2017-08-24',98,'USA','$ 98280','English','Michael Mailer Films'),
('tt1935194','Overdrive',2017,'2017-08-09',93,'France, Belgium, USA','$ 9650552','English, French','Overdrive Productions'),
('tt1935897','Amityville: The Awakening',2017,'2017-10-12',85,'USA','$ 7701908','English','Dimension Films'),
('tt1961175','American Assassin',2017,'2017-09-14',112,'USA','$ 67234188','English, Spanish, Arabic, Polish, Turkish, Russian, Italian, Persian','CBS Films'),
('tt1972591','King Arthur: Legend of the Sword',2017,'2017-05-19',126,'UK, USA','$ 148675066','English','Warner Bros.'),
('tt1981128','Geostorm',2017,'2017-10-20',109,'USA','$ 221600160','English, Cantonese, Russian, Hindi, Spanish','Warner Bros.'),
('tt1995458','The Bang Bang Brokers',2017,'2017-04-11',87,'USA',null,'English','Brooklyn Reptyle Films'),
('tt2024521','My Name Is Lenny',2017,'2017-06-09',91,'UK','$ 435','English','Salon Pictures'),
('tt2039338','Flatliners',2017,'2017-09-29',109,'USA, Canada','$ 45158254','English','Columbia Pictures'),
('tt2039380','Star Raiders: The Adventures of Saber Raine',2017,'2017-05-08',83,'USA','$ 260234',null,'Fusion Factory Films'),
('tt2039412','Never Here',2017,'2017-10-20',110,'USA',null,'English','Before The Door Pictures'),
('tt2042692','The Unseen',2017,'2017-12-15',108,'UK',null,'English','Magnet Films'),
('tt2062700','Song to Song',2017,'2017-03-17',129,'USA','$ 1848459','English','Buckeye Pictures'),
('tt2072233','Sleepless',2017,'2017-05-05',95,'USA','$ 32917353','English','FilmNation Entertainment'),
('tt2088950','This Is Your Death',2017,'2017-09-15',104,'USA',null,'English','Dobre Films'),
('tt2090465','Black Butterfly',2017,'2017-05-26',93,'Spain, USA, Italy','$ 391431','English','Ambi Pictures'),
('tt2091256','Captain Underpants: The First Epic Movie',2017,'2017-07-24',89,'USA, Canada, France, UK, India','$ 125427681','English','DreamWorks Animation'),
('tt2179155','AlguÃ©m Como Eu',2017,'2017-10-12',87,'Portugal, Brazil','$ 207252','Portuguese','Gullane'),
('tt2184233','1 Mile to You',2017,'2017-04-07',104,'USA',null,'English','Cinema Revival'),
('tt2196053','Something Like Summer',2017,'2017-02-25',115,'USA',null,'English','Blue Seraph Productions'),
('tt2226597','The Mountain Between Us',2017,'2017-10-06',112,'USA','$ 62832209','English','Chernin Entertainment'),
('tt2239822','Valerian and the City of a Thousand Planets',2017,'2017-08-02',137,'France, China, Belgium, Germany, United Arab Emirates, USA','$ 225874228','English, French','EuropaCorp'),
('tt2250912','Spider-Man: Homecoming',2017,'2017-07-05',133,'USA','$ 880166924','English, Spanish','Columbia Pictures'),
('tt2262216','Doobious Sources',2017,'2017-01-02',102,'USA',null,'English','Doobious Sources'),
('tt2265651','Untouched',2017,'2017-03-02',80,'USA',null,'English','First City Films'),
('tt2283362','Jumanji: Welcome to the Jungle',2017,'2017-12-20',119,'USA, India, Canada, UK, Australia, Germany','$ 962102237','English','Columbia Pictures'),
('tt2289098','The Fitzroy',2017,'2017-04-29',93,'UK',null,'English','Dresden Pictures'),
('tt2293060','Americons',2017,'2017-12-29',89,'USA','$ 28782','English','Industry Artists Group'),
('tt2306441','Middleground',2017,'2017-11-02',91,'Russia, USA','$ 22490',null,'Hype Film'),
('tt2312184','All About the Money',2017,'2017-06-02',90,'USA',null,'English','Wunderkind Pictures'),
('tt2316204','Alien: Covenant',2017,'2017-05-12',122,'USA, UK','$ 240891763','English','Twentieth Century Fox'),
('tt2331047','Rememory',2017,'2017-08-24',111,'Canada, USA','$ 70124','English','First Point Entertainment'),
('tt2334871','Snatched',2017,'2017-05-19',90,'USA','$ 60845711','English, Spanish','Chernin Entertainment'),
('tt2337841','Bottom of the World',2017,'2017-03-01',85,'Canada, USA',null,'English','Catalyst Global Media'),
('tt2345759','The Mummy',2017,'2017-06-09',110,'USA, China, Japan','$ 409231607','English, Egyptian (Ancient)','Universal Pictures'),
('tt2378507','The Glass Castle',2017,'2017-10-06',127,'USA','$ 22088533','English','Lionsgate'),
('tt2382622','After the Wedding',2017,'2017-07-28',88,'USA',null,'English','Pink Forest Films'),
('tt2396589','Mudbound',2017,'2017-11-17',134,'USA','$ 117344','English','Armory Films'),
('tt2398241','Smurfs: The Lost Village',2017,'2017-03-31',90,'USA, Hong Kong, Canada','$ 197183546','English','Columbia Pictures'),
('tt2406566','Atomic Blonde',2017,'2017-08-09',115,'Germany, Sweden, USA, Hungary','$ 100121713','English, German, Russian, Swedish','87Eleven'),
('tt2417712','Goon: Last of the Enforcers',2017,'2017-09-08',101,'Canada','$ 124875','English','No Trace Camping'),
('tt2421910','The Guest House',2017,'2017-03-01',96,'USA',null,'English','Scrappy Dog Productions'),
('tt2429278','The Ghost and The Whale',2017,'2017-06-01',105,'USA',null,'English','Ghost and the Whale'),
('tt2449638','Deep Burial',2017,'2017-03-17',81,'USA',null,'English','Lifeboat Productions'),
('tt2487028','Walk of Fame',2017,'2017-03-24',93,'USA',null,'English','J Thomas Entertainment'),
('tt2516500','Granny of the Dead',2017,'2017-08-28',83,'UK',null,'English','TudorFilms Production'),
('tt2520046','Madraza',2017,'2017-05-25',94,'Argentina','$ 33048','Spanish','Kozen Films'),
('tt2523096','Needlestick',2017,'2017-02-21',85,'USA',null,'English','Decipher Entertainment'),
('tt2527336','Star Wars: Episode VIII - The Last Jedi',2017,'2017-12-14',152,'USA','$ 1332539889','English','Walt Disney Pictures'),
('tt2531334','Keep Watching',2017,'2017-10-31',89,'USA','$ 94178','English','Voltage Pictures'),
('tt2543472','Wonder',2017,'2017-12-01',113,'USA, Hong Kong','$ 305937718','English','Lionsgate'),
('tt2560792','Skybound',2017,'2017-11-07',82,'Germany',null,'English','Visionz'),
('tt2568862','Going in Style',2017,'2017-04-07',96,'USA','$ 84918541','English','De Line Pictures'),
('tt2582498','Sweet Virginia',2017,'2017-12-21',93,'USA, Canada','$ 14725','English','Automatik'),
('tt2582576','Sand Castle',2017,'2017-04-21',113,'USA',null,'English, Arabic','The Mark Gordon Company'),
('tt2597760','The Outcasts',2017,'2017-04-14',95,'USA','$ 61250','English','BCDF Pictures'),
('tt2610248','Verdwijnen',2017,'2017-03-02',90,'Netherlands, Norway','$ 55715','Dutch','Avrotros'),
('tt2620590','Leatherface',2017,'2017-09-14',90,'USA','$ 1476843','English','Campbell Grobman Films'),
('tt2630742','The Ascent',2017,'2017-10-01',98,'USA',null,'English',null),
('tt2658538','Austin Found',2017,'2017-07-07',104,'USA',null,'English','Caspian Pictures'),
('tt2674454','Churchill',2017,'2017-06-16',105,'UK','$ 6724365','English','Salon Pictures'),
('tt2721624','What Separates Us',2017,'2017-10-22',90,'USA',null,'English','Interwoven Studios'),
('tt2763304','T2 Trainspotting',2017,'2017-01-27',117,'UK','$ 41681746','English, Bulgarian, Scots','Artbees'),
('tt2771200','Beauty and the Beast',2017,'2017-03-17',129,'USA','$ 1263521126','English','Mandeville Films'),
('tt2776878','Thank You for Your Service',2017,'2017-10-27',109,'USA, India','$ 9995692','English','DreamWorks'),
('tt2783862','Xibalba',2017,'2017-05-02',88,'Mexico',null,'English, Spanish','Lanczyner Films'),
('tt2794684','Gatwick Gangsters',2017,'2017-11-06',106,'UK',null,'English, Spanish, German, Greek','Redgate Properties'),
('tt2814628','Beyond the Known World',2017,'2017-04-20',102,'New Zealand, India','$ 35690','English','Reservoir Films'),
('tt2827058','Mississippi Murder',2017,'2017-01-03',113,'USA',null,'English','Repertory Films'),
('tt2850480','The Girl Who Invented Kissing',2017,'2017-04-29',106,'USA',null,'English','308 Ent'),
('tt2852500','The Bigfoot Project',2017,'2017-04-04',90,'USA',null,'English','Fallen Films'),
('tt2872518','The Shack',2017,'2017-06-09',132,'USA','$ 96942115','English','Summit Entertainment'),
('tt2880664','Rednecks',2017,'2017-01-03',98,'USA',null,'English','Birmingham Films'),
('tt2898904','Paranormal Highway',2017,'2017-12-19',93,'USA',null,'English','Timber Wolf Productions'),
('tt2901896','Blood Hunt',2017,'2017-06-27',78,'Australia',null,'English','Stud Ranch'),
('tt2909966','Invasion of the Undead',2017,'2017-10-02',80,'USA',null,'English','Monsterbuster Entertainment'),
('tt2913562','Call Me King',2017,'2017-02-05',118,'USA',null,'English','Dark Energy Pictures'),
('tt2917484','Cute Little Buggers',2017,'2017-02-10',108,'UK',null,'English','Great Dayne Entertainment'),
('tt2920294','Cigarette Soup',2017,'2017-10-10',108,'USA',null,'English','DLP Media'),
('tt2923834','The Last Scout',2017,'2017-03-07',107,'UK, Germany',null,'English','Runaway Features'),
('tt2926924','Another You',2017,'2017-05-15',83,'USA',null,'English','Pennsport Media'),
('tt2928840','Nobility',2017,'2017-06-27',50,'USA',null,'English','Cowboy Errant'),
('tt2931376','The Wake',2017,'2017-07-04',86,'USA',null,'English','Lesson 1 Entertainment'),
('tt2932536','47 Meters Down',2017,'2017-07-26',89,'UK, USA','$ 62187529','English, Spanish','thefyzz'),
('tt2935390','The Snare',2017,'2017-01-06',90,'UK',null,'English','Bohemian Pictures'),
('tt2935516','Money',2017,'2017-09-27',90,'France','$ 25403753','French','Electrick Films'),
('tt2937366','Little Evil',2017,'2017-09-01',94,'USA',null,null,'Bluegrass Films'),
('tt2940482','American Justice',2017,'2017-01-02',83,'USA',null,'English','D Street Films'),
('tt2943946','The Circle',2017,'2017-10-26',93,'UK',null,'English','Callow Youth Productions'),
('tt2955304','Halal Daddy',2017,'2017-06-30',95,'Ireland, Germany, France','$ 11662','English','Benrae Florin Films'),
('tt2957760','Extortion',2017,'2017-07-27',108,'USA, Philippines, Puerto Rico','$ 8617','English','Filmmuse Productions'),
('tt2967226','Killing Hasselhoff',2017,'2017-08-29',80,'USA',null,null,'Lotus Pictures'),
('tt3011960','Hangman',2017,'2017-11-24',98,'USA',null,'English','Patriot Pictures'),
('tt3014284','The Lego Ninjago Movie',2017,'2017-10-13',101,'USA, Denmark, Australia','$ 123081555','English','LEGO System A/S'),
('tt3021984','Diane',2017,'2017-08-24',82,'USA',null,'English','Mean Time Productions'),
('tt3044664','Gold Star',2017,'2017-11-10',90,'USA',null,'English','Big Vision Creative'),
('tt3063364','The Most Dangerous Game',2017,'2017-04-25',89,'USA',null,'English','The Most Dangerous Game'),
('tt3118920','Stockholm',2017,'2017-03-28',99,'USA',null,'English','Penny Spent Films'),
('tt3121200','Breakdown Lane',2017,'2017-01-05',76,'Canada',null,'English','Twilight Pictures'),
('tt3130594','Juggernaut',2017,'2017-10-07',105,'Canada',null,'English','Mad Samurai Productions'),
('tt3132614','Dr. Jekyll and Mr. Hyde',2017,'2017-01-01',83,'USA',null,'English','Koa Aloha Media'),
('tt3148978','Capps Crossing',2017,'2017-06-09',85,'USA',null,'English','Aaronde Entertainment'),
('tt3151710','Billy Boy',2017,'2017-09-23',90,'USA',null,'English','Fiction Pictures'),
('tt3155328','Win It All',2017,'2017-04-07',88,'USA',null,'English','Forager Films'),
('tt3165632','5th Passenger',2017,'2017-12-13',89,'USA',null,null,'Adamant Images'),
('tt3171832','iBoy',2017,'2017-01-27',90,'UK',null,'English','Wigwam Films'),
('tt3180402','Getting Schooled',2017,'2017-02-07',83,'USA',null,'English','Lucky Chucky Productions'),
('tt3182620','Bitter Harvest',2017,'2017-02-24',103,'Canada, UK','$ 904399','English, Russian','Devils Harvest Production'),
('tt3183402','VerÃ³nica',2017,'2017-08-25',81,'Mexico',null,'Spanish','Producciones A Ciegas'),
('tt3188492','Call of the Wolf',2017,'2017-02-07',105,'USA',null,'English','Womack Film Works'),
('tt3194388','Six Hot Chicks in a Warehouse',2017,'2017-11-02',93,'UK',null,'English','Kill The Sunset Pictures'),
('tt3198000','Teleios',2017,'2017-09-05',89,'USA',null,'English','Thousand Mile Media'),
('tt3203620','The Dinner',2017,'2017-12-08',120,'USA','$ 2544921','English','ChubbCo Film'),
('tt3209826','Patel Ki Punjabi Shaadi',2017,'2017-09-14',120,'India','$ 81088','Hindi','Cinekorn Entertainment'),
('tt3212026','The Price',2017,'2017-11-10',91,'Nigeria, USA',null,'Yoruba, English','Hacienda Motion Picture Company'),
('tt3226454','Among Us',2017,'2017-08-08',91,'USA',null,'English','Kitchen Table Films'),
('tt3229488','Boone: The Bounty Hunter',2017,'2017-05-09',86,'USA',null,'English','Killion Street'),
('tt3244786','La musica del silenzio',2017,'2017-09-10',115,'Italy','$ 338778','English','Picomedia'),
('tt3249124','Hitchhiker Massacre',2017,'2017-12-03',82,'USA',null,'English','Retrofocus Pictures'),
('tt3255590','El Camino Christmas',2017,'2017-12-08',89,'USA',null,'English','Goldenlight Films'),
('tt3259276','Anabolic Life',2017,'2017-12-05',89,'USA',null,'English','Primitive Mind Productions'),
('tt3262342','Loving Vincent',2017,'2017-10-13',94,'Poland, UK, USA, Switzerland, Netherlands','$ 42187665','English','BreakThru Productions'),
('tt3263306','Base',2017,'2017-10-27',83,'UK, Switzerland, Italy, Brazil',null,'English','Infinite Wisdom Studios'),
('tt3266284','November Criminals',2017,'2017-11-07',107,'USA',null,'English, Mandarin','Black Bicycle Entertainment'),
('tt3268340','Crown Heights',2017,'2017-08-18',94,'USA','$ 238558','English','Iam21 Entertainment'),
('tt3280262','Cult of Chucky',2017,'2017-10-03',91,'USA',null,'English','Universal 1440 Entertainment'),
('tt3281920','Cuando los hijos regresan',2017,'2017-12-22',100,'Mexico','$ 2915643','Spanish','Invicta Films'),
('tt3284450','Benzin',2017,'2017-05-19',110,'Bulgaria','$ 480188','Bulgarian, English','A.B. Films'),
('tt3289804','The Beautiful Ones',2017,'2017-01-01',94,'USA',null,'English','Beautiful Ones Productions'),
('tt3291632','After School Special',2017,'2017-06-27',78,'USA',null,'English','Switzer Entertainment Group'),
('tt3296156','Mientras el Lobo No EstÃ¡',2017,'2017-02-24',123,'Mexico','$ 1791561','Spanish','Magnifico Entertainment'),
('tt3296908','HHhH',2017,'2017-06-07',120,'USA, France, UK, Belgium, Germany','$ 4412639','English, German, Czech, Latin, French','FilmNation Entertainment'),
('tt3297382','Jekyll Island',2017,'2017-01-13',84,'USA',null,'English','Windward Entertainment'),
('tt3300712','The UnMiracle',2017,'2017-08-01',97,'USA',null,'English',null),
('tt3300980','Den 12. mann',2017,'2017-12-25',135,'Norway','$ 9567121','English, Norwegian, German, Saami','Nordisk Film Production AS'),
('tt3305388','Mountain Top',2017,'2017-02-10',102,'USA',null,'English','Level Path Productions'),
('tt3311020','Be Afraid',2017,'2017-06-01',99,'USA','$ 161172','English','DarkShed'),
('tt3313054','Accident',2017,'2017-12-01',95,'South Africa, France',null,'English','Forefront Media Group'),
('tt3313314','Above Ground',2017,'2017-08-26',90,'USA',null,'English','Genesius'),
('tt3315342','Logan',2017,'2017-03-01',137,'USA','$ 619021436','English, Spanish','Twentieth Century Fox'),
('tt3322892','XX',2017,'2017-02-17',80,'Canada, USA','$ 55668','English','Snowfort Pictures'),
('tt3324852','District C-11',2017,'2017-03-21',83,'USA',null,null,'Camp 9 Films'),
('tt3325154','Carving a Life',2017,'2017-10-13',83,'USA',null,'English','Life In Reels Productions'),
('tt3332282','Apocalypse',2017,'2017-12-05',103,'UK',null,'English','Full Motion Entertainment'),
('tt3332372','Soundtrack',2017,'2017-07-06',112,'Brazil',null,'English','AnanÃ£ ProduÃ§Ãµes'),
('tt3335606','Berlin Syndrome',2017,'2017-06-09',116,'Australia','$ 397783','English, German, Russian','Aquarius Films'),
('tt3338188','Jia aur Jia',2017,'2017-10-27',93,'India',null,'Hindi, English','Bohra Bros Productions'),
('tt3343868','The Veil',2017,'2017-04-15',93,'USA',null,'English','BRG Films'),
('tt3348730','Jigsaw',2017,'2017-10-26',92,'USA, Canada','$ 102952888','English','Twisted Pictures'),
('tt3349578','Bad Kids of Crestview Academy',2017,'2017-01-13',100,'USA',null,'English','BKG2H Productions'),
('tt3350996','VooDoo',2017,'2017-02-24',83,'USA',null,'English','Hypercube Films'),
('tt3362238','Bad Frank',2017,'2017-07-03',103,'USA',null,'English','Vincenzo Productions'),
('tt3371366','Transformers: The Last Knight',2017,'2017-06-22',154,'USA, China, Canada','$ 605425157','English','Paramount Pictures'),
('tt3401392','Xian yi ren X de xian shen',2017,'2017-03-31',112,'USA, China','$ 59035664','Mandarin','Beijing Enlight Pictures'),
('tt3401882','Fist Fight',2017,'2017-03-03',91,'USA','$ 41087017','English','New Line Cinema'),
('tt3402236','Murder on the Orient Express',2017,'2017-11-03',114,'Malta, USA','$ 352789811','English, French, German, Arabic','Twentieth Century Fox'),
('tt3405236','Raees',2017,'2017-01-25',143,'India','$ 8428190','Hindi','Excel Entertainment'),
('tt3407614','Puriyaadha Pudhir',2017,'2017-09-01',140,'India','$ 65796','Tamil','Rebel Studio'),
('tt3409848','Zama',2017,'2017-09-28',115,'Argentina, Brazil, Spain, Dominican Republic, France, Netherlands, Mexico, Switzerland, USA, Portugal, Lebanon','$ 489692','Spanish, Portuguese','Bananeira Filmes'),
('tt3411444','Ferdinand',2017,'2017-12-09',108,'USA, Spain','$ 296069199','English, Spanish, German','Blue Sky Studios'),
('tt3415992','The Time of Their Lives',2017,'2017-03-10',104,'UK','$ 1125526','English','Bright Pictures'),
('tt3429340','Zona Zamfirova-drugi deo',2017,'2017-01-24',90,'Serbia','$ 1404','Serbian','RTV Pink'),
('tt3442726','Acapulco La vida va',2017,'2017-01-20',89,'Mexico',null,'Spanish','Gran Numeronce Producciones'),
('tt3447876','Deadly Sanctuary',2017,'2017-02-17',100,'USA',null,'English','First In Security Tactics'),
('tt3449322','Dirty Lies',2017,'2017-06-07',94,'USA',null,'English','Marshall Law Entertainment'),
('tt3450958','War for the Planet of the Apes',2017,'2017-07-11',140,'USA, Canada, New Zealand','$ 490719763','English, American Sign Language','Twentieth Century Fox'),
('tt3455326','Scareycrows',2017,'2017-10-31',73,'UK',null,'English','Inspired Toad Productions'),
('tt3462710','Unforgettable',2017,'2017-04-21',100,'USA','$ 17768012','English, French','DiNovi Pictures'),
('tt3465026','Palm Swings',2017,'2017-10-03',95,'USA',null,'English','Code Blue Pictures'),
('tt3469046','Despicable Me 3',2017,'2017-06-30',89,'USA','$ 1034799409','English','Illumination Entertainment'),
('tt3469798','Ã“rbita 9',2017,'2017-04-07',95,'Spain, Colombia','$ 297682','Spanish, English','Cactus Flower'),
('tt3481634','Inconceivable',2017,'2017-06-30',105,'UK, USA','$ 259635','English','Baker Entertainment Group'),
('tt3482000','A Thousand Junkies',2017,'2017-04-22',75,'USA',null,'English','THI Productions'),
('tt3486626','The Nut Job 2: Nutty by Nature',2017,'2017-08-11',91,'Canada','$ 65146020','English','ToonBox Entertainment'),
('tt3494610','Boots on the Ground',2017,'2017-08-26',86,'UK',null,null,'Last Bullet Films'),
('tt3499176','Your Move',2017,'2017-12-01',96,'USA',null,'English','ArtProd'),
('tt3499542','Black Ruby',2017,'2017-07-03',91,'USA',null,'English, Hebrew','Ave Fenix Pictures'),
('tt3501112','Security',2017,'2017-03-04',88,'USA','$ 776522','English','Millennium Films'),
('tt3501632','Thor: Ragnarok',2017,'2017-10-24',130,'USA','$ 853977126','English','Walt Disney Pictures'),
('tt3509978','Furthest Witness',2017,'2017-01-01',87,'UK, USA',null,'English','Animus Pictures'),
('tt3511928','Gholam',2017,'2017-05-25',94,'UK, Iran','$ 12378','English, Persian','Aimimage Productions'),
('tt3517984','The Ballerina',2017,'2017-10-20',106,'USA',null,'English',null),
('tt3521126','The Disaster Artist',2017,'2017-12-06',104,'USA','$ 29820616','English','Good Universe'),
('tt3529344','The Tank',2017,'2017-06-01',85,'USA',null,'English','Glacier Films'),
('tt3530328','Haunted',2017,'2017-01-01',86,'Italy','$ 215092','English','Funny Dreamers'),
('tt3531202','Pilgrimage',2017,'2017-08-02',96,'Ireland, Belgium, USA','$ 23689','English, Irish, French, Latin','Savage Productions'),
('tt3532216','American Made',2017,'2017-08-25',115,'USA, Japan, Colombia','$ 134866593','English, Spanish','Cross Creek Pictures'),
('tt3534294','Entanglement',2017,'2017-05-19',85,'Canada',null,'English','Goodbye Productions'),
('tt3552592','Fetish Factory',2017,'2017-01-01',71,'USA',null,'English','Blancbiehn Productions'),
('tt3564472','Girls Trip',2017,'2017-07-26',122,'USA, Canada','$ 140552359','English','Perfect World Pictures'),
('tt3567666','Stratton',2017,'2017-09-01',94,'UK','$ 257212','English','Atomic Arts'),
('tt3568804','Storm: Letters van Vuur',2017,'2017-01-19',100,'Netherlands, Belgium, Luxembourg','$ 453511',null,'Phanta Film'),
('tt3582020','Jawbone',2017,'2017-05-12',91,'UK','$ 33919','English','EMU Films'),
('tt3592904','Cross Wars',2017,'2017-02-07',98,'USA',null,null,'Morningstar Films'),
('tt3604156','Aliens: Zone of Silence',2017,'2017-10-24',79,'USA, Mexico',null,'English','Punch Media'),
('tt3605266','Everything Beautiful Is Far Away',2017,'2017-06-21',91,'USA',null,'English','MANALI PICTURES'),
('tt3606752','Cars 3',2017,'2017-07-14',102,'USA','$ 383930656','English','Pixar Animation Studios'),
('tt3611266','Bank Chor',2017,'2017-06-16',120,'India',null,'Hindi','Y-Films'),
('tt3615160','Gyakusatsu kikan',2017,'2017-02-03',115,'Japan','$ 4752','Japanese, English, Georgian, Hindi','Geno Studio'),
('tt3616934','Blood, Sand and Gold',2017,'2017-03-24',90,'USA, Hong Kong, Mexico, Morocco, Switzerland, United Arab Emirates',null,'English','American Film Productions'),
('tt3629032','Bunnyman Vengeance',2017,'2017-10-30',108,'USA',null,'English','ANOC Productions'),
('tt3630800','Another Yeti a Love Story: Life on the Streets',2017,'2017-02-14',77,'USA',null,'English',null),
('tt3641502','Zagros',2017,'2017-11-15',102,'Belgium','$ 16472','Dutch','Centre du CinÃ©ma et de lAudiovisuel de la FÃ©dÃ©ration Wallonie-Bruxelles'),
('tt3652142','Espionage Tonight',2017,'2017-10-24',85,'USA',null,'English, Spanish, French','O.S.S. Cinema Wing'),
('tt3652616','California Dreaming',2017,'2017-11-01',83,'USA',null,'English, Spanish, Afrikaans','Jaguar Motion Pictures'),
('tt3652978','Scramble',2017,'2017-12-26',102,null,null,'English','LA Reels'),
('tt3654796','Creep 2',2017,'2017-10-24',78,'USA',null,'English','Blumhouse Productions'),
('tt3664992','Angie X',2017,'2017-03-10',98,'USA',null,'English','Blue Creek Pictures'),
('tt3672120','Pottersville',2017,'2017-11-10',84,'USA',null,'English','Wing and a Prayer Pictures'),
('tt3685624','3 idiotas',2017,'2017-03-31',106,'Mexico','$ 7738470','Spanish','Greenlight Productions'),
('tt3693042','Grey Lady',2017,'2017-04-28',107,'USA',null,'English','Beacon Pictures'),
('tt3705608','Wyklety',2017,'2017-03-10',112,'Poland',null,'Polish','Fundacja Miedzy Slowami'),
('tt3705822','Moontrap: Target Earth',2017,'2017-02-07',85,'USA',null,'English','MT2 Productions'),
('tt3710966','Hello Again',2017,'2017-11-08',105,'USA',null,'English','SPEAKproductions'),
('tt3715296','Sex Guaranteed',2017,'2017-10-24',81,'USA',null,'English','C Plus Pictures'),
('tt3717490','Power Rangers',2017,'2017-03-23',124,'USA, Hong Kong, Japan, Mexico, Canada, New Zealand','$ 142337240','English, Mandarin','Lionsgate'),
('tt3717804','England Is Mine',2017,'2017-08-04',94,'UK','$ 366802','English','Honlodge Productions'),
('tt3721112','The Shadow People',2017,'2017-02-28',78,'USA',null,'English','Edgen Films'),
('tt3722062','Bokeh',2017,'2017-03-24',92,'USA, Iceland',null,'English','Zealous Pictures'),
('tt3722356','The Wicked One',2017,'2017-04-23',91,'USA',null,'English','Jonestown Films'),
('tt3722614','Revolt',2017,'2017-07-01',87,'UK','$ 24416','English','POW Movie'),
('tt3724490','Death Fighter',2017,'2017-07-25',88,'USA',null,'English','Gorilla Pictures'),
('tt3731562','Kong: Skull Island',2017,'2017-03-09',118,'USA, China','$ 566652812','English, Vietnamese','Warner Bros.'),
('tt3733068','SambÃ¡',2017,'2017-06-29',87,'Dominican Republic',null,'Spanish','Ecah Film'),
('tt3740066','Pop Aye',2017,'2017-04-13',104,'Thailand, Singapore','$ 204464','Thai','E&W Films'),
('tt3741188','Bonejangles',2017,'2017-07-18',78,'USA',null,'English','Labyrinth Films'),
('tt3746824','Volki i ovtsy. Beeezumnoe prevrashchenie',2017,'2017-04-28',85,'Russia','$ 4190750','Russian','Wizart Animation'),
('tt3750238','Besetment',2017,'2017-06-06',76,'USA',null,'English','Barbed Wire Films'),
('tt3752610','2 Years of Love',2017,'2017-01-24',88,'USA',null,null,'Talmarc Film Productions'),
('tt3758172','Jungle',2017,'2017-10-20',115,'Australia, Colombia, UK','$ 1906640','English, Spanish, German','Babber Films'),
('tt3758708','The Hippopotamus',2017,'2017-05-28',89,'UK','$ 273588','English','The Electric Shadow Company'),
('tt3758852','Blood Money',2017,'2017-10-13',100,'USA',null,'English','Envision Media Arts'),
('tt3760974','Prodigals',2017,'2017-11-30',109,'Canada',null,null,'Whiskaye Films'),
('tt3776518','Butterfly Kisses',2017,'2017-05-12',89,'UK',null,'English','Blue Shadows Films'),
('tt3784652','A Few Less Men',2017,'2017-03-09',92,'Australia','$ 380806','English','Feisty Dame Productions'),
('tt3787068','Psychos',2017,'2017-03-17',82,'USA',null,'English','Sunset Blvd Films'),
('tt3796876','The Grinn',2017,'2017-10-06',96,'USA',null,'English','Emberlight Productions'),
('tt3804448','House of Afflictions',2017,'2017-04-06',95,'UK',null,'English','Mr Stitch Films'),
('tt3808102','Clowntergeist',2017,'2017-09-12',80,'USA','$ 54209','English',null),
('tt3809276','Lost in Florence',2017,'2017-01-27',97,'Italy, USA',null,'English','Black Sand Pictures'),
('tt3810810','Nadie nos mira',2017,'2017-05-18',102,'Argentina, Spain, Colombia, Brazil, USA','$ 37292','Spanish, English, Portuguese','CEPA Audiovisual'),
('tt3811244','The Wedding Invitation',2017,'2017-01-01',90,'USA',null,'English','Its Raining Films'),
('tt3829920','Only the Brave',2017,'2017-11-10',134,'USA','$ 25754775','English','Black Label Media'),
('tt3830302','Road',2017,'2017-08-05',91,'UK',null,'English, Urdu, Spanish','T World Entertainment'),
('tt3831344','Amelia 2.0',2017,'2017-08-04',89,'USA','$ 10233','English','MORE Productions'),
('tt3831636','Slasher.com',2017,'2017-01-16',89,'USA',null,'English','Firefly Films'),
('tt3832326','Borley Rectory',2017,'2017-06-06',75,'UK',null,'English','Carrion Film'),
('tt3837842','Birds Like Us',2017,'2017-05-05',84,'Bosnia and Herzegovina, Turkey, UK, USA, Qatar',null,'English','Prime Time'),
('tt3838034','Seuls',2017,'2017-02-08',98,'France, Belgium','$ 2385151','French','Echo Films'),
('tt3844638','Liubov pret-a-porte',2017,'2017-03-02',90,'Italy, Russia','$ 270790','Italian, Russian','Bell Film'),
('tt3844876','The Legend of Ben Hall',2017,'2017-06-17',139,'Australia',null,'English','RLC Motion Picture Entertainment'),
('tt3844962','Dead Body',2017,'2017-10-17',85,'USA',null,'English','Divingbell'),
('tt3847642','Kill Order',2017,'2017-01-01',77,'Canada',null,'English','2X Entertainment'),
('tt3852028','Maggie Black',2017,'2017-04-20',84,'USA',null,'English','Assemblage of Nouns Productions'),
('tt3858454','Stegman Is Dead',2017,'2017-01-01',84,'Canada',null,'English','Julijette'),
('tt3859272','Tragedy Girls',2017,'2017-10-20',98,'USA','$ 122211','English','Its The Comeback Kids'),
('tt3859872','West of Eden',2017,'2017-03-09',118,'New Zealand',null,'English','Little Red Hen Pictures'),
('tt3861144','Viktorville',2017,'2017-12-30',93,'USA',null,'English','#Sinning Works'),
('tt3864934','Los que aman odian',2017,'2017-09-07',101,'Argentina','$ 1764833','Spanish','Distribution Company'),
('tt3868240','Vsetko alebo nic',2017,'2017-01-12',107,'Slovakia, Czech Republic, Poland','$ 6436983','Slovak, Czech',null),
('tt3874544','The Boss Baby',2017,'2017-04-01',97,'USA','$ 527965936','English, Spanish','DreamWorks Animation'),
('tt3881026','Rendel',2017,'2017-09-22',105,'Finland','$ 111795','Finnish, English','Black Lion Pictures'),
('tt3881784','Stronger',2017,'2017-12-08',119,'USA','$ 8484418','English','Bold Films'),
('tt3884282','Strangers Within',2017,'2017-04-24',95,'UK',null,'English','2050 Films'),
('tt3887158','The Legend of King Solomon',2017,'2017-09-28',80,'Israel, Hungary','$ 22282','English','Cinemon Entertainment'),
('tt3889156','Dark Beacon',2017,'2017-10-13',75,'UK',null,'English','Green 13 Films'),
('tt3890160','Baby Driver',2017,'2017-06-28',113,'UK, USA','$ 226945087','English, American Sign Language','TriStar Pictures'),
('tt3891538','Undercover Grandpa',2017,'2017-07-07',94,'Canada',null,'English, German','CCI Entertainment'),
('tt3896198','Guardians of the Galaxy Vol. 2',2017,'2017-04-28',136,'USA','$ 863756051','English','Marvel Studios'),
('tt3910416','Escape Artist',2017,'2017-03-22',106,'USA',null,'English','Vision Productions (II)'),
('tt3910736','Gun Shy',2017,'2017-09-08',92,'UK','$ 2480','English','Salty Film'),
('tt3915560','The Nth Ward',2017,'2017-08-29',100,'USA',null,'English',null),
('tt3919234','By Any Name',2017,'2017-05-05',90,'UK',null,'English','Tanabi Films'),
('tt3920890','Heartland',2017,'2017-01-27',100,'USA',null,'English','Heartland Films'),
('tt3922818','The Space Between Us',2017,'2017-02-10',120,'USA','$ 14793385','English','Los Angeles Media Fund (LAMF)'),
('tt3923004','Lake Alice',2017,'2017-07-18',80,'USA',null,'English','Buffalo 8 Productions'),
('tt3945864','Yalghaar',2017,'2017-06-26',158,'Pakistan','$ 193040','Urdu','Mind works Media'),
('tt3946960','Chapter & Verse',2017,'2017-02-03',97,'USA','$ 84147','English','The Bubble Factory'),
('tt3950032','Happy Birthday, Toby Simpson',2017,'2017-05-13',82,'UK',null,'English','Humble Bee Films'),
('tt3962184','Hebbuli',2017,'2017-02-23',141,'India','$ 38052','Kannada','S.R.V. Productions'),
('tt3962984','The Black Prince',2017,'2017-07-21',118,'UK, India, USA','$ 632823','English, Punjabi','Brillstein Entertainment Partners'),
('tt3967856','Okja',2017,'2017-06-28',120,'South Korea, USA','$ 2049823','English, Korean, Spanish','Kate Street Picture Company'),
('tt3980372','Courageous Love',2017,'2017-02-14',100,'USA',null,'English','Crystal Creek Media'),
('tt3983902','House by the Lake',2017,'2017-10-10',77,'USA',null,'English','Anvil Entertainment'),
('tt3984432','Ghost Source Zero',2017,'2017-11-02',95,'USA',null,'English','Planet Nerd Rage Productions'),
('tt3985430','Legionario',2017,'2017-02-17',80,'Spain',null,'Spanish','Pier 922 Studios'),
('tt4012424','O Filme da Minha Vida',2017,'2017-08-03',113,'Brazil','$ 1114594','Portuguese','Metro-Goldwyn-Mayer (MGM)'),
('tt4022758','The Honor Farm',2017,'2017-03-10',74,'USA',null,null,'Arts+Labor'),
('tt4030600','The Bye Bye Man',2017,'2017-01-13',96,'USA, China','$ 26667197','English','Huayi Brothers Media'),
('tt4031126','Lycan',2017,'2017-08-04',87,'USA','$ 9110','English','1 Bullet in the Gun Productions'),
('tt4041476','Ultimate Justice',2017,'2017-10-03',93,'Germany',null,'English','International Film Partners'),
('tt4044896','Ayla',2017,'2017-09-21',86,'USA','$ 13010729','English','Clayface Pictures'),
('tt4045894','Get the Girl',2017,'2017-01-27',87,'USA',null,null,'Diablo Entertainment (II)'),
('tt4065552','Tuntematon sotilas',2017,'2017-10-27',180,'Finland, Belgium, Iceland','$ 15717199','Finnish','ElokuvaosakeyhtiÃ¶ Suomi 2017'),
('tt4067062','Fallen Stars',2017,'2017-03-14',88,'USA',null,'English','El Camino Entertainment'),
('tt4073304','The Attic',2017,'2017-11-20',72,'Thailand',null,'English, Thai','River Kwai Bridge Films'),
('tt4073682','Bugday',2017,'2017-11-24',123,'Turkey, Germany, France, Sweden, Qatar','$ 74017','English','Kaplan Film'),
('tt4081012','In Extremis',2017,'2017-01-01',93,'UK',null,'English','Goldfinch'),
('tt4082644','Canaries',2017,'2017-08-26',84,'UK',null,'English','Maple Dragon Films'),
('tt4102722','The Night Watchmen',2017,'2017-11-21',80,'USA',null,'English','Contender Films'),
('tt4105584','Deep',2017,'2017-11-03',92,'Spain, Belgium, Switzerland, USA, China, UK','$ 10830426','English','The Thinklab'),
('tt4109632','A Million Happy Nows',2017,'2017-01-01',80,'USA',null,'English','Open Book Productions'),
('tt4111826','Rough Stuff',2017,'2017-03-16',120,'Australia',null,'English','Progressive Pictures'),
('tt4116284','The Lego Batman Movie',2017,'2017-02-10',104,'USA, Denmark','$ 311950384','English','DC Entertainment'),
('tt4117326','O Rastro',2017,'2017-05-18',90,'Brazil','$ 206454','Portuguese','Lupa Filmes'),
('tt4119054','Top Knot Detective',2017,'2017-04-01',87,'Australia, Japan',null,'Japanese, English, Cantonese','Blue Forest Media'),
('tt4119208','Photon',2017,'2017-10-06',107,'Poland',null,'Polish','Lightcraft'),
('tt4121610','Tulipani: Liefde, eer en een fiets',2017,'2017-09-21',90,'Netherlands','$ 608725','English, Italian, Dutch','FATT Productions'),
('tt4125654','Butterfly Caught',2017,'2017-10-06',107,'USA',null,'English','Toward The Sun Productions'),
('tt4126568','Open Water 3: Cage Dive',2017,'2017-04-27',80,'Australia','$ 836413','English','Just One More Productions'),
('tt4129428','Jagga Jasoos',2017,'2017-07-14',161,'India','$ 1154862','Hindi','Atlanta Production'),
('tt4131800','My Little Pony: The Movie',2017,'2017-10-20',99,'USA, Canada','$ 60330833','English','Lionsgate'),
('tt4132190','The Babymoon',2017,'2017-02-14',99,'USA',null,'English','Double Entente Films'),
('tt4134826','But Deliver Us from Evil',2017,'2017-04-27',109,'USA','$ 285169','English','20/20 Visions Entertainment Group'),
('tt4135326','Lane 1974',2017,'2017-03-11',79,'USA',null,'English','Pressing Pictures'),
('tt4144332','Deidra & Laney Rob a Train',2017,'2017-03-17',92,'USA',null,'English','General Population (GenPop)'),
('tt4147596','Breaking Legs',2017,'2017-01-01',98,'USA',null,'English','UFO Pictures'),
('tt4157144','Quest',2017,'2017-09-15',86,'USA',null,'English','TheTruthAlwaysRises'),
('tt4162860','Restraint',2017,'2017-10-08',95,'USA',null,'English','BYT MEdia'),
('tt4172498','E19 Virus',2017,'2017-06-16',88,'USA',null,'English',null),
('tt4173170','Ikitie',2017,'2017-09-15',103,'Finland, Estonia, Sweden','$ 1622834','Finnish, English, Russian','Matila RÃ¶hr Productions (MRP)'),
('tt4177498','A Room to Die For',2017,'2017-01-16',84,'UK',null,'English','Champagne Charlie Productions'),
('tt4180286','Valley of Bones',2017,'2017-09-01',90,'USA','$ 168738','English','Bad Medicine Films'),
('tt4181782','The Crucifixion',2017,'2017-10-06',90,'UK, Romania, USA','$ 6554322','English','Motion Picture Capital'),
('tt4185370','Sleepwalker',2017,'2017-10-10',88,'USA',null,'English','Night and Day Pictures'),
('tt4191486','Yamasong: March of the Hollows',2017,'2017-09-10',95,'USA',null,'English','Dark Dunes Productions'),
('tt4207196','Del Playa',2017,'2017-07-21',101,'USA',null,'English','Belligerent Seal Productions'),
('tt4215674','Highway to Havasu',2017,'2017-03-07',108,'USA',null,'English','AMP Creative'),
('tt4217392','Gong fu yu jia',2017,'2017-01-28',107,'USA, China, India, Nepal, Hong Kong, United Arab Emirates, Iceland','$ 254212245','Mandarin, English','Sparkle Roll Media'),
('tt4217878','Einsamkeit und Sex und Mitleid',2017,'2017-05-04',119,'Germany',null,'German, Arabic, English','Herzfeld Productions'),
('tt4218696','The Wall',2017,'2017-07-28',88,'USA','$ 4476705','English','Amazon Studios'),
('tt4225622','The Babysitter',2017,'2017-10-13',85,'USA',null,'English','Boies / Schiller Film Group'),
('tt4229578','The Adventure Club',2017,'2017-02-10',88,'Canada',null,null,'Creation Ink'),
('tt4232130','Bloodlands',2017,'2017-09-22',82,'Australia, Albania',null,'Albanian','Kastle Films'),
('tt4249580','Cannibals and Carpet Fitters',2017,'2017-01-01',83,'UK',null,'English','Fascination Pictures');
select * from Movie;

/* To display a records with first 150 rows of the table with Limit*/
select * from Movie limit 150;

select * from Movie ;
/* To display the records where id between 'tt0012494' and 'tt1281966' and country='Usa' without index*/
select * from Movie where id between 'tt0012494' and 'tt1281966' and country='Usa';

explain select * from Movie where id between 'tt0012494' and 'tt1281966' and country='Usa';
 /* create index*/
create index idx_Id
on Movie(id, Country);

/* view the indexes from movie table*/
show indexes from  Movie;

 /*To display the records where id between 'tt0012494' and 'tt1281966' and country='Usa' after using index*/
select * from Movie where id between 'tt0012494' and 'tt1281966' and country='Usa';
explain select * from Movie where id between 'tt0012494' and 'tt1281966' and country='Usa';

create database Detail_of_employees;
use Detail_of_employees;

create Table employee(
emp_id int primary key,
emp_name varchar(30),
job_name varchar(20),
manager_id int,
hire_date date,
salary float,
commission float,
dep_id int 
);
  
  Insert into employee
  values
  (68319 ,'KAYLING'  , 'PRESIDENT' ,  null,  '1991-11-18', 6000.00,  null, 1001),
  (66928, 'BLAZE',      'MANAGER',   68319 , '1991-05-01' , 2750.00 , null ,3001),
  (67832 ,'CLARE'    , 'MANAGER'   , 68319 , '1991-06-09' , 2550.00 , null , 1001),
  (65646 ,'JONAS'   , 'MANAGER'   ,  68319 , '1991-04-02' , 2957.00 , null , 2001),
  (67858 ,'SCARLET'  , 'ANALYST'   , 65646 , '1997-04-19' , 3100.00 , null , 2001),
  (69062 ,'FRANK'   , 'ANALYST'  ,   65646 , '1991-12-03', 3100.00 ,  null , 2001),
  (63679 ,'SANDRINE' , 'CLERK'  ,    69062 , '1990-12-18' ,  900.00 , null , 2001),
  (64989 ,'ADELYN'   , 'SALESMAN'  , 66928 , '1991-02-20' , 1700.00 , 400.00,3001),
  (65271 , 'WADE'    , 'SALESMAN'  , 66928 , '1991-02-22' , 1350.00 , 600.00 ,3001),
  (66564 , 'MADDEN'   , 'SALESMAN'  ,66928 , '1991-09-28' , 1350.00 , 1500.00 ,3001),
  (68454 , 'TUCKER'   , 'SALESMAN' , 66928 , '1991-09-08' , 1600.00 ,    0.00 ,3001),
  (68736 , 'ADNRES'   , 'CLERK'     ,67858 , '1997-05-23' , 1200.00 , null , 2001),
  (69000 , 'JULIUS'   , 'CLERK'    , 66928 , '1991-12-03' , 1050.00 , null ,3001),
  (69324 , 'MARKER'  , 'CLERK'     , 67832 , '1992-01-23' , 1400.00 , null ,1001);
 select * from employee;
 truncate table employee;

/* Procedure to get the total number of employees according to job description*/
Delimiter $$
create procedure employment(
IN jdesc varchar(18),
OUT total int)
Begin
select COUNT(emp_id) 
INTO total
from employee
where job_name=jdesc;
End $$
Delimiter ;

call employment('CLERK', @total);
select @total;

-- Drop procedure IF EXISTS employment; 
/*To show a message of employees getting and not getting commission using case*/
select emp_id, emp_name, 
CASE 
when commission is not null  then 'Employee receives commission'
Else 'Employee do not receives commission'
END AS Commission_Status
FROM employee;

create database detail_of_sales;
use detail_of_sales;

create Table Sale(
P_id int primary key,
Country varchar(20),
Sales_Amt varchar(21)
);


Insert Into Sale
Values
(110,'Russia',1200000),
(111,'Russia',1200000),
(112,'India',1500000),
(113,'China',22550000),
(114,'Venzula',1400000),
(115,'Srilanka',10000000),
(116,'Srilanka',12444020),
(117,'Venzula',1400000);

Select * from Sale;
update Sale 
set Sales_Amt='1350000' where P_id=111;
update Sale
set Sales_Amt='1540000' where P_id=114;
/* Queries using Ranking window functions*/
select P_id, Country,Sales_Amt,
Rank() over(order by Country) as Rankno
from Sale;

select P_id, Country,Sales_Amt,
dense_rank() over(order by Country) as DenseRankno
from Sale;

select P_id, Country,Sales_Amt,
row_number() over(partition by Country order by Country) as Rowno
from Sale;
/*Queries using Aggregate window function*/
select P_id, Country,Sales_Amt,
min(Sales_Amt) over(partition by Country order by Country) as min_of_sales
from Sale;

select P_id, Country,Sales_Amt,
max(Sales_Amt) over(partition by Country order by Country) as max_of_sales
from Sale;

select P_id, Country,Sales_Amt,
sum(Sales_Amt) over(partition by Country order by Country) as sum_of_sales
from Sale;

select P_id, Country,Sales_Amt,
avg(Sales_Amt) over(partition by Country order by Country) as avg_of_sales
from Sale;
/* Oueries using value window function*/
select P_id, Country,Sales_Amt,
first_value(Sales_Amt) over(partition by Country order by Country) as firstvalue_of_sales
from Sale;

select P_id, Country,Sales_Amt,
last_value(Sales_Amt) over(partition by Country order by Country) as lastvalue_of_sales
from Sale;

select P_id, Country,Sales_Amt,
lag(Sales_Amt) over(partition by Country order by Country) as Lag_of_salesvalue
from Sale;

select P_id, Country,Sales_Amt,
lead(Sales_Amt) over(partition by Country order by Country) as Lead_of_salesvalue
from Sale;








 











