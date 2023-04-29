--建表
create database BookStore;

use BookStore;

create table 图书类型(
    类别名 char(20) primary key not null  ,
    借阅日期 tinyint not null--删掉要，写错了
    --借阅期限 tinyint --改为
);
------------------
EXEC sp_rename '图书类型.借阅日期','借阅期限','COLUMN'--更改字段名
alter table 图书 add 数量 int;
alter table 图书类型 add 借阅期限 tinyint not null ;
select *from 图书;
select * from 图书类型;

------------------
create table 图书(
ISBN char(20) primary key ,
图书名 nchar(20) not null,
作者 nchar(20) not null ,
出版社 nchar(20) not null ,
类别名 char(20) not null foreign key references 图书类型(类别名)
    on delete no action on update cascade,--指定如果试图删除某一行，而该行的键被其他表的现有行中的外键所引用，则也将删除所有包含那些外键的行。
出版时间 datetime not null ,
单价 money not null ,
图书状态 nchar(2) not null check(图书状态 in('在馆','借出')) ,

);

create table 部门(
    部门名 char(10),
    部门号 char(10) primary key ,
    联系电话 char(11) not null ,
    负责人 char(10) not null,
);

create table 教师(
    教工号 char(20) primary key ,
    姓名 char(10) not null ,
    性别 nchar(1) check (性别 in('男','女')),
    部门号 char(10) not null foreign key references 部门(部门号)
               on delete no action on UPDATE cascade,
    Email char(20) not null
);

create table 借还书登记(
    业务编号 int primary key,
    ISBN char(20) foreign key references 图书(ISBN)
                  on delete no action on UPDATE cascade,
    教工号 char(20) foreign key references 教师(教工号)
                  on delete no action on update cascade,
    归还时间 datetime not null ,
    借书办理人 char(10) not null ,
    还书办理人 char(10) not null ,

);
alter table 借还书登记 add 借书时间 datetime;
alter table 借还书登记 drop column 还书办理人,归还时间;
alter table 借还书登记 add 还书办理人 char(10);
alter table 借还书登记 add 归还时间 datetime;

create table 催还书登记(
    业务编号 int primary key ,
    ISBN char(20) foreign key references 图书(ISBN)
                   on delete no action on update cascade,
    教工号 char(20) foreign key references 教师(教工号)
                   on delete no action on update cascade,
    催还日期 datetime not null  ,
    办理人 char(10) not null
);


create table 管理员(
    管理员名 char(10) primary key,
    性别 nchar(2) check (性别 in ('男','女')) default '男',
    口令 char(20) not null

);

--a)	输入图书类型数据
insert into 图书类型 (类别名,借阅期限)values
('体育',14),
('教学参考书',180),
('文学',15),
('学术期刊',7),
('音乐',45);
----------------
select * from 借还书登记;
select *from 图书类型;
select *from 教师;
select * from 部门;
-----------------
insert into 部门(部门名, 部门号, 联系电话, 负责人) values
('网络系','A242','10086','周画'),
('计算机系','B241','10000','典韦'),
('数学系','C233','23333','哈士奇');---
--
insert into 教师(教工号, 姓名, 性别, 部门号, Email)
values
('^^6^^','喜杨杨','男','A242','999999999@qq.com');
--
--b)	增加三个教师信息
insert into 教师(教工号,姓名,性别,部门号,Email )
values
('A001','张三','男','A242','1456741111@qq.com'),
('B001','李四','男','B241','3478292222@qq.com'),
('C001','老六','女','C233','19382746666@qq.com');
--
SELECT *FROM 图书;
--
insert 借还书登记(业务编号, ISBN, 教工号,借书时间, 借书办理人)
values
(2,'978-7-107-18617-1','B001','2022-6-6','洁'),
(3,'978-7-107-18617-3','C001','2022-7-7','洁');
insert into 借还书登记(业务编号, isbn, 教工号, 借书办理人,归还时间,还书办理人)
values
(4,'978-7-107-18617-1','B001','洁','2022-12-1','洁')

insert into 图书(isbn, 图书名, 作者, 出版社, 类别名, 出版时间, 单价, 图书状态)
values
('978-6-666-66666-6','数据库从入门到精通','耿晓丽','数据库研究中心出版社','教学参考书',2022-9-9,100,'在馆');

UPDATE BookStore.dbo.图书 SET 数量 = 10 WHERE ISBN LIKE N'978-6-666-66666-6   ' ESCAPE '#';--在表中添加数据，自动的生成SQL

-- c)	增加五本书的信息
insert  图书(isbn, 图书名, 作者, 出版社, 类别名, 出版时间, 单价, 图书状态,数量)
values
( '978-7-107-18617-0','全品参考书','吴语', '无大雨出版社','教学参考书', 2022-12-2,50,'在馆', 5 ),
('978-7-107-18617-1','活着','余华','人民邮政出版社','文学',2012-01-01,30,'在馆',99),
('978-7-107-18617-2','内马尔桑巴舞者之足球','内马尔','第一体育出版社','体育',2022-12-10,66,'在馆',5),
('978-7-107-18617-3','量子纠缠',' 墨子','物理研究所出版社','学术期刊',2022-09-30,66,'借出',50),
( '978-7-107-18617-4','西游记典藏歌曲','吴承恩', '广州音乐学院出版社','音乐',1985-6-6,200, '在馆',1);
-- d)	某教师今天借了某书，涉及两个操作，一是将书的状态改为“借出”，二是增加一个借书记录
update 图书 set 图书状态= '借出'
    where 图书名='活着'
