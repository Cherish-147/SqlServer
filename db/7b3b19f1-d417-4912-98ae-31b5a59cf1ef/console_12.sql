-- 约束
create table user(
    id int primary key auto_increment comment '主键',
    name varchar(10) not null unique comment '姓名',
    age int check ( age>0&&age<=120 ) comment '年龄',
    status char(1) default '1' comment '状态',
    gender char(1) comment '性别'
) comment '用户表';
-- 插入数据
insert into  user(name,age,status,gender) values ('Tom1',19,'1','男'),('Tom2',25,'0','男');
insert into user(name,age,status,gender) values ('Tom3',19,'1','男');

insert into user(name,age,status,gender) values (null,19,'1','男');
insert into user(name,age,status,gender) values ('Tom3',19,'1','男');

insert into user(name,age,status,gender) values ('Tom4',80,'1','男');
insert into user(name,age,status,gender) values ('Tom5',-1,'1','男');
insert into user(name,age,status,gender) values ('Tom5',121,'1','男');
insert into user(name,age,gender) values ('Tom5',120,'男');

-- 约束外键
create table dept(
    id int auto_increment comment 'ID' primary key ,
    name varchar(50) not null comment '部门名称'
)comment '部门表';
insert into dept(id, name) values (1,'研发部'),(2,'市场部'),(3,'财务部'),(4,'销售部'),(5,'总经办');

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

