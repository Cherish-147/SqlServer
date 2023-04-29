select * from emp;
;-- -. . -..- - / . -. - .-. -.--
select name,workno,age from emp;
;-- -. . -..- - / . -. - .-. -.--
select id,workno,name,gender,age,idcard,workaddress,entrydate from emp;
;-- -. . -..- - / . -. - .-. -.--
select *from emp;
;-- -. . -..- - / . -. - .-. -.--
select workaddress as '工作地址' from emp;
;-- -. . -..- - / . -. - .-. -.--
select workaddress '工作地址' from emp;
;-- -. . -..- - / . -. - .-. -.--
select *from emp where age=88;
;-- -. . -..- - / . -. - .-. -.--
select * from emp where age = 88;
;-- -. . -..- - / . -. - .-. -.--
select * from emp where age ！= 88;
;-- -. . -..- - / . -. - .-. -.--
select * from emp where age != 88;
;-- -. . -..- - / . -. - .-. -.--
select *from emp where id<=20;
;-- -. . -..- - / . -. - .-. -.--
select *from emp where emp.age<=20;
;-- -. . -..- - / . -. - .-. -.--
select *from  emp where idcard =nu11;
;-- -. . -..- - / . -. - .-. -.--
select *from  emp where idcard = null;
;-- -. . -..- - / . -. - .-. -.--
select *from  emp where idcard is null;
;-- -. . -..- - / . -. - .-. -.--
select *from emp where id;
;-- -. . -..- - / . -. - .-. -.--
select *from emp where idcard is not null;
;-- -. . -..- - / . -. - .-. -.--
select *from emp where age>=15&&emp.age<=20;
;-- -. . -..- - / . -. - .-. -.--
select *from emp where gender='女'&&age<25;
;-- -. . -..- - / . -. - .-. -.--
select *from emp where age=28 ||age=20 or age=40;
;-- -. . -..- - / . -. - .-. -.--
select * from emp where age <> 88;
;-- -. . -..- - / . -. - .-. -.--
select *from emp where age in (20,28,40);
;-- -. . -..- - / . -. - .-. -.--
select *from emp where age in (20,218,40);
;-- -. . -..- - / . -. - .-. -.--
select *from emp where age in (20,18,40);
;-- -. . -..- - / . -. - .-. -.--
select *from emp where name like'__';
;-- -. . -..- - / . -. - .-. -.--
select idcard from emp where idcard like  %X;
;-- -. . -..- - / . -. - .-. -.--
select idcard from emp where idcard like '%X';
;-- -. . -..- - / . -. - .-. -.--
select * from emp where idcard like '%X';
;-- -. . -..- - / . -. - .-. -.--
select * from emp where idcard like '--';
;-- -. . -..- - / . -. - .-. -.--
select * from emp where idcard like '_________________X';
;-- -. . -..- - / . -. - .-. -.--
select * from emp where idcard like '_________________x';
;-- -. . -..- - / . -. - .-. -.--
select *from emp order by age;
;-- -. . -..- - / . -. - .-. -.--
select * from emp order by entrydate desc;
;-- -. . -..- - / . -. - .-. -.--
select *from emp order by age asc ,entrydate desc;
;-- -. . -..- - / . -. - .-. -.--
select * from emp order by age asc , entrydate desc;
;-- -. . -..- - / . -. - .-. -.--
select *from emp limit 0,10;
;-- -. . -..- - / . -. - .-. -.--
select * from emp where  age in(20,21,22,23);
;-- -. . -..- - / . -. - .-. -.--
select * from emp where gender='男'and (age between 20 and 40) and name like '___';
;-- -. . -..- - / . -. - .-. -.--
select gender,count(*) from emp where age<60 group by gender;
;-- -. . -..- - / . -. - .-. -.--
select gender, count(*) from emp where age < 60 group by gender;
;-- -. . -..- - / . -. - .-. -.--
select name,age from emp where age<=35 order by age asc,entrydate desc;
;-- -. . -..- - / . -. - .-. -.--
select * from emp where gender='男'and age between 20 and 40 order by age asc ,entrydate desc;
;-- -. . -..- - / . -. - .-. -.--
select count(1) from emp;
;-- -. . -..- - / . -. - .-. -.--
select avg(age) from emp;
;-- -. . -..- - / . -. - .-. -.--
select max(age) from emp;
;-- -. . -..- - / . -. - .-. -.--
select min(age) from  emp;
;-- -. . -..- - / . -. - .-. -.--
select sum(age) from emp where workaddress='西安';
;-- -. . -..- - / . -. - .-. -.--
select gender, count(*) from emp group by gender;
;-- -. . -..- - / . -. - .-. -.--
select gender,count(*)from emp group by gender;
;-- -. . -..- - / . -. - .-. -.--
select gender,avg(age) from emp group by gender;
;-- -. . -..- - / . -. - .-. -.--
select gender, avg(age) from emp group by gender;
;-- -. . -..- - / . -. - .-. -.--
select workaddress,age<45 from emp group by limit=3;
;-- -. . -..- - / . -. - .-. -.--
select count(*) from emp where age <45 group by workaddress having count(*) >3;
;-- -. . -..- - / . -. - .-. -.--
select gender,count(*) from emp group by workaddress having;
;-- -. . -..- - / . -. - .-. -.--
select gender,count(*) from emp group by workaddress;
;-- -. . -..- - / . -. - .-. -.--
select workaddress,gender,count(*) from emp group by workaddress;
;-- -. . -..- - / . -. - .-. -.--
select workaddress, gender, count(*) '数量' from emp group by gender , workaddress

