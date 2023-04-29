--第三周小课
create database studb go
sp_helpdb studb;
alter database studb modify file
    (name=studb,
        size=10MB,
        maxsize=200MB,
        filegrowth=5MB);
alter database studb
add log file
(name=studb_Log2,
    filename='C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\studb_log2.ldf',
    size =5MB,
    MAXSIZE =10MB);

alter database studentsdb remove file studentsdb_dat;

create database teach
go

use teach
go

sp_helpconstraint course

create table course
(课程编号 char(4) primary key not null ,
课程名称 nchar(50) unique not null ,
学分 int not null  check (学分 between 2 and 4),
学期 nchar(20) default('2022-2023第一学期') not null ,

)

-- create table grade(
--     学号 char(4) not null,
--     课程编号 char(4) not null ,
--     分数 float,
--     constraint pk_g_id primary key(学号,课程编号),
--     constraint fk_g_s_id foreign key (学号) references student(学号)
--     on delete no action on update cascade
-- )

create database sales
go
use sales
go

create table employee(
Eid char(4) not null primary key,
Ename char(8) not null unique,
Esex char(2) not null default '男' check (Esex='男'or Esex='女'),
Hiredate date not null ,
Eaddress varchar(50),
Telephone char(8),
Wages money,
Department_id char(4),
Eresume text
)go

insert into employee (Eid, Ename, Esex, Hiredate, Eaddress, Telephone, Wages, Department_id, Eresume)
values ('E01','钱达理','男','2005-05-12','东风东五路',7785232,4000.0000,'D001','1992年华中科技大学')go

insert into employee
values ('E02','东方牧','男','2008-06-11','五一北路号',7585232,5000.0000,'D001','1998年华师')go;

insert into employee values
('E03','郭文斌','男','2016-05-12','公司集体宿舍',8695232,6500.0000,'D002','2000年中国科大') go

insert employee
values ('E04','肖海燕','女','2016-5-12','公司集体宿舍',7785450,5500,'D003','2000年中国科大')

insert employee(Eid,Ename,Esex,Hiredate)
values ('E05','吴军林',default,'2022-9-29')

insert employee
values ( 'E08','张琳琳','女','2017-5-4','北京路',77855412,6000,'D003',Null),
       ( 'E09','李忠英','男','2018-1-1','前进二路',76852321,5500,'D003',Null),
    ('E10','赵小吴','女','2020-2-3','南京路',76852352,4200,'D002',Null)

update employee set Ename='李应忠'
                where Eid='E09'go

update employee set Wages=5000
where Department_id='D002'and Esex='女'go

update employee set Wages+=500 go

update employee set Wages=6000,Telephone=77777777 where
Department_id='D001'or Wages<6000 go

select *from employee go

delete employee where Eid='E09'and Ename='李应忠'


create table txygs
(Eid char(4) ,
 Ename char(8) ,
 Hiredate  date
)go

insert into txygs (Eid, Ename, Hiredate) values
(SELECT Eid, Ename, Hiredate from employee where employee.Hiredate<'2016-01-01')go--错误

insert into txygs (Eid, Ename, Hiredate)
(SELECT Eid, Ename, Hiredate from employee where employee.Hiredate<'2016-01-01')go

select *from employee where Hiredate<'2016-01-01'

select *from txygs


update  employee
set Eaddress='广从南路548号',Telephone=87818109
where  Department_id='D003' and  Ename !='赵小吴'
go

update employee
set Wages=Wages*0.2+Wages
where  datediff(year,Hiredate,getdate())>=5

update employee
set Esex = (select Esex from employee  where  Ename='吴军林')
where Ename='张琳琳'

update employee
set Department_id = (select Department_id from employee where Ename='赵小吴')
where Ename='张琳琳'
select * from txygs
--国庆节作业
create database company_info
go

use company_info
go

create table Employee
(	雇员ID int identity(1001,1) primary key,
	雇员姓名  char(8) not null,
	性别  char(2) not null default '男' ,
	出生日期  datetime,
	雇佣日期  datetime not null ,
	特长 varchar(50),
	薪水 money)
go

create table Category
(	类别ID  int  primary key,
	类别名称 char(30) not null,
	类别说明 char(50))
go