insert 借还书登记(业务编号, ISBN, 教工号,借书时间, 借书办理人)
values
(1,'978-7-107-18617-1','A001','2022-5-20','洁');
select * from 图书
select *from 借还书登记
-- e)	将某书的作者改为自己的姓名
update 图书
set 作者='陆梓鹏'
where 图书名='量子纠缠'
-- f)	查询某教师的借还书记录
select *from 借还书登记 where 教工号='A001';
-- g)	查询某本书的流转记录
select *from 借还书登记 where ISBN='978-7-107-18617-1'
-- 4）	创建视图，写出SQL语句

-- a)	借出图书视图
create view 借出图书
as
    select * from 图书 where 图书状态='借出';
-- b)	借阅逾期视图
create view 借阅逾期
as
select 借还书登记.借书办理人,借还书登记.教工号,图书.图书名 from 图书 inner join 借还书登记  on 图书.ISBN = 借还书登记.ISBN
                   inner join 图书类型  on 图书.类别名 = 图书类型.类别名
where 图书.图书状态='借出' and datediff(day,借还书登记.借书时间,getdate())>图书类型.借阅期限
-- c)	图书分类统计册数视图
create view 分类统计
as
    select count(*) as 书籍册数,类别名
    from 图书 group by 类别名
-- 作业3——存储过程与触发器设计任务
-- 任务：
-- 1）	为BookStore数据库增加一个用户oper1，允许oper1对图书表和借还表进行修改操作。
use  BookStore;
exec sp_addlogin oper1,'123456','BookStore';
exec sp_addrolemember 'db_datareader','oper1'
grant update on 图书 to oper1
grant update on 借还书登记 to oper1

-- 2）	设计存储过程
-- a)	某教师在某时间借了某本书，由某管理员办理。
create procedure proc_lendbook
@aid char(20),
@atime datetime,
@ISBN char(20),
@aname char(10)
as
begin
    update 图书
    set 图书状态='借出'
    where ISBN=@ISBN
    insert into 借还书登记(ISBN,教工号,借书办理人,借书时间)
    values (@ISBN,@aid,@aname,@atime)
end;

sp_helptext 'proc_lendbook';--查看存储过程

--EXECUTE proc_lendbook @aid='^^6^^',@ISBN = '978-6-666-66666-6',@aname='枫',@atime ='2022-12-01 09:00:00.000';
-- [2022-12-11 23:28:53] [23000][515] Line 13: 不能将值 NULL 插入列 '业务编号'，表 'BookStore.dbo.借还书登记'；列不允许有 Null 值。INSERT 失败。
exec sp_help 借还书登记
-- b)	查看某人的全部借还书记录
create procedure proc_getBooklog
@bookname nchar(20),
@ISBN char(20)
as
    begin
        select 教.姓名,图.图书名,借还.借书时间,归还时间 from 借还书登记 借还 join 教师 教 on 借还.教工号 = 教.教工号
        join 图书 图 on 借还.ISBN = 图.ISBN
        where 借还.ISBN=@ISBN or 图.图书名=@bookname
    end;

DROP PROCEDURE proc_getBooklog;--删除储存


-- c)	对书名进行模糊搜索（搜索条件可以是多个模糊列值的组合，例如：搜索书名包含“数据库”三个字，并且是近3年出版的图书）
create procedure proc_seacher
@bookname nchar(20),
@max tinyint
as
begin
    select * from 图书
        where datediff(year,出版时间,getdate())<@max and
              --图书名 like '%数据库%' +@bookname +'%数据库%'
              图书名 like '%' +@bookname +'%'
end
-- 3）	设计触发器
-- a)	当oper1用户对图书状态进行修改时，自动在借还表追加相应的数据。
create trigger tri_a
on 图书 after update
as
declare @status nchar(2)
--declare @status char(4)
declare @ISBN char(20)
select @status=图书状态 from inserted
select @ISBN=ISBN from inserted
if user_name()='oper1'
begin

    if @status='借出'
insert into 借还书登记(ISBN,借书办理人,借书时间)
values
    (@ISBN,user_name(),getdate())
else if @status='库存'
update 借还书登记
set 还书办理人=user_name(),归还时间=getdate()
where ISBN=@ISBN

end
-- b)	不允许oper1用户对催还表信息进行删除操作，如果删除进行回滚。
create trigger tri_b
on 催还书登记 after delete
as
if user_name()='oper1'
begin
    if (select count(*)from deleted)>0
    rollback
end
create user Oper1
grant update on  图书 TO oper1
grant update on 借还书登记 TO oper1
go
;
-- create database test
-- use test
-- create table student(
--     学号 char(10) primary key ,
--     姓名 char(10),
--     性别 nchar(2) default '男'
-- )
-- create table grade(
--     cno char(10),
--     sc int
-- )
-- alter table grade add 学号 char(10) references student;
--
-- insert into student values ('1001','yi','女')
-- insert into student(学号, 姓名) values ('1002','er')
--
-- insert into grade (cno, sc) values ('a101',100)
-- insert into grade (cno) values ('1002')
-- select *from grade
--
-- select * from student right join grade g on student.学号 = g.学号
-- select * from student  left join grade g on student.学号 = g.学号
-- use  teaching1
-- drop database test