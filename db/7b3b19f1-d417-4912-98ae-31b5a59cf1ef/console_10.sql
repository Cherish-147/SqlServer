drop table if exists employee;
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

INSERT INTO emp (id, workno, name, gender, age, idcard, workaddress, entrydate)
VALUES (1, '00001', '柳岩666', '女', 20, '123456789012345678', '北京', '2000-01-01');
INSERT INTO emp (id, workno, name, gender, age, idcard, workaddress, entrydate)
VALUES (2, '00002', '张无忌', '男', 18, '123456789012345670', '北京', '2005-09-01');

INSERT INTO emp (id, workno, name, gender, age, idcard, workaddress, entrydate)
VALUES (3, '00003', '韦一笑', '男', 38, '123456789712345670', '上海', '2005-08-01');
INSERT INTO emp (id, workno, name, gender, age, idcard, workaddress, entrydate)
VALUES (4, '00004', '赵敏', '女', 18, '123456757123845670', '北京', '2009-12-01');
INSERT INTO emp (id, workno, name, gender, age, idcard, workaddress, entrydate)
VALUES (5, '00005', '小昭', '女', 16, '123456769012345678', '上海', '2007-07-01');
INSERT INTO emp (id, workno, name, gender, age, idcard, workaddress, entrydate)
VALUES (6, '00006', '杨逍', '男', 28, '12345678931234567X', '北京', '2006-01-01');
INSERT INTO emp (id, workno, name, gender, age, idcard, workaddress, entrydate)
VALUES (7, '00007', '范瑶', '男', 40, '123456789212345670', '北京', '2005-05-01');
INSERT INTO emp (id, workno, name, gender, age, idcard, workaddress, entrydate)
VALUES (8, '00008', '黛绮丝', '女', 38, '123456157123645670', '天津', '2015-05-01');
INSERT INTO emp (id, workno, name, gender, age, idcard, workaddress, entrydate)
VALUES (9, '00009', '范凉凉', '女', 45, '123156789012345678', '北京', '2010-04-01');
INSERT INTO emp (id, workno, name, gender, age, idcard, workaddress, entrydate)
VALUES (10, '00010', '陈友谅', '男', 53, '123456789012345670', '上海', '2011-01-01');
INSERT INTO emp (id, workno, name, gender, age, idcard, workaddress, entrydate)
VALUES (11, '00011', '张士诚', '男', 55, '123567897123465670', '江苏', '2015-05-01');
INSERT INTO emp (id, workno, name, gender, age, idcard, workaddress, entrydate)
VALUES (12, '00012', '常遇春', '男', 32, '123446757152345670', '北京', '2004-02-01');
INSERT INTO emp (id, workno, name, gender, age, idcard, workaddress, entrydate)
VALUES (13, '00013', '张三丰', '男', 88, '123656789012345678', '江苏', '2020-11-01');
INSERT INTO emp (id, workno, name, gender, age, idcard, workaddress, entrydate)
VALUES (14, '00014', '灭绝', '女', 65, '123456719012345670', '西安', '2019-05-01');
INSERT INTO emp (id, workno, name, gender, age, idcard, workaddress, entrydate)
VALUES (15, '00015', '胡青牛', '男', 70, '12345674971234567X', '西安', '2018-04-01');
INSERT INTO emp (id, workno, name, gender, age, idcard, workaddress, entrydate)
VALUES (16, '00016', '周芷若', '女', 18, null, '北京', '2012-06-01');

select * from emp;



-- A. 查询指定字段 name, workno, age并返回
select name,workno,age from emp;
-- B. 查询返回所有字段
select id,workno,name,gender,age,idcard,workaddress,entrydate from emp;
select *from emp;
-- C. 查询所有员工的工作地址,起别名
select workaddress as '工作地址' from emp;
-- D. 查询公司员工的上班地址有哪些(不要重复)
select workaddress '工作地址' from emp;
-- 2.6.3 条件查询
-- 1). 语法
-- SELECT 字段1 [ AS 别名1 ] , 字段2 [ AS 别名2 ] ... FROM 表名;
# SELECT 字段1 [ 别名1 ] , 字段2 [ 别名2 ] ... FROM 表名;
# SELECT DISTINCT 字段列表 FROM 表名;