create table Product
(	产品ID int primary key,
	产品名称 char(10) not null,
	类别ID int not null foreign key references Category( 类别ID ) ,
	单价  money not null,
	库存量  int not null,)
go

create table Customer
(	客户ID  int primary key,
	公司名称 char(30) not null,
	联系人姓名 char(8) not null,
	联系方式  char( 13),
	地址  char(30),
	邮箱 char(6))
go

create table P_order
(	订单ID int primary key,
	产品ID int not null foreign key references Product(产品ID),
	数量 int not null,
	雇员ID int not null foreign key references Employee(雇员ID),
	客户ID int not null foreign key references Customer(客户ID),
	订货日期 Datetime  not null
	)
go

create table o_employee
(雇员ID int identity primary key,
 雇员姓名 char(8) not null,
 性别 char(2) not null default '男' check(性别 ='男' or 性别 ='女'),
 雇佣日期 datetime  not null default getdate(),
 薪水  money  not null default 2000
)
go

create table o_order
(订单ID int identity primary key,
雇员ID  int not null foreign key references o_employee(雇员ID)
)
go

alter table Employee
add check (性别 IN ('男','女'))
go

alter table Customer
add  memo char(50)
go

alter table Product
add unique (产品名称)
go

alter table Employee
add default 2000 for  薪水
go

insert into Employee(雇员姓名,性别,出生日期,雇佣日期,特长,薪水) values (
                                                      '貂蝉','女','2018-06-06','2022-09-30','唱跳rap篮球',9999)go



select *from Employee go


use master

drop database if exists company_info
go
--10.1
--创建数据库
CREATE DATABASE company_info
GO
--连接数据库
USE company_info
GO
--创建employee表
CREATE TABLE Employee
(雇员ID int IDENTITY(1001,1) PRIMARY KEY,
 雇员姓名 CHAR(8) NOT NULL,
 性别 char(2) NOT NULL DEFAULT '男' CHECK (性别='男' OR 性别='女'), --非空、默认、检查约束
 出生日期 datetime,
 雇佣日期 datetime DEFAULT GETDATE(), --默认为当前录入日期
 特长 varchar(50),
 薪水 money DEFAULT 2000  --默认工资2000
)

--创建Category表
CREATE TABLE Category
(类别ID int PRIMARY KEY,
 类别名称 CHAR(30) NOT NULL,
 类别说明 char(50)
)

--创建Product表
CREATE TABLE Product
(产品ID int PRIMARY KEY,
 产品名称 char(10) NOT NULL UNIQUE, --非空、唯一约束
 类别ID int NOT NULL FOREIGN KEY REFERENCES Category(类别ID),--外键约束，关联Category的类别ID列
 单价 money NOT NULL,
 库存量 int NOT NULL
)

--创建Customer表
CREATE TABLE Customer(
客户ID int PRIMARY KEY,
公司名称 char(30) NOT NULL,
联系人姓名 char(8) NOT NULL,
联系方式 char(13),
地址 char(30),
邮编 char(6),
备注 char(50)
)

--创建P_order表（订单表）
CREATE TABLE P_order
(订单ID int PRIMARY KEY,
 产品ID int NOT NULL FOREIGN KEY REFERENCES Product(产品ID),
 数量 int NOT NULL,
 雇员ID int NOT NULL FOREIGN KEY REFERENCES Employee(雇员ID),
 客户ID int NOT NULL FOREIGN KEY REFERENCES Customer(客户ID),
 订货日期 datetime NOT NULL
)
insert Employee
values('陆梓鹏','男','2002-8-27','2022-2-9',Null,6666),
('陈宇扬','男','2003-4-5','2021-1-3',Null,5000),
('张三','男','1988-4-5','2010-1-1',Null,8000),
('李四','女','1992-2-3','2012-4-5',null,6000),
('汤华翔','男','2003-2-18','2018-2-5',Null,3000)go

update employee set 特长='唱跳rap' where 雇员ID=1005;

select *from Employee
go

select *from Category
go

insert into Category values (
'A001','ikun','唱跳rap，basketball',
'A002','猫','喵喵喵','dance',
'A003','狗','汪汪汪','bark',
 'A004','猪','zhu'                            )
go