2.6.6 排序查询
排序在日常开发中是非常常见的一个操作，有升序排序，也有降序排序。
1). 语法
2). 排序方式
ASC : 升序(默认值);
;-- -. . -..- - / . -. - .-. -.--
select workaddress,gender,count(*) from emp group by gender,workaddress;
;-- -. . -..- - / . -. - .-. -.--
select workaddress,count(*) from emp where age <45 group by workaddress having count(*) >3;
;-- -. . -..- - / . -. - .-. -.--
select workaddress, count(*) address_count from emp where age < 45 group by
workaddress having address_count >= 3;
;-- -. . -..- - / . -. - .-. -.--
select workaddress, gender, count(*) '数量' from emp group by gender , workaddress;
;-- -. . -..- - / . -. - .-. -.--
select *from emp order by age asc;
;-- -. . -..- - / . -. - .-. -.--
create table emp(
id int comment '编号',
workno varchar(10) comment '工号',
name varchar(10) comment '姓名',
gender char(1) comment '性别',
age tinyint unsigned comment '年龄',
idcard char(18) comment '身份证号',
workaddress varchar(50) comment '工作地址',
entrydate date comment '入职时间'
)comment '员工表';
;-- -. . -..- - / . -. - .-. -.--
select * from emp where gender = '女' and age in(20,21,22,23);
;-- -. . -..- - / . -. - .-. -.--
select *from emp limit 10;
;-- -. . -..- - / . -. - .-. -.--
select *from emp limit 10,10;
;-- -. . -..- - / . -. - .-. -.--
select *from emp left 20,20;
;-- -. . -..- - / . -. - .-. -.--
select *from emp limit 20,20;
;-- -. . -..- - / . -. - .-. -.--
select * from emp where gender='男'and age between 20 and 40 order by age asc ,entrydate desc limit 5;
;-- -. . -..- - / . -. - .-. -.--
select * from emp where gender = '男' and ( age between 20 and 40 ) and name like；;
;-- -. . -..- - / . -. - .-. -.--
select * from emp where gender = '男' and ( age between 20 and 40 ) and name like;
;-- -. . -..- - / . -. - .-. -.--
select name,age from emp order by age asc;
;-- -. . -..- - / . -. - .-. -.--
select name,age from emp where age >15 order by age asc;
;-- -. . -..- - / . -. - .-. -.--
select e.name,e.age from emp e where e.age>15 order by e.age asc;
;-- -. . -..- - / . -. - .-. -.--
select e.name ename , e.age eage from emp e where eage > 15 order by age asc;
;-- -. . -..- - / . -. - .-. -.--
select e.name ename , e.age eage from emp e where e.age > 15 order by eage asc;
;-- -. . -..- - / . -. - .-. -.--
select e.name ename , e.age eage from emp eage where eage > 15 order by age asc;
;-- -. . -..- - / . -. - .-. -.--
create user 'itcast'@ 'localhost' identified by '123456';
;-- -. . -..- - / . -. - .-. -.--
create user 'itcast'@'localhost' identified by '123456';
;-- -. . -..- - / . -. - .-. -.--
create user 'itheima0'@'%' identified by '123456';
;-- -. . -..- - / . -. - .-. -.--
alter user 'itheima0'@'%' identified with mysql_native_password by'1234';
;-- -. . -..- - / . -. - .-. -.--
create user 'itcast0'@'localhost' identified by '123456';
;-- -. . -..- - / . -. - .-. -.--
drop user 'itcast0'@'localhost';
;-- -. . -..- - / . -. - .-. -.--
create table user(
    id int primary key auto_increment comment '主键',
    name varchar(10) not null unique comment '姓名',
    age int check ( age>0&&age<=120 ) comment '年龄',
    status char(1) default '1' comment '状态',
    gender char(1) comment '性别'
) comment '用户表';
;-- -. . -..- - / . -. - .-. -.--
insert into  user(name,age,status,gender) values ('Tom1',19,'1','男'),('Tom1',25,'0','男');
;-- -. . -..- - / . -. - .-. -.--
insert into  user(name,age,status,gender) values ('Tom1',19,'1','男'),('Tom2',25,'0','男');
;-- -. . -..- - / . -. - .-. -.--
insert into user(name,age,status,gender) values ('Tom3',19,'1','男',);
;-- -. . -..- - / . -. - .-. -.--
insert into user(name,age,status,gender) values ('Tom3',19,'1','男');
;-- -. . -..- - / . -. - .-. -.--
insert into user(name,age,status,gender) values ('Tom4',80,'1','男');
;-- -. . -..- - / . -. - .-. -.--
insert into user(name,age,status,gender) values ('Tom5',-1,'1','男');
;-- -. . -..- - / . -. - .-. -.--
insert into user(name,age,status,gender) values ('Tom5',120,,'男');
;-- -. . -..- - / . -. - .-. -.--
insert into user(name,age,status,gender) values ('Tom5',120,'男');
;-- -. . -..- - / . -. - .-. -.--
insert into user(name,age,gender) values ('Tom5',120,'男');
;-- -. . -..- - / . -. - .-. -.--
insert into dept(id, name) values (1,'研发部'),(2,'市场部'),(3,'财务部'),(4,'销售部')，(5,'总经办');
;-- -. . -..- - / . -. - .-. -.--
create table dept(
    id int auto_increment comment 'ID' primary key ,
    name varchar(50) not null comment '部门名称'
)comment '部门表';
;-- -. . -..- - / . -. - .-. -.--
insert into dept(id, name) values (1,'研发部'),(2,'市场部'),(3,'财务部'),(4,'销售部'),(5,'总经办');
;-- -. . -..- - / . -. - .-. -.--
Create table emp(
    id int auto_increment comment 'ID' primary key,
    name varchar(50) not null comment '部门名称'
)comment '部门表';
;-- -. . -..- - / . -. - .-. -.--
Create table emp(
    id int auto_increment comment 'ID' primary key,
    name varchar(50) not null comment '姓名',
    age int comment '年龄' ,
    job varchar(20) comment '职位',
    salary int comment '薪资',
    entrydate date comment '入职时间',
    managerid int comment '直属领导ID',
    dept_id int comment '部门ID'
)comment '部门表';
;-- -. . -..- - / . -. - .-. -.--
Create table emp(
    id int auto_increment comment 'ID' primary key,
    name varchar(50) not null comment '姓名',
    age int comment '年龄' ,
    job varchar(20) comment '职位',
    salary int comment '薪资',
    entrydate date comment '入职时间',
    managerid int comment '直属领导ID',
    dept_id int comment '部门ID'
)comment '员工表';
;-- -. . -..- - / . -. - .-. -.--
alter table emp add constraint fk_emp_dept_id foreign key (dept_id) references dept(id) on update cascade on DELETE cascade;
;-- -. . -..- - / . -. - .-. -.--
alter table emp add constraint fk_emp_dept_id1 foreign key (dept_id) references dept(id) on update set null on delete set null;
;-- -. . -..- - / . -. - .-. -.--
alter table emp add constraint fk_emp_dept_id foreign key (dept_id) references dept(id);
;-- -. . -..- - / . -. - .-. -.--
create table student(
    id int auto_increment primary key comment '主键ID',
    name varchar(10) comment '姓名',
    no varchar(10) comment '学号'
) comment '学生表';
;-- -. . -..- - / . -. - .-. -.--
insert into course values (null, 'Java'), (null, 'PHP'), (null , 'MySQL') ,
(null, 'Hadoop');
;-- -. . -..- - / . -. - .-. -.--
insert into student_course values (null,1,1),(null,1,2),(null,1,3),(null,2,2),(null,2,3),(null,3,4;
;-- -. . -..- - / . -. - .-. -.--
insert into student values (null, '黛绮丝', '2000100101'),(null, '谢逊','2000100102'),(null, '殷天正', '2000100103'),(null, '韦一笑', '2000100104');
;-- -. . -..- - / . -. - .-. -.--
create table course(
id int auto_increment primary key comment '主键ID',name varchar(10) comment '课程名称') comment '课程表';
;-- -. . -..- - / . -. - .-. -.--
insert into student_course values (null,1,1),(null,1,2),(null,1,3),(null,2,2),(null,2,3),(null,3,4);
;-- -. . -..- - / . -. - .-. -.--
create table student_course(

id int auto_increment comment '主键' primary key,
studentid int not null comment '学生ID',
courseid int not null comment '课程ID',
constraint fk_courseid foreign key (courseid) references course (id),
constraint fk_studentid foreign key (studentid) references student (id)
)comment '学生课程中间表';
;-- -. . -..- - / . -. - .-. -.--
create table tb_user(
id int auto_increment primary key comment '主键ID',
name varchar(10) comment '姓名',
age int comment '年龄',
gender char(1) comment '1: 男 , 2: 女',
phone char(11) comment '手机号'
) comment '用户基本信息表';
;-- -. . -..- - / . -. - .-. -.--
create table tb_user_edu(
id int auto_increment primary key comment '主键ID',
degree varchar(20) comment '学历',
major varchar(50) comment '专业',
primaryschool varchar(50) comment '小学',
middleschool varchar(50) comment '中学',university varchar(50) comment '大学',
userid int unique comment '用户ID',
constraint fk_userid foreign key (userid) references tb_user(id)
) comment '用户教育信息表';
;-- -. . -..- - / . -. - .-. -.--
insert into tb_user(id, name, age, gender, phone) values
(null,'黄渤',45,'1','18800001111'),
(null,'冰冰',35,'2','18800002222'),
(null,'码云',55,'1','18800008888'),
(null,'李彦宏',50,'1','18800009999');
;-- -. . -..- - / . -. - .-. -.--
insert into tb_user_edu(id, degree, major, primaryschool, middleschool,
university, userid) values
(null,'本科','舞蹈','静安区第一小学','静安区第一中学','北京舞蹈学院',1),
(null,'硕士','表演','朝阳区第一小学','朝阳区第一中学','北京电影学院',2),
(null,'本科','英语','杭州市第一小学','杭州市第一中学','杭州师范大学',3),
(null,'本科','应用数学','阳泉第一小学','阳泉区第一中学','清华大学',4);
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO emp (id, name, age, job,salary, entrydate, managerid, dept_id)
VALUES
(1, '金庸', 66, '总裁',20000, '2000-01-01', null,5),(2, '张无忌', 20,
'项目经理',12500, '2005-12-05', 1,1),
(3, '杨逍', 33, '开发', 8400,'2000-11-03', 2,1),(4, '韦一笑', 48, '开
发',11000, '2002-02-05', 2,1),
(5, '常遇春', 43, '开发',10500, '2004-09-07', 3,1),(6, '小昭', 19, '程
序员鼓励师',6600, '2004-10-12', 2,1);
;-- -. . -..- - / . -. - .-. -.--
alter table emp add constraint fk_emp_dept_id foreign key (dept_id) references dept(id) on update set null on delete set null;
;-- -. . -..- - / . -. - .-. -.--
drop table emp;
;-- -. . -..- - / . -. - .-. -.--
create table emp(
id int auto_increment comment 'ID' primary key,name varchar(50) not null comment '姓名',
age int comment '年龄',
job varchar(20) comment '职位',
salary int comment '薪资',
entrydate date comment '入职时间',
managerid int comment '直属领导ID',
dept_id int comment '部门ID'
)comment '员工表';
;-- -. . -..- - / . -. - .-. -.--
show create table;
;-- -. . -..- - / . -. - .-. -.--
alter table emp drop foreign key fk_emp_dept_id;
;-- -. . -..- - / . -. - .-. -.--
drop table dept;
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO emp (id, name, age, job,salary, entrydate, managerid, dept_id)
VALUES
(1, '金庸', 66, '总裁',20000, '2000-01-01', null,5),
(2, '张无忌', 20, '项目经理',12500, '2005-12-05', 1,1),
(3, '杨逍', 33, '开发', 8400,'2000-11-03', 2,1),
(4, '韦一笑', 48, '开发',11000, '2002-02-05', 2,1),
(5, '常遇春', 43, '开发',10500, '2004-09-07', 3,1),
(6, '小昭', 19, '程序员鼓励师',6600, '2004-10-12', 2,1),
(7, '灭绝', 60, '财务总监',8500, '2002-09-12', 1,3),
(8, '周芷若', 19, '会计',48000, '2006-06-02', 7,3),
(9, '丁敏君', 23, '出纳',5250, '2009-05-13', 7,3),
(10, '赵敏', 20, '市场部总监',12500, '2004-10-12', 1,2),
(11, '鹿杖客', 56, '职员',3750, '2006-10-03', 10,2),
(12, '鹤笔翁', 19, '职员',3750, '2007-05-09', 10,2),
(13, '方东白', 19, '职员',5500, '2009-02-12', 10,2),
(14, '张三丰', 88, '销售总监',14000, '2004-10-12', 1,4),
(15, '俞莲舟', 38, '销售',4600, '2004-10-12', 14,4),
(16, '宋远桥', 40, '销售',4600, '2004-10-12', 14,4),
(17, '陈友谅', 42, null,2000, '2011-10-12', 1,null);
;-- -. . -..- - / . -. - .-. -.--
alter table emp add constraint fk_emp_dept_id foreign key (dept_id) references
dept(id);
;-- -. . -..- - / . -. - .-. -.--
show create table emp;
;-- -. . -..- - / . -. - .-. -.--
create table dept(
id int auto_increment comment 'ID' primary key,
name varchar(50) not null comment '部门名称'
)comment '部门表';
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO dept (id, name) VALUES (1, '研发部'), (2, '市场部'),(3, '财务部'), (4,
'销售部'), (5, '总经办'), (6, '人事部');
;-- -. . -..- - / . -. - .-. -.--
select *from emp,dept;
;-- -. . -..- - / . -. - .-. -.--
select *from emp,dept where emp.dept_id=dept_id;
;-- -. . -..- - / . -. - .-. -.--
select *from emp,dept where emp.dept_id=dept.id;
;-- -. . -..- - / . -. - .-. -.--
select emp.name,dept.name from emp where emp.dept_id=dept.id;
;-- -. . -..- - / . -. - .-. -.--
select emp.name,dept.name from emp ,dept where emp.dept_id=dept.id;
;-- -. . -..- - / . -. - .-. -.--
select e.name,dept.name from emp e,dept d where e.dept_id=d.id;
;-- -. . -..- - / . -. - .-. -.--
select e.name,d.name from emp e,dept d where e.dept_id=d.id;
;-- -. . -..- - / . -. - .-. -.--
select *from emp e  inner join dept d on e.dept_id = d.id;
;-- -. . -..- - / . -. - .-. -.--
select e.name from emp e  inner join dept d on e.dept_id = d.id;
;-- -. . -..- - / . -. - .-. -.--
select e.name ,d.name from emp e  inner join dept d on e.dept_id = d.id;
;-- -. . -..- - / . -. - .-. -.--
select e.*,d.name from emp e left outer join dept d on e.dept_id=d.id;
;-- -. . -..- - / . -. - .-. -.--
select e.*,d.name from emp e left       join dept d on e.dept_id=d.id;
;-- -. . -..- - / . -. - .-. -.--
select d.*,e.name from emp e right join dept d on d.id = e.dept_id;
;-- -. . -..- - / . -. - .-. -.--
select e.name,d.* from dept d left join  emp  e on e.dept_id=e.dept_id;
;-- -. . -..- - / . -. - .-. -.--
select e.*,d.* from dept d left join  emp  e on e.dept_id=e.dept_id;
;-- -. . -..- - / . -. - .-. -.--
select e.*,d.* from emp e left join  dept d on e.dept_id=e.dept_id;
;-- -. . -..- - / . -. - .-. -.--
select e.*,d.* from emp e left join  dept d on d.id=e.dept_id;
;-- -. . -..- - / . -. - .-. -.--
select e.*,d.* from emp e left join  dept d on d.dept_id=e.dept_id;
;-- -. . -..- - / . -. - .-. -.--
select e.*,d.* from dept d left join  emp e on d.id = e.dept_id;
;-- -. . -..- - / . -. - .-. -.--
select d.*,d.* from dept d left join  emp e on d.id = e.dept_id;
;-- -. . -..- - / . -. - .-. -.--
select d.*,e.* from dept d left join  emp e on e.id = d.dept_id;
;-- -. . -..- - / . -. - .-. -.--
select d.*,e.* from dept d left join  emp e on e.id = d.id;
;-- -. . -..- - / . -. - .-. -.--
select d.*,e.* from dept d left join  emp e on e.dept_id = d.id;
;-- -. . -..- - / . -. - .-. -.--
select d.*,e.* from emp e right join dept d on d.id = e.dept_id;
;-- -. . -..- - / . -. - .-. -.--
select d.*,e.* from dept d left join  emp e on d.id = e.dept_id;
;-- -. . -..- - / . -. - .-. -.--
select a.name,b.name from  emp a,emp b where a.managerid=b.id;
;-- -. . -..- - / . -. - .-. -.--
select *from emp a left  outer join  emp b on emp b.managerid=a.id;
;-- -. . -..- - / . -. - .-. -.--
select *from emp a left  outer join  emp b on  b.managerid=a.id;
;-- -. . -..- - / . -. - .-. -.--
select a.name '员工',b.name '领导' from emp a left  outer join  emp b on  b.managerid=a.id;
;-- -. . -..- - / . -. - .-. -.--
select a.name '员工',b.name '领导' from emp a left  outer join  emp b on  a.managerid=a.id;
;-- -. . -..- - / . -. - .-. -.--
select a.name '员工',b.name '领导' from emp a left  outer join  emp b on  a.managerid=b.id;
;-- -. . -..- - / . -. - .-. -.--
select a.name '员工',b.name '领导' from emp b right outer join emp a on a.managerid=b.id;
;-- -. . -..- - / . -. - .-. -.--
select *from emp where salary<5000 or age>50;
;-- -. . -..- - / . -. - .-. -.--
select *from emp where salary<5000
union all
select * from emp where age>50;
;-- -. . -..- - / . -. - .-. -.--
select *from emp where salary<5000
union 
select * from emp where age>50;
;-- -. . -..- - / . -. - .-. -.--
select *from emp where salary<5000
union
select * from emp where age>50;
;-- -. . -..- - / . -. - .-. -.--
select *from emp where salary<5000
union all#全部可能有重复的
select * from emp where age>50;
;-- -. . -..- - / . -. - .-. -.--
select id from dept where name='销售部';
;-- -. . -..- - / . -. - .-. -.--
select *from emp where dept_id=4;
;-- -. . -..- - / . -. - .-. -.--
select *from emp where dept_id=(select id from  dept where name='销售部');
;-- -. . -..- - / . -. - .-. -.--
(select id from  dept where name='销售部';
;-- -. . -..- - / . -. - .-. -.--
select id from  dept where name='销售部';
;-- -. . -..- - / . -. - .-. -.--
select entrydate from emp where entrydate>2009-02-12;
;-- -. . -..- - / . -. - .-. -.--
select name from emp where entrydate>2009-02-12;
;-- -. . -..- - / . -. - .-. -.--
select * from emp where entrydate>2009-02-12;
;-- -. . -..- - / . -. - .-. -.--
select * from emp where entrydate>'2009-02-12';
;-- -. . -..- - / . -. - .-. -.--
select * from emp where entrydate>select entrydate from emp where name='方东白';
;-- -. . -..- - / . -. - .-. -.--
select entrydate from emp where name='方东白';
;-- -. . -..- - / . -. - .-. -.--
select * from emp where entrydate>(select entrydate from emp where name='方东白');
;-- -. . -..- - / . -. - .-. -.--
select  id from dept where name='销售部' or name='市场部';
;-- -. . -..- - / . -. - .-. -.--
select *from emp where dept_id in =(2,4);
;-- -. . -..- - / . -. - .-. -.--
select *from emp where dept_id in (2,4);
;-- -. . -..- - / . -. - .-. -.--
select *from emp where dept_id in (select  id from dept where name='销售部' or name='市场部');
;-- -. . -..- - / . -. - .-. -.--
select salary from emp where dept_id=3;
;-- -. . -..- - / . -. - .-. -.--
select salary from emp where dept_id=(select id from emp where dept_id=(select id from dept where name ='财务部'));
;-- -. . -..- - / . -. - .-. -.--
select id from dept where name='财务部';
;-- -. . -..- - / . -. - .-. -.--
select salary from emp where dept_id=
(select id from dept where name='财务部');
;-- -. . -..- - / . -. - .-. -.--
select salary from emp where dept_id=max(select id from emp where dept_id=(select id from dept where name ='财务部'));
;-- -. . -..- - / . -. - .-. -.--
select max (salary) from emp where dept_id=(select id from emp where dept_id=(select id from dept where name ='财务部'));
;-- -. . -..- - / . -. - .-. -.--
select max (salary) from emp where dept_id=all(select id from emp where dept_id=(select id from dept where name ='财务部'));
;-- -. . -..- - / . -. - .-. -.--
select salary from emp where dept_id=all(select id from emp where dept_id=(select id from dept where name ='财务部'));
;-- -. . -..- - / . -. - .-. -.--
select  salary from emp where dept_id= (select max(salary) from emp where dept_id=(select id from dept where name ='财务部'));
;-- -. . -..- - / . -. - .-. -.--
select salary from emp where dept_id=all(select salary from emp where dept_id=(select id from dept where name ='财务部'));
;-- -. . -..- - / . -. - .-. -.--
select *from emp where salary>some (select *from emp where dept_id=(select id from dept where name='研发部'));
;-- -. . -..- - / . -. - .-. -.--
select *from emp where salary>some (select salary
                                    from emp where dept_id=(select id from dept where name='研发部'));
;-- -. . -..- - / . -. - .-. -.--
select *from emp where dept_id=(select id from dept where name='研发部');
;-- -. . -..- - / . -. - .-. -.--
select *from emp where salary>any (select salary from emp where dept_id=(select id from dept where name='研发部'));
;-- -. . -..- - / . -. - .-. -.--
select *from emp where (salary,managerid)=(12500,1);
;-- -. . -..- - / . -. - .-. -.--
select *from emp where (salary,managerid)=(select salary,managerid from emp where  name='张无忌');
;-- -. . -..- - / . -. - .-. -.--
select salary,managerid from emp where name='张无忌';
;-- -. . -..- - / . -. - .-. -.--
select job,salary from emp where name='鹿仗客' or name='宋桥远';
;-- -. . -..- - / . -. - .-. -.--
select job,salary from emp where name='鹿仗客' or name='宋远桥';
;-- -. . -..- - / . -. - .-. -.--
select job, salary from emp where name = '鹿杖客' or name = '宋远桥';
;-- -. . -..- - / . -. - .-. -.--
select job,salary from emp where name='鹿杖客' or name='宋远桥';
;-- -. . -..- - / . -. - .-. -.--
select *from emp where (job,salary) in (3750,4600);
;-- -. . -..- - / . -. - .-. -.--
select *from emp where (job,salary) in (3750 or 4600);
;-- -. . -..- - / . -. - .-. -.--
select *from emp where (job,salary) in (select job,salary from emp where name='鹿杖客' or name='宋远桥');
;-- -. . -..- - / . -. - .-. -.--
select e.*,d.* from (select *from emp where entrydate>'2006-01-01');
;-- -. . -..- - / . -. - .-. -.--
select *from emp where entrydate>'2006-01-01';
;-- -. . -..- - / . -. - .-. -.--
select e.*,d.* from (select *from emp where entrydate>'2006-01-01') e left outer join dept d on e.dept_id=dept_id;
;-- -. . -..- - / . -. - .-. -.--
select e.*,d.* from (select *from emp where entrydate>'2006-01-01') e left outer join dept d on e.dept_id=d.id;
;-- -. . -..- - / . -. - .-. -.--
create table salgrade(
    grade int,
    losal int,
    hisal int
)comment '薪资等级表';
;-- -. . -..- - / . -. - .-. -.--
insert into salgrade values (1,0,3000);
;-- -. . -..- - / . -. - .-. -.--
show table salgrade;
;-- -. . -..- - / . -. - .-. -.--
show table;
;-- -. . -..- - / . -. - .-. -.--
desc salgrade;
;-- -. . -..- - / . -. - .-. -.--
show schemas in salgrade;
;-- -. . -..- - / . -. - .-. -.--
nsert into salgrade values (2,3001,5000);
insert into salgrade values (3,5001,8000);
insert into salgrade values (4,8001,10000);
insert into salgrade values (5,10001,15000);
insert into salgrade values (6,15001,20000);
insert into salgrade values (7,20001,25000);
insert into salgrade values (8,25001,30000);;
;-- -. . -..- - / . -. - .-. -.--
insert into salgrade values (2,3001,5000);
;-- -. . -..- - / . -. - .-. -.--
insert into salgrade values (3,5001,8000);
;-- -. . -..- - / . -. - .-. -.--
insert into salgrade values (4,8001,10000);
;-- -. . -..- - / . -. - .-. -.--
insert into salgrade values (5,10001,15000);
;-- -. . -..- - / . -. - .-. -.--
insert into salgrade values (6,15001,20000);
;-- -. . -..- - / . -. - .-. -.--
insert into salgrade values (7,20001,25000);
;-- -. . -..- - / . -. - .-. -.--
insert into salgrade values (8,25001,30000);
;-- -. . -..- - / . -. - .-. -.--
show table status;
;-- -. . -..- - / . -. - .-. -.--
show tables;
;-- -. . -..- - / . -. - .-. -.--
show  create table salgrade;
;-- -. . -..- - / . -. - .-. -.--
select *from salgrade;
;-- -. . -..- - / . -. - .-. -.--
select e.name,e.age,e.job,d.name from emp e,dept d inner join dept d on e.dept_id=d.id where e.age<30;
;-- -. . -..- - / . -. - .-. -.--
select e.name,e.age,e.job,d.name from emp e,dept d where e.dept_id=d.id;
;-- -. . -..- - / . -. - .-. -.--
select e.name,e.age,e.job,d.name from emp e inner join dept d on e.dept_id=d.id where e.age<30;
;-- -. . -..- - / . -. - .-. -.--
select distinct d.id,d.name from emp e,dept d where e.dept_id=d.id;
;-- -. . -..- - / . -. - .-. -.--
select  d.id,d.name from emp e,dept d where e.dept_id=d.id;
;-- -. . -..- - / . -. - .-. -.--
select *from emp e,dept d left outer join dept d on e.dept_id=d.id where e.age>40;
;-- -. . -..- - / . -. - .-. -.--
select *from emp e left outer join dept d on e.dept_id=d.id where e.age>40;
;-- -. . -..- - / . -. - .-. -.--
select e.*,d.name from emp e left outer join dept d on e.dept_id=d.id where e.age>40;
;-- -. . -..- - / . -. - .-. -.--
select *from emp e,salgrade s where e.salary>=s.losal &&e.salary<=s.hisal;
;-- -. . -..- - / . -. - .-. -.--
select e.name ,s.grade,s.hisal,s.losal from emp e,salgrade s where e.salary>=s.losal &&e.salary<=s.hisal;
;-- -. . -..- - / . -. - .-. -.--
select e.* ,s.grade,s.hisal,s.losal from emp e,salgrade s where e.salary>=s.losal &&e.salary<=s.hisal;
;-- -. . -..- - / . -. - .-. -.--
select e.* ,s.grade,s.hisal,s.losal from emp e,salgrade s where e.salary between s.losal and s.hisal;
;-- -. . -..- - / . -. - .-. -.--
select *from emp e,dept d,salgrade s where e.dept_id=d.id && (e.salary between s.losal and s.hisal)and d.name='研发部';
;-- -. . -..- - / . -. - .-. -.--
select e.*,s.grade from emp e,dept d,salgrade s where e.dept_id=d.id && (e.salary between s.losal and s.hisal)and d.name='研发部';
;-- -. . -..- - / . -. - .-. -.--
select avg(salary)from emp e,dept d where e.dept_id=d.id;
;-- -. . -..- - / . -. - .-. -.--
select avg(e.salary)from emp e,dept d where e.dept_id=d.id;
;-- -. . -..- - / . -. - .-. -.--
select avg(e.salary)from emp e,dept d where e.dept_id=d.id and d.name='研发部';
;-- -. . -..- - / . -. - .-. -.--
select salary from emp where name='灭绝';
;-- -. . -..- - / . -. - .-. -.--
select *from emp where salary>(select salary from emp where  emp.name='灭绝');
;-- -. . -..- - / . -. - .-. -.--
select avg(salary)from emp;
;-- -. . -..- - / . -. - .-. -.--
select *from emp where salary>(select avg(salary)from emp);
;-- -. . -..- - / . -. - .-. -.--
select *from emp e2 where e2.salary<(select avg(e1.salary)from emp e1 where e1.dept_id=e2.dept_id);
;-- -. . -..- - / . -. - .-. -.--
select avg(e1.salary)from emp e1 where e1.dept_id=e2.dept_id;
;-- -. . -..- - / . -. - .-. -.--
select avg(e1.salary)from emp;
;-- -. . -..- - / . -. - .-. -.--
select avg(e1.salary)from emp e1 where e1.dept_id=2;
;-- -. . -..- - / . -. - .-. -.--
select avg(e1.salary)from emp e1 where e1.dept_id=1;
;-- -. . -..- - / . -. - .-. -.--
select *,(select avg(e1.salary)from emp e1 where e1.dept_id=e2.dept_id)from emp e2 where e2.salary<(select avg(e1.salary)from emp e1 where e1.dept_id=e2.dept_id);
;-- -. . -..- - / . -. - .-. -.--
select *,(select avg(e1.salary)from emp e1 where e1.dept_id=e2.dept_id)from emp e2 where e2.salary<(select avg(e1.salary) ''from emp e1 where e1.dept_id=e2.dept_id);
;-- -. . -..- - / . -. - .-. -.--
select *,(select avg(e1.salary)from emp e1 where e1.dept_id=e2.dept_id)from emp e2 where e2.salary<(select avg(e1.salary) ' 'from emp e1 where e1.dept_id=e2.dept_id);
;-- -. . -..- - / . -. - .-. -.--
select *,(select avg(e1.salary)from emp e1 where e1.dept_id=e2.dept_id)from emp e2 where e2.salary<(select avg(e1.salary) '平均'from emp e1 where e1.dept_id=e2.dept_id);
;-- -. . -..- - / . -. - .-. -.--
select *,(select avg(e1.salary)from emp e1 where e1.dept_id=e2.dept_id)from emp e2 where e2.salary<(select avg(e1.salary)'1'from emp e1 where e1.dept_id=e2.dept_id);
;-- -. . -..- - / . -. - .-. -.--
select *,(select avg(e1.salary)from emp e1 where e1.dept_id=e2.dept_id)''from emp e2 where e2.salary<(select avg(e1.salary)from emp e1 where e1.dept_id=e2.dept_id);
;-- -. . -..- - / . -. - .-. -.--
select *,(select avg(e1.salary)from emp e1 where e1.dept_id=e2.dept_id)'平均'from emp e2 where e2.salary<(select avg(e1.salary)from emp e1 where e1.dept_id=e2.dept_id);
;-- -. . -..- - / . -. - .-. -.--
select id,name,id from dept;
;-- -. . -..- - / . -. - .-. -.--
select count(*)from emp where dept_id=1;
;-- -. . -..- - / . -. - .-. -.--
select id,name,id '人数'from dept;
;-- -. . -..- - / . -. - .-. -.--
select id,name,(select count(*)from emp where dept_id=1) '人数'from dept;
;-- -. . -..- - / . -. - .-. -.--
select id,name,(select count(*)from emp where dept_id=dept.id) '人数'from dept;
;-- -. . -..- - / . -. - .-. -.--
select id,name,(select count(*)from emp where dept_id=id) '人数'from dept;
;-- -. . -..- - / . -. - .-. -.--
select d.id,d.name,(select count(*)from emp  e where e.dept_id=d.id) '人数'from dept d;
;-- -. . -..- - / . -. - .-. -.--
(select count(*)from emp  e where e.dept_id=d.id);
;-- -. . -..- - / . -. - .-. -.--
select dept.id,dept.name,(select count(*)from emp   where emp.dept_id=dept.id) '人数'from dept;
;-- -. . -..- - / . -. - .-. -.--
select count(*)from emp   where emp.dept_id=dept.id;
;-- -. . -..- - / . -. - .-. -.--
select count(*)from emp   where emp.dept_id=dept.id) '人数'from dept;
;-- -. . -..- - / . -. - .-. -.--
select s.name,s.no,c.name from student s,student_course sc,course  c where s.id=sc.studentid and  sc.studentid and sc.studentid=c.id;
;-- -. . -..- - / . -. - .-. -.--
select s.name , s.no , c.name from student s , student_course sc , course c where
s.id = sc.studentid and sc.courseid = c.id;
;-- -. . -..- - / . -. - .-. -.--
select s.name,s.no,c.name from student s,student_course sc,course  c where s.id=sc.studentid
                                                                       and  sc.studentid and sc.studentid=c.id;
;-- -. . -..- - / . -. - .-. -.--
drop table if exists account;
;-- -. . -..- - / . -. - .-. -.--
create table account(
id int primary key AUTO_INCREMENT comment 'ID',
name varchar(10) comment '姓名',
money double(10,2) comment '余额'
) comment '账户表';
;-- -. . -..- - / . -. - .-. -.--
insert into account(name, money) VALUES ('张三',2000), ('李四',2000);
;-- -. . -..- - / . -. - .-. -.--
select *from account where name='张三';
;-- -. . -..- - / . -. - .-. -.--
update account set money=money-1000 where name='李四';
;-- -. . -..- - / . -. - .-. -.--
update account set money=money+1000 where name='李四';
;-- -. . -..- - / . -. - .-. -.--
update account set money = money + 1000 where name = '李四';
;-- -. . -..- - / . -. - .-. -.--
set @@autocommit=0;
;-- -. . -..- - / . -. - .-. -.--
commit;
;-- -. . -..- - / . -. - .-. -.--
start transaction;
;-- -. . -..- - / . -. - .-. -.--
select * from account where name = '张三';
;-- -. . -..- - / . -. - .-. -.--
update account set money = money - 1000 where name = '张三';
;-- -. . -..- - / . -. - .-. -.--
set money = money + 1000 where name = '李四';
;-- -. . -..- - / . -. - .-. -.--
rollback;
;-- -. . -..- - / . -. - .-. -.--
set session transaction isolation level read uncommitted;
;-- -. . -..- - / . -. - .-. -.--
set session transaction isolation level repeatable read;
;-- -. . -..- - / . -. - .-. -.--
update account set money =2000 where name='张三'or name='李四';
;-- -. . -..- - / . -. - .-. -.--
select @@transaction_isolation;
;-- -. . -..- - / . -. - .-. -.--
select * from account where id=3;
;-- -. . -..- - / . -. - .-. -.--
select * from mysql.user;
;-- -. . -..- - / . -. - .-. -.--
show  grants for 'heima'@'%';
;-- -. . -..- - / . -. - .-. -.--
show  grants for 'itheima'@'%';
;-- -. . -..- - / . -. - .-. -.--
grant all on itheima0.* to 'itheima0'@'%';
;-- -. . -..- - / . -. - .-. -.--
grant all on itcast.* to 'itheima0'@'%';
;-- -. . -..- - / . -. - .-. -.--
show databases;
;-- -. . -..- - / . -. - .-. -.--
revoke all on itcast.* from 'itheima0'@'%';
;-- -. . -..- - / . -. - .-. -.--
revoke all on itheima0* from 'itheima0'@'%';
;-- -. . -..- - / . -. - .-. -.--
revoke all on itheima0.* from 'itheima0'@'%';
;-- -. . -..- - / . -. - .-. -.--
show  grants for 'itheima0'@'%';