INSERT INTO emp (id, name, age, job,salary, entrydate, managerid, dept_id)
VALUES
(1, '金庸', 66, '总裁',20000, '2000-01-01', null,5),(2, '张无忌', 20,
'项目经理',12500, '2005-12-05', 1,1),
(3, '杨逍', 33, '开发', 8400,'2000-11-03', 2,1),(4, '韦一笑', 48, '开
发',11000, '2002-02-05', 2,1),
(5, '常遇春', 43, '开发',10500, '2004-09-07', 3,1),(6, '小昭', 19, '程
序员鼓励师',6600, '2004-10-12', 2,1);

alter table emp add constraint fk_emp_dept_id foreign key (dept_id) references dept(id);
alter table emp drop foreign key fk_emp_dept_id;
alter table emp add constraint fk_emp_dept_id foreign key (dept_id) references dept(id) on update cascade on DELETE cascade ;
alter table emp add constraint fk_emp_dept_id1 foreign key (dept_id) references dept(id) on update set null on delete set null ;
#外键删除更新还有一丢丢问题

-- ------------------------------------------------------------
create table student(
    id int auto_increment primary key comment '主键ID',
    name varchar(10) comment '姓名',
    no varchar(10) comment '学号'
) comment '学生表';

insert into student values (null, '黛绮丝', '2000100101'),(null, '谢逊','2000100102'),(null, '殷天正', '2000100103'),(null, '韦一笑', '2000100104');
create table course(
id int auto_increment primary key comment '主键ID',name varchar(10) comment '课程名称') comment '课程表';
insert into course values (null, 'Java'), (null, 'PHP'), (null , 'MySQL') ,
(null, 'Hadoop');
create table student_course(

id int auto_increment comment '主键' primary key,
studentid int not null comment '学生ID',
courseid int not null comment '课程ID',
constraint fk_courseid foreign key (courseid) references course (id),
constraint fk_studentid foreign key (studentid) references student (id)
)comment '学生课程中间表';
insert into student_course values (null,1,1),(null,1,2),(null,1,3),(null,2,2),(null,2,3),(null,3,4);

create table tb_user(
id int auto_increment primary key comment '主键ID',
name varchar(10) comment '姓名',
age int comment '年龄',
gender char(1) comment '1: 男 , 2: 女',
phone char(11) comment '手机号'
) comment '用户基本信息表';

create table tb_user_edu(
id int auto_increment primary key comment '主键ID',
degree varchar(20) comment '学历',
major varchar(50) comment '专业',
primaryschool varchar(50) comment '小学',
middleschool varchar(50) comment '中学',university varchar(50) comment '大学',
userid int unique comment '用户ID',
constraint fk_userid foreign key (userid) references tb_user(id)
) comment '用户教育信息表';

insert into tb_user(id, name, age, gender, phone) values
(null,'黄渤',45,'1','18800001111'),
(null,'冰冰',35,'2','18800002222'),
(null,'码云',55,'1','18800008888'),
(null,'李彦宏',50,'1','18800009999');

insert into tb_user_edu(id, degree, major, primaryschool, middleschool,
university, userid) values
(null,'本科','舞蹈','静安区第一小学','静安区第一中学','北京舞蹈学院',1),
(null,'硕士','表演','朝阳区第一小学','朝阳区第一中学','北京电影学院',2),
(null,'本科','英语','杭州市第一小学','杭州市第一中学','杭州师范大学',3),
(null,'本科','应用数学','阳泉第一小学','阳泉区第一中学','清华大学',4);

drop table emp;
alter table emp drop foreign key fk_emp_dept_id;
drop table dept;

-- 创建dept表，并插入数据
create table dept(
id int auto_increment comment 'ID' primary key,
name varchar(50) not null comment '部门名称'
)comment '部门表';
INSERT INTO dept (id, name) VALUES (1, '研发部'), (2, '市场部'),(3, '财务部'), (4,
'销售部'), (5, '总经办'), (6, '人事部');
-- 创建emp表，并插入数据
create table emp(
id int auto_increment comment 'ID' primary key,name varchar(50) not null comment '姓名',
age int comment '年龄',
job varchar(20) comment '职位',
salary int comment '薪资',
entrydate date comment '入职时间',
managerid int comment '直属领导ID',
dept_id int comment '部门ID'
)comment '员工表';
-- 添加外键
alter table emp add constraint fk_emp_dept_id foreign key (dept_id) references
dept(id);
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
show create table emp;
select *from emp,dept;
select *from emp,dept where emp.dept_id=dept_id;#与下面的不一样
select *from emp,dept where emp.dept_id=dept.id;
select emp.name,dept.name from emp ,dept where emp.dept_id=dept.id;
select e.name,d.name from emp e,dept d where e.dept_id=d.id;#起别名·prior优先从from开始

-- 内连接
select *from emp e  inner join dept d on e.dept_id = d.id;
select e.name ,d.name from emp e  inner join dept d on e.dept_id = d.id;

-- 外链接
#查emp
select e.*,d.name from emp e left outer join dept d on e.dept_id=d.id;
select e.*,d.name from emp e left       join dept d on e.dept_id=d.id;

#查dept
#select d.*,e.name from emp e right join dept d on d.id = e.dept_id;
select d.*,e.* from emp e right join dept d on d.id = e.dept_id;
#select e.name,d.* from dept d left join  emp  e on e.dept_id=e.dept_id;
select d.*,e.* from dept d left join  emp e on e.dept_id = d.id;
select d.*,e.* from dept d left join  emp e on d.id = e.dept_id;
-- 自连接
select a.name,b.name from  emp a,emp b where a.managerid=b.id;

select a.name '员工',b.name '领导' from emp a left  outer join  emp b on  a.managerid=b.id;
select a.name '员工',b.name '领导' from emp b right outer join emp a on a.managerid=b.id;

-- 联合查询
select *from emp where salary<5000 or age>50;#单表

select *from emp where salary<5000
union all#全部可能有重复的
select * from emp where age>50;#多表

select *from emp where salary<5000
union
select * from emp where age>50;#多表
-- 标量子查询
select id from dept where name='销售部';
select *from emp where dept_id=4;

select *from emp where dept_id=(select id from  dept where name='销售部');

select entrydate from emp where name='方东白';

select * from emp where entrydate>'2009-02-12';
select * from emp where entrydate>(select entrydate from emp where name='方东白');
-- 列子查询
select  id from dept where name='销售部' or name='市场部';

select *from emp where dept_id in (2,4);

select *from emp where dept_id in (select  id from dept where name='销售部' or name='市场部');


select id from dept where name='财务部';
select salary from emp where dept_id=3;

select salary from emp where dept_id=
(select id from dept where name='财务部');


select salary from emp where dept_id=all(select salary from emp where dept_id=(select id from dept where name ='财务部'));
select  salary from emp where dept_id= (select max(salary) from emp where dept_id=(select id from dept where name ='财务部'));

select *from emp where dept_id=(select id from dept where name='研发部');
select *from emp where salary>some (select salary from emp where dept_id=(select id from dept where name='研发部'));
select *from emp where salary>any (select salary from emp where dept_id=(select id from dept where name='研发部'));

-- 行子查询

select salary,managerid from emp where name='张无忌';
select *from emp where (salary,managerid)=(12500,1);
select *from emp where (salary,managerid)=(select salary,managerid from emp where  name='张无忌');

-- 表子查询
select job,salary from emp where name='鹿杖客' or name='宋远桥';
select *from emp where (job,salary) in (select job,salary from emp where name='鹿杖客' or name='宋远桥');


select *from emp where entrydate>'2006-01-01';
select e.*,d.* from (select *from emp where entrydate>'2006-01-01') e left outer join dept d on e.dept_id=d.id;

-- 多表查询
create table salgrade(
    grade int,
    losal int,
    hisal int
)comment '薪资等级表';

insert into salgrade values (1,0,3000);
insert into salgrade values (2,3001,5000);
insert into salgrade values (3,5001,8000);
insert into salgrade values (4,8001,10000);
insert into salgrade values (5,10001,15000);
insert into salgrade values (6,15001,20000);
insert into salgrade values (7,20001,25000);
insert into salgrade values (8,25001,30000);
show  create table salgrade;
select *from salgrade;
-- 隐式内连接
select e.name,e.age,e.job,d.name from emp e,dept d where e.dept_id=d.id;

select e.name,e.age,e.job,d.name from emp e inner join dept d on e.dept_id=d.id where e.age<30;

select  d.id,d.name from emp e,dept d where e.dept_id=d.id;#求交集用内连接
select distinct d.id,d.name from emp e,dept d where e.dept_id=d.id;#求交集用内连接

select e.*,d.name from emp e left outer join dept d on e.dept_id=d.id where e.age>40;

select e.* ,s.grade,s.hisal,s.losal from emp e,salgrade s where e.salary>=s.losal &&e.salary<=s.hisal;
select e.* ,s.grade,s.hisal,s.losal from emp e,salgrade s where e.salary between s.losal and s.hisal;

select e.*,s.grade from emp e,dept d,salgrade s where e.dept_id=d.id && (e.salary between s.losal and s.hisal)and d.name='研发部';


select avg(e.salary)from emp e,dept d where e.dept_id=d.id and d.name='研发部';

select salary from emp where emp.name='灭绝';
select *from emp where salary>(select salary from emp where  emp.name='灭绝');

select avg(salary)from emp;

select *from emp where salary>(select avg(salary)from emp);

select avg(e1.salary)from emp e1 where e1.dept_id=1;
select avg(e1.salary)from emp e1 where e1.dept_id=2;
select *from emp e2 where e2.salary<(select avg(e1.salary)from emp e1 where e1.dept_id=e2.dept_id);
select *,(select avg(e1.salary)from emp e1 where e1.dept_id=e2.dept_id)'平均'from emp e2 where e2.salary<(select avg(e1.salary)from emp e1 where e1.dept_id=e2.dept_id);

select id,name,id from dept;
select count(*)from emp where dept_id=1;
select d.id,d.name,(select count(*)from emp  e where e.dept_id=d.id) '人数'from dept d;
select dept.id,dept.name,(select count(*)from emp   where emp.dept_id=dept.id) '人数'from dept ;

select s.name,s.no,c.name from student s,student_course sc,course  c where s.id=sc.studentid
                                                                       and  sc.studentid and sc.studentid=c.id;
select s.name , s.no , c.name from student s , student_course sc , course c where
s.id = sc.studentid and sc.courseid = c.id;

-- 事物
drop table if exists account;
create table account(
id int primary key AUTO_INCREMENT comment 'ID',
name varchar(10) comment '姓名',
money double(10,2) comment '余额'
) comment '账户表';
insert into account(name, money) VALUES ('张三',2000), ('李四',2000);
select *from account where name='张三';
update account set money=money-1000 where name='李四';
update account set money=money+1000 where name='李四';

set @@autocommit=0;-- 设置为手动提交事物
start transaction ;
-- 1. 查询张三余额
select * from account where name = '张三';
-- 2. 张三的余额减少1000
update account set money = money - 1000 where name = '张三';
出错了....
-- 3. 李四的余额增加1000
update account set money = money + 1000 where name = '李四';

-- huifu数据
update account set money =2000 where name='张三'or name='李四';

commit ;-- tjiaoshiwu

rollback;-- 回滚事物

-- 事物隔离
select @@transaction_isolation;

set session transaction isolation level read uncommitted ;
set session transaction isolation level repeatable read ;

-- 左边
use summer;
set session transaction isolation level read uncommitted ;
select *from account;
start transaction ;
select *from account;

set session transaction isolation level read committed ;
start transaction ;
select * from account;
select * from account;

set session  transaction isolation level repeatable read ;


select * from account;

start transaction ;

select * from account where id=3;

insert into account(id, name, money) VALUES (3,'大刀王五',2000);


set session transaction isolation level serializable ;

start transaction ;
select *from account where id=4;

insert into account(id, name, money) VALUES (4,'大刀王五',2000);

-- /***********************-***
#右边
use summer;
start transaction ;
update account set money = money-1000 where name ='张三';

start transaction ;
start transaction ;
update account set money = money+1000 where name ='张三';

start transaction ;

insert into account(id, name, money) VALUES (3,'王五',2000);

start transaction ;

insert into account(id, name, money) VALUES (4,'王五2',2000);