insert into Category values (
1,'财务部','管钱的',
2,'技术部','敲代码',
3,'宣传部','宣传的',
4,'外联部','搞物资',
5,'秘书部','当秘书'
)go-- 错误示范


insert into Category values (
1,'财务部','管钱的'),(
2,'技术部','敲代码'),(
3,'宣传部','宣传的'),(
4,'外联部','搞物资'),(
5,'秘书部','当秘书'
)go





insert into Product values (10010,'苹果',1,9999,100),(10011,'hp',2,10000,99),(10012,'外星人',3,99888,1),(10013,'华为',4,5000,2),
                           (10014,'联想',5,6000,999)go

select *from Customer
go

insert Customer
values(101,'晨光书店','萧红','电话',null,null,null),
(102,'和风高中','赵晓明','电话',null,null,null),
(103,'东南实业','王小明','电话',null,null,null),
(104,'破晓书店','钱达理','电话',null,null,null),
(107,'麦当当','李小洪','电话',null,null,null)
go

insert into P_order values (1001,10010,5,1001,101,2022-10-01),(1002,10011,6,1002,102,2022-09-30)
,(1003,10012,7,1003,103,2022-09-29),(1004,10013,9,1004,104,2022-08-29),(1005,10014,10,1005,107,2022-07-30)go


select *from Product;
select *from  P_order go

select *from employee
select *from Customer;

insert into Customer (客户ID, 公司名称, 联系人姓名) values(105,'肯德基','麦小当')
go

update Customer set 联系人姓名='李洁' where 公司名称='东南实业'go

update Customer set 联系方式 +='020-'
go

update Customer set Customer.联系方式='020-'+Customer.联系方式 go

select *from Customer go


update Customer set Customer.联系方式=replace(联系方式,'电话',10089612)
update Customer set Customer.联系方式='020-1008616'where Customer.联系方式=null;

update Employee set 薪水+=100 where [company_info].[dbo].Employee.雇佣日期<'2020'go

select *from employee go
UPDATE company_info.dbo.Customer
SET 联系方式 = N'020-1008615  '
WHERE 客户ID = 107;

UPDATE company_info.dbo.Customer
SET 联系方式 = N'null'
WHERE 客户ID = 105;

delete from Customer where 联系方式=null;--错误，因为是字符串

delete from Customer where 联系方式='null';
select *from Customer
go

select *from Category go
update Category set company_info.dbo.Category.类别名称='计算机耗材' where Category.类别ID=4;
select *from Product go

update company_info.dbo.Product set company_info.dbo.Product.单价*=0.9
                                where 类别ID= (select 类别ID from Category where 类别名称='计算机耗材')


delete  Product where company_info.dbo.Product.单价<1
go

--
select getdate()

--------------------------------------
-- 实验6
use  NorthwindCN
go

select * from 产品
go
select * from 类别
go

select 产品名称,单价,库存量,订购量 from 产品
join 类别 类 on 产品.类别ID = 类.类别ID
where 类.类别名称='点心'
go

select 产品名称,单价,库存量,订购量 from 产品,类别
where 类别名称='点心'  and   产品.类别ID = 类别.类别ID
go

select *from 订单
select *from 订单明细
select *from 雇员
select *from 客户

select 订.订单ID,雇员.姓名,订.订购日期,客.客户ID,联系人姓名,客.公司名称 from 雇员
join   订单 订 on 雇员.雇员ID = 订.雇员ID join 客户 客 on 订.客户ID = 客.客户ID
where 订.订购日期 between '1998-03-01' and '1998-03-31'go

select 订单明细.订单ID,产品.产品ID,产品.产品名称,订单明细.单价,订单明细.数量
from 订单明细,产品
where 订单明细.产品ID=产品.产品ID and 订单明细.订单ID in (10808,10882)
go

SELECT 订单明细.订单ID,订单明细.产品ID,产品.产品名称,订单明细.单价,订单明细.数量,总价=订单明细.单价*数量
FROM 订单明细 JOIN 产品 ON 订单明细.产品ID=产品.产品ID
WHERE 订单明细.订单ID IN (10808,10882);


select * from 订单明细 join 订单 订 on 订.订单ID = 订单明细.订单ID
go