-- A. 查询年龄等于 88 的员工
select *from emp where age=88;
-- B. 查询年龄小于 20 的员工信息
-- SELECT 字段列表 FROM 表名 WHERE 条件列表 ;

-- C. 查询年龄小于等于 20 的员工信息
select *from emp where emp.age<=20;


-- D. 查询没有身份证号的员工信息
select *from  emp where idcard is null;
-- E. 查询有身份证号的员工信息
select *from emp where idcard is not null;

-- F. 查询年龄不等于 88 的员工信息
 select * from emp where age != 88;
 select * from emp where age <> 88;
-- G. 查询年龄在15岁(包含) 到 20岁(包含)之间的员工信息
select *from emp where age>=15&&emp.age<=20;
-- H. 查询性别为 女 且年龄小于 25岁的员工信息
select *from emp where gender='女'&&age<25;
-- I. 查询年龄等于18 或 20 或 40 的员工信息
select *from emp where age=28 ||age=20 or age=40;
select *from emp where age in (20,18,40);
-- J. 查询姓名为两个字的员工信息 _ %
select *from emp where name like'__';


-- K. 查询身份证号最后一位是X的员工信息
select * from emp where idcard like '%X';
select * from emp where idcard like '_________________x';

# 2.6.4 聚合函数
#     A. 统计该企业员工数量
 select count(1) from emp;
# 对于count聚合函数，统计符合条件的总记录数，还可以通过 count(数字/字符串)的形式进行统计
# 查询，比如：
# 对于count(*) 、count(字段)、 count(1) 的具体原理，我们在进阶篇中SQL优化部分会详
# 细讲解，此处大家只需要知道如何使用即可。
# B. 统计该企业员工的平均年龄
select avg(age) from emp;
select avg(age) from emp;
# 1 SELECT 聚合函数(字段列表) FROM 表名 ;
# select count(*) from emp; -- 统计的是总记录数
# select count(idcard) from emp; -- 统计的是idcard字段不为null的记录数
# C. 统计该企业员工的最大年龄
select max(age) from emp;
# D. 统计该企业员工的最小年龄
select min(age) from  emp;
# E. 统计西安地区员工的年龄之和
select sum(age) from emp where workaddress='西安';
# 2.6.5 分组查询
# 1). 语法
# 2). where与having区别
# 执行时机不同：where是分组之前进行过滤，不满足where条件，不参与分组；而having是分组
# 之后对结果进行过滤。
# 判断条件不同：where不能对聚合函数进行判断，而having可以。
# 注意事项:
# • 分组之后，查询的字段一般为聚合函数和分组字段，查询其他字段无任何意义。
# • 执行顺序: where > 聚合函数 > having 。
# • 支持多字段分组, 具体语法为 : group by columnA,columnB
# 案例:
# A. 根据性别分组 , 统计男性员工 和 女性员工的数量
select gender,count(*)from emp group by gender;
# B. 根据性别分组 , 统计男性员工 和 女性员工的平均年龄
select gender,avg(age) from emp group by gender;
# SELECT 字段列表 FROM 表名 [ WHERE 条件 ] GROUP BY 分组字段名 [ HAVING 分组
# 后过滤条件 ];
# C. 查询年龄小于45的员工 , 并根据工作地址分组 , 获取员工数量大于等于3的工作地址
select workaddress,count(*) from emp where age <45 group by workaddress having count(*) >3;
select workaddress, count(*) address_count from emp where age < 45 group by
workaddress having address_count >= 3;#address_count 别名


# D. 统计各个工作地址上班的男性及女性员工的数量
select workaddress,gender,count(*) from emp group by gender,workaddress  ;

select workaddress, gender, count(*) '数量' from emp group by gender , workaddress;

# 2.6.6 排序查询
# 排序在日常开发中是非常常见的一个操作，有升序排序，也有降序排序。
# 1). 语法
# 2). 排序方式
# ASC : 升序(默认值)
# DESC: 降序
# 注意事项：
# • 如果是升序, 可以不指定排序方式ASC ;
# • 如果是多字段排序，当第一个字段值相同时，才会根据第二个字段进行排序 ;
# 案例:
# A. 根据年龄对公司的员工进行升序排序
select *from emp order by age;
select *from emp order by age asc ;
# B. 根据入职时间, 对员工进行降序排序
select * from emp order by entrydate desc;
#C. 根据年龄对公司的员工进行升序排序 , 年龄相同 , 再按照入职时间进行降序排序
select *from emp order by age asc ,entrydate desc;

