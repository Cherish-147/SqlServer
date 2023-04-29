show databases ;

create table tb_user(
id int comment '编号',
name varchar(50) comment '姓名',
age int comment '年龄',
gender varchar(1) comment '性别'
) comment '用户表';

create table emp(
id int comment '编号',
workno varchar(10) comment '工号',
name varchar(10) comment '姓名',
gender char(1) comment '性别',
age tinyint unsigned comment '年龄',
idcard char(18) comment '身份证号',
entrydate date comment '入职时间'
) comment '员工表';

desc emp;

alter table emp rename to employee;

desc employee;
desc emp;#改名了所以没了

insert into employee(id, workno, name, gender, age, idcard, entrydate) values (1,'1','itcast','男',10,'123456789012345678','2000-01-01')

select * from employee;

insert into employee values (2,'2','张无忌','男',18,'123456789012345670','2005-01-01');

insert into employee values (3,'3','韦一笑','男',38,'123456789012345670','2005-01-01'),(4,'4','赵敏','女',18,'123456789012345670','2005-01-01');

-- A. 修改id为1的数据，将name修改为itheima
update employee set name = 'itheima' where id = 1;
#1 UPDATE 表名 SET 字段名1 = 值1 , 字段名2 = 值2 , .... [ WHERE 条件 ] ;

-- B. 修改id为1的数据, 将name修改为小昭, gender修改为 女
update employee set name='小昭',gender='女' where id='1';
select * from employee;
-- C. 将所有的员工入职日期修改为 2008-01-01
update employee set entrydate='2008-01-01';

select *
from employee;

-- A. 删除gender为女的员工
# 1  DELETE FROM 表名 [ WHERE 条件 ] ;
# B. 删除所有员工
delete from employee where gender = '女';
delete from employee;

select *
from employee;