select 订单ID,雇员.姓名,订单.订购日期,客户.客户ID,客户.联系人姓名,客户.公司名称 from 客户
--join 订单 on 订单.订单ID = 订单.订单ID
    join 订单 on 客户.客户ID=订单.订单ID
    join 雇员  on 订单.雇员ID = 雇员.雇员ID
where 订单.订购日期 between '1998-03-01' and '1998-03-31'
go


select * from 客户
join 订单 on 订单.客户ID=客户.客户ID
join 雇员 on 订单.雇员ID = 雇员.雇员ID
where  订单.订购日期 between '1998-3-1' and '1998-3-31'

select 订单ID,雇员.姓名,订单.订购日期,客户.客户ID,客户.联系人姓名,客户.公司名称 from 雇员
    join 订单 on 订单.客户ID=订单.雇员ID
    join 客户 on 雇员.雇员ID=客户.客户ID
where 订单.订购日期 between '1998-03-01' and '1998-03-31'
go--在将 nvarchar 值 'ALFKI' 转换成数据类型 int 时失败。--不知道如何解决
--没对应好

SELECT 订单ID,雇员.姓名,订单.订购日期,订单.客户ID,客户.联系人姓名,客户.公司名称 FROM 雇员
    JOIN 订单 ON 雇员.雇员ID=订单.雇员ID
    JOIN 客户 ON 订单.客户ID=客户.客户ID
WHERE 订单.订购日期 BETWEEN '1998-3-1' AND '1998-3-31'go

select 订单ID,产品.产品ID,产品.产品名称,订单明细.单价,订单明细.数量,
       总价=订单明细.数量*订单明细.单价 from 订单明细
    join 产品 on 订单明细.产品ID = 产品.产品ID
where 订单明细.订单ID in(10808,10882)
go

select  a.产品ID,a.产品名称,a.单价 from 产品 a
join 产品  b on a.单价>b.单价
where b.产品名称='猪肉干'
go
select *from 订单明细;
select  雇员.雇员ID,雇员.姓名,count(订单.订单ID) as 订单总量,
       订单总额=订单明细.数量*订单明细.单价*(1-订单明细.折扣) from 雇员
       join  订单  on 雇员.雇员ID = 订单.雇员ID
     join  订单明细 on 订单.订单ID = 订单明细.订单ID
WHERE 订单.订购日期 BETWEEN '1998-3-1' AND '1998-3-31'
group by 雇员.雇员ID, 雇员.姓名, 订单明细.数量*订单明细.单价*(1-订单明细.折扣)
order by 订单总额 desc
go--错误

SELECT 雇员.雇员ID,雇员.姓名,COUNT(订单.订单ID) 订单总量,SUM(订单明细.单价*数量*(1-折扣)) AS 订单总额
FROM 雇员 JOIN 订单 ON 雇员.雇员ID=订单.雇员ID
    LEFT JOIN 订单明细 ON 订单.订单ID=订单明细.订单ID
WHERE 订单.订购日期 BETWEEN '1998-3-1' AND '1998-3-31'
GROUP BY 雇员.雇员ID,雇员.姓名
ORDER BY 订单总额 DESC
go
---实验7
select 产品ID,产品名称,产品.单价 from 产品 where 产品.单价>
                                     (select 单价 from 产品 where 产品.产品名称='猪肉干')
                               order by 单价 desc
go


select 单价 from 产品 where 产品.产品名称='猪肉干';--子查询

select 产品.产品ID,产品名称,产品.单价 from 类别 join 产品 on 类别.类别ID = 产品.类别ID
         where 类别.类别ID=3 and 产品.单价>all(
select 产品.单价 from 类别 join 产品 on 类别.类别ID = 产品.类别ID where 类别.类别ID=2)
go


select * from 产品;

select 产品.单价 from 类别 join 产品 on 类别.类别ID = 产品.类别ID where 类别.类别ID=2;
select 产品.单价 from 类别 join 产品 on 类别.类别ID = 产品.类别ID where 类别.类别ID=3;

select 产品.产品ID,产品名称,产品.单价 from 类别 join 产品 on 类别.类别ID = 产品.类别ID
         where 类别.类别ID=3 and 产品.单价>any(
select 产品.单价 from 类别 join 产品 on 类别.类别ID = 产品.类别ID where 类别.类别ID=2)
go