# 2.6.7 分页查询
# 分页操作在业务系统开发时，也是非常常见的一个功能，我们在网站中看到的各种各样的分页条，后台
# 都需要借助于数据库的分页操作。
# 1). 语法
# 注意事项:
# • 起始索引从0开始，起始索引 = （查询页码 - 1）* 每页显示记录数。
# • 分页查询是数据库的方言，不同的数据库有不同的实现，MySQL中是LIMIT。
# • 如果查询的是第一页数据，起始索引可以省略，直接简写为 limit 10。
# 案例:
# A. 查询第1页员工数据, 每页展示10条记录
select *from emp limit 0,10;
select *from emp limit 10;
# B. 查询第2页员工数据, 每页展示10条记录 --------> (页码-1)*页展示记录数
select *from emp limit 10,10;
# 2.6.8 案例
# 1). 查询年龄为20,21,22,23岁的员工信息。
select * from emp where gender = '女' and age in(20,21,22,23);

# 1 select * from emp order by age asc , entrydate desc;
# 1 SELECT 字段列表 FROM 表名 LIMIT 起始索引, 查询记录数

# 2). 查询性别为 男 ，并且年龄在 20-40 岁(含)以内的姓名为三个字的员工。
select * from emp where gender='男'and (age between 20 and 40) and name like '___';

# 3). 统计员工表中, 年龄小于60岁的 , 男性员工和女性员工的人数。
select gender, count(*) from emp where age < 60 group by gender;
select gender, count(*) from emp where age < 60 group by gender;

# 4). 查询所有年龄小于等于35岁员工的姓名和年龄，并对查询结果按年龄升序排序，如果年龄相同按入职时间降序排序。
select name,age from emp where age<=35 order by age asc,entrydate desc ;
# 5). 查询性别为男，且年龄在20-40 岁(含)以内的前5个员工信息，对查询的结果按年龄升序排序，年龄相同按入职时间升序排序。
select * from emp where gender='男'and age between 20 and 40 order by age asc ,entrydate desc limit 5;
# 2.6.9 执行顺序
# 在讲解DQL语句的具体语法之前，我们已经讲解了DQL语句的完整语法，及编写顺序，接下来，我们要
# 来说明的是DQL语句在执行时的执行顺序，也就是先执行那一部分，后执行那一部分。
# from
# where
# group by
# select
# having
# limit

# 验证：
# 查询年龄大于15的员工姓名、年龄，并根据年龄进行升序排序。
select name,age from emp where age >15 order by age asc ;

# 在查询时，我们给emp表起一个别名 e，然后在select 及 where中使用该别名。
select e.name,e.age from emp e where e.age>15 order by e.age asc ;
# 执行上述SQL语句后，我们看到依然可以正常的查询到结果，此时就说明： from 先执行, 然后
# where 和 select 执行。那 where 和 select 到底哪个先执行呢?
# 此时，此时我们可以给select后面的字段起别名，然后在 where 中使用这个别名，然后看看是否可
# 以执行成功。
select e.name ename , e.age eage from emp e where age > 15 order by age asc;
-- ==[2022-08-06 12:27:40] [42S22][1054] Unknown column 'eage' in 'where clause'

# 执行上述SQL报错了:
# 由此我们可以得出结论: from 先执行，然后执行 where ， 再执行select 。
# 接下来，我们再执行如下SQL语句，查看执行效果：
select e.name ename , e.age eage from emp e where e.age > 15 order by eage asc;


# 结果执行成功。 那么也就验证了: order by 是在select 语句之后执行的。
# 综上所述，我们可以看到DQL语句的执行顺序为： from ... where ... group by ...
# having ... select ... order by ... limit ...
# 2.7 DCL
# DCL英文全称是Data Control Language(数据控制语言)，用来管理数据库用户、控制数据库的访

create user 'itcast'@ 'localhost' identified by '123456';