select 雇员.雇员ID,姓名 from 雇员 join 订单 on 雇员.雇员ID = 订单.雇员ID
         where 订单.订购日期  between '1998-3-01' and '1998-3-31';--xiangfuzale
select 雇员ID,姓名
   from 雇员
   where 雇员ID not in(select  distinct 雇员ID
      from 订单
      where 订购日期  between '1998-03-01' and '1998-03-31')
-- select * from 雇员 left join 订单 订 on 雇员.雇员ID = 订.雇员ID

-- select * from 雇员 where 雇员ID;
-- select 雇员ID from 订单 where 订购日期  between '1998-03-01' and '1998-03-31';
--
-- select * from 客户;
-- select * from 订单;
-- select * from 订单明细;
-- select * from 产品 where 订购量=0 and 再订购量=0;
-- select 客户.客户ID,公司名称 from 订单 left join 客户 on 订单.客户ID=客户.客户ID
-- select 客户.客户ID,公司名称 from 产品 left join 供应商  on 产品.供应商ID = 供应商.供应商ID
-- join 订单 on 订单.客户ID=客户.客户ID;
select 客户ID,公司名称
from 客户
where 客户ID  not in (select 客户ID from 订单)

select 客户ID,公司名称 from 客户 where 客户ID not in (select 客户ID from 订单)

select 客户.客户ID,公司名称 from 客户 left join 订单 订 on 客户.客户ID = 订.客户ID
where 订.订单ID is null;
----
use teaching1;
--1.
select sno 学号,avg(score) 平均分 from sc group by sno having avg(score)>=80
                                                        order by avg(score) desc;
select * from student where ssex='女';
--2.
select  specialty,count(*) '女生人数' from student where ssex='女'
group by specialty having count(*)>3;
--select sno,sname,min(birthday) from student group by  sno,sname,birthday;
--select top 1 sno,sname,max(birthday) from student group by  sno,sname,birthday;
--3.
select top 1 sno,sname,birthday from student where birthday is not null group by  sno,sname,birthday order by birthday ;
--试试不用聚合函数第3题
select  * from course;
--4.
select  sc.sno,sname,score from course c join sc on sc.cno=c.cno
    join student s on s.sno = sc.sno
    where c.cname='c++语言' and score >
(select score from course c join sc on sc.cno=c.cno
    join student s on s.sno = sc.sno where sname='赵丽红'and c.cname='c++语言');

select sc.sno,sname,score from course c join sc on sc.cno=c.cno
    join student s on s.sno = sc.sno where sname='赵丽红'

select c.sno,sname from sc c join student s on c.sno = s.sno

select * from grade;

select  s.sno,sname from student join sc s on student.sno = s.sno
;

--5.
select sname,s.sno from student s join sc s2 on s.sno = s2.sno where  cno='K004' and exists
(select cno from student s3 join sc s4 on s3.sno = s4.sno where s4.cno='C001');


select student.sno,student.sname,c.cname from student join sc s on student.sno = s.sno
    join course c on c.cno = s.cno where c.cname<>'c++语言';
--6.
select student.sno,student.sname from student where sname not in
    (select sname from student join sc s2 on student.sno = s2.sno
      join course c2 on c2.cno = s2.cno where c2.cname='c++语言');

select sname,c.cname,avg(score) 平均分 from sc join student s on s.sno = sc.sno
             join course c on c.cno = sc.cno
             where ssex='女' group by sname,c.cname

select c.cname,max(sc.score)最高分 from course c join sc on sc.cno=c.cno
join student s on s.sno = sc.sno where s.ssex='女'group by c.cname
--7.
select c.cname
from sc join student on sc.sno=student.sno
        join  course c on sc.cno=c.cno
where ssex='女' and  score>= (select max(score) from student join dbo.sc s on student.sno = s.sno
where ssex='女')
--8.
select student.sname,avg(score) 平均分 from student join sc s on student.sno = s.sno
where ssex='女'
group by student.sname order by avg(score) asc

--9
select cno 课程号,score 成绩 from sc a where score>(select avg(score) from sc b where a.cno=b.cno)

select a.cno,b.cno, avg(b.score) from sc a join sc b on a.cno=b.cno group by a.cno, b.cno