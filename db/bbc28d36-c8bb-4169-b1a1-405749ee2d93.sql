select cno 课程号,score 成绩 from sc a where score>(select avg(score) from sc b where a.cno=b.cno)
;-- -. . -..- - / . -. - .-. -.--
select avg(score) from sc b where a.cno=b.cno
;-- -. . -..- - / . -. - .-. -.--
select avg(score) from sc
;-- -. . -..- - / . -. - .-. -.--
select  avg(score) from sc
;-- -. . -..- - / . -. - .-. -.--
select  avg(score) from sc a join sc b on a.cno=b.cno
;-- -. . -..- - / . -. - .-. -.--
select  avg(a.score) from sc a join sc b on a.cno=b.cno
;-- -. . -..- - / . -. - .-. -.--
select  avg(b.score) from sc a join sc b on a.cno=b.cno
;-- -. . -..- - / . -. - .-. -.--
select a.cno,b.cno avg(b.score) from sc a join sc b on a.cno=b.cno group by a.cno, b.cno
;-- -. . -..- - / . -. - .-. -.--
select a.cno,b.cno, avg(b.score) from sc a join sc b on a.cno=b.cno group by a.cno, b.cno
;-- -. . -..- - / . -. - .-. -.--
select  sc.sno,sname,score from course c join sc on sc.cno=c.cno
    join student s on s.sno = sc.sno
    where c.cname='c++语言' and score >
(select score from course c join sc on sc.cno=c.cno
    join student s on s.sno = sc.sno where sname='赵丽红'and c.cname='c++语言')
;-- -. . -..- - / . -. - .-. -.--
create table 管理员
(
用户名 Char(10)	primary key NOT NULL ,
性别	char(2)	Not null,
口令	nchar(20)	Not Null
)
;-- -. . -..- - / . -. - .-. -.--
create table 图书类型
(ISBN char(10) primary key not null ,
图书类别 char(20) primary key ,
借阅期限 char(10) not null
)
;-- -. . -..- - / . -. - .-. -.--
create table 图书类型
(ISBN char(10) not null ,
图书类别 char(20) primary key ,
借阅期限 char(10) not null
)
;-- -. . -..- - / . -. - .-. -.--
create table 部门
(
部门名 char(20) not null unique,
部门号 char(4) primary key not null,
联系电话 Nchar(11) not null,
负责人  char(10) not null,
)
;-- -. . -..- - / . -. - .-. -.--
create table 教师
(
 教工号 char(20) primary key ,
 教师姓名 char(10) not null,
 性别 Nchar(2) not null,
 部门号 char(10) foreign key references 部门,
 职位 char(20) not null,
 邮件地址 char(20) not null unique
)
;-- -. . -..- - / . -. - .-. -.--
create table 教师
(
 教工号 char(20) primary key ,
 教师姓名 char(10) not null,
 性别 Nchar(2) not null,
 部门号 char(4) foreign key references 部门,
 职位 char(20) not null,
 邮件地址 char(20) not null unique
)
;-- -. . -..- - / . -. - .-. -.--
create table 图书
(
ISBN char(20) primary key,
图书名 nchar(20) not null,
作者 char(10) not null,
图书类别 char(20) not null foreign key references 图书类型,
图书状态 char(10) not null,
借阅次数 char(4) not null,
借阅期限 DATETIME not null ,
出版社 char(20) not null ,
作者 char(30) not null ,
出版时间 DATETIME not null ,
)
;-- -. . -..- - / . -. - .-. -.--
create table 图书
(
ISBN char(20) primary key,
图书名 nchar(20) not null,
作者 char(30) not null,
图书类别 char(20) not null foreign key references 图书类型,
图书状态 char(10) not null,
借阅次数 char(4) not null,
借阅期限 DATETIME not null ,
出版社 char(20) not null ,
出版时间 DATETIME not null ,
)
;-- -. . -..- - / . -. - .-. -.--
create table 借还书登记
(
教工号 char(20) foreign key references 教师,
ISBN char(20) primary key,
图书名 char(20) not null,
借书人 char(10) not null,
借书时间 Date not null,
还书时间 DATETIME not null ,
借书办理人 char(10) not null,
还书办理人 char(10) not null

)
;-- -. . -..- - / . -. - .-. -.--
create table 催还书登记
(
ISBN	Char(20)	foreign key references 图书,
教工号	char(20)	foreign key references 教师,
办理人	Char(10)	Not Null,
催还日期 datetime	Not Null,
借书时间	Date	Not Null
)
;-- -. . -..- - / . -. - .-. -.--
insert 图书类型
values('教学参考书',100),
('文学作品',80),
('学术期刊',200),
('学术专著',50)
;-- -. . -..- - / . -. - .-. -.--
create proc proc_course
(@cname nvarchar(20),
@avgscore decimal(3,1) output )
as
select @avgscore=avg(sc.score)
from course join sc on course.cno=sc.cno
where course.cno=@cname;
;-- -. . -..- - / . -. - .-. -.--
declare @avgscore decimal(3,1)
exec  proc_course '操作系统',@avgscore output
select @avgscore 平均成绩
;-- -. . -..- - / . -. - .-. -.--
declare @avgscore decimal(3,1)
exec  proc_course '数据库原理与应用',@avgscore output
select @avgscore 平均成绩
;-- -. . -..- - / . -. - .-. -.--
insert 图书类型(图书类别, 借阅期限)
values('教学参考书',100),
('文学作品',80),
('学术期刊',200),
('学术专著',50)
;-- -. . -..- - / . -. - .-. -.--
use teaching1
;-- -. . -..- - / . -. - .-. -.--
drop database BookStore
;-- -. . -..- - / . -. - .-. -.--
create database BookStore
;-- -. . -..- - / . -. - .-. -.--
create table 图书类型(
    类别名 char(20) primary key not null  ,
    借阅日期 tinyint not null
)
;-- -. . -..- - / . -. - .-. -.--
create table 图书(
ISBN char(20) primary key ,
图书名 nchar(20) not null,
作者 nchar(20) not null ,
出版社 nchar(20) not null ,
类别名 nchar(20) not null foreign key references 图书类型(类别名)
    on delete no action on update cascade,--指定如果试图删除某一行，而该行的键被其他表的现有行中的外键所引用，则也将删除所有包含那些外键的行。
出版时间 datetime not null ,
单价 money not null ,
图书状态 nchar(2) not null check(图书状态 in('在馆','借出')) ,

)
;-- -. . -..- - / . -. - .-. -.--
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

)
;-- -. . -..- - / . -. - .-. -.--
create table 部门(
    部门名 char(10),
    部门号 char(10) primary key ,
    联系电话 char(11) not null ,
    负责人 char(10) not null,
)
;-- -. . -..- - / . -. - .-. -.--
create table 教师(
    教工号 char(20) primary key ,
    姓名 char(10) not null ,
    性别 nchar(1) check (性别 in('男','女')),
    部门号 char(10) not null foreign key references 部门(部门号)
               on delete no action on UPDATE cascade,
    Email char(20) not null
)
;-- -. . -..- - / . -. - .-. -.--
create table 借还书登记(
    业务编号 int primary key,
    ISBN char(20) foreign key references 图书(ISBN)
                  on delete no action on UPDATE cascade,
    教工号 char(10) foreign key references 教师(教工号)
                  on delete no action on update cascade,
    归还时间 datetime not null ,
    借书办理人 char(10) not null ,
    还书办理人 char(10) not null ,

)
;-- -. . -..- - / . -. - .-. -.--
create table 借还书登记(
    业务编号 int primary key,
    ISBN char(20) foreign key references 图书(ISBN)
                  on delete no action on UPDATE cascade,
    教工号 char(20) foreign key references 教师(教工号)
                  on delete no action on update cascade,
    归还时间 datetime not null ,
    借书办理人 char(10) not null ,
    还书办理人 char(10) not null ,

)
;-- -. . -..- - / . -. - .-. -.--
create table 催还书登记(
    业务编号 int primary key ,
    ISBN char(20) foreign key references 图书(ISBN)
                   on delete no action on update cascade,
    教工号 char(20) foreign key references 教师(教工号)
                   on delete no action on update cascade,
    催还日期 datetime not null  ,
    办理人 char(10) not null
)
;-- -. . -..- - / . -. - .-. -.--
create table 管理员(
    管理员名 char(10) primary key,
    性别 nchar(2) check (性别 in ('男','女')) default '男',
    口令 char(20) not null

)
;-- -. . -..- - / . -. - .-. -.--
alter table 图书类型(
    类别名 char(20) primary key not null  ,
    借阅期限 tinyint not null
)
;-- -. . -..- - / . -. - .-. -.--
alter table 图书类型(类别名 char(20) primary key not null  ,
    借阅期限 tinyint not null
)
;-- -. . -..- - / . -. - .-. -.--
drop table 图书类型(
    类别名 char(20) primary key not null  ,
    借阅日期 tinyint not null
)
;-- -. . -..- - / . -. - .-. -.--
EXEC sp_rename '图书类型。借阅日期','借阅期限','COLUMN'
;-- -. . -..- - / . -. - .-. -.--
EXEC sp_rename '图书类型。借阅日期','借阅期限'
;-- -. . -..- - / . -. - .-. -.--
drop table 图书类型
;-- -. . -..- - / . -. - .-. -.--
drop table 图书
;-- -. . -..- - / . -. - .-. -.--
EXEC sp_rename '图书类型.借阅日期','图书类型.借阅期限','COLUMN'
;-- -. . -..- - / . -. - .-. -.--
EXEC sp_rename '图书类型.借阅日期','借阅期限','COLUMN'
;-- -. . -..- - / . -. - .-. -.--
insert into 图书类型 values(类别名,借阅期限)
('教学参考书',180),
('文学',15),
('学术期刊',7),
('学术专著',14),
('音乐',45)
;-- -. . -..- - / . -. - .-. -.--
insert into 图书类型 (类别名,借阅期限)values
('教学参考书',180),
('文学',15),
('学术期刊',7),
('音乐',45)
;-- -. . -..- - / . -. - .-. -.--
insert 教师(教工号,姓名,性别,部门号,Email )
values
('A1010','张三','男','A001','1456741111@qq.com'),
('C1000','李四','','B001','3478292222@qq.com'),
('D1002','老六','女','C001','19382746666@qq.com')
;-- -. . -..- - / . -. - .-. -.--
insert 教师(教工号,姓名,性别,部门号,Email )
values
('A1010','张三','男','A001','1456741111@qq.com'),
('C1000','李四','男','B001','3478292222@qq.com'),
('D1002','老六','女','C001','19382746666@qq.com')
;-- -. . -..- - / . -. - .-. -.--
select *
from 部门
;-- -. . -..- - / . -. - .-. -.--
insert into 部门(部门名, 部门号, 联系电话, 负责人) values
('网络系','A242','10086','周画'),
('计算机系','B241','10000','典韦'),
('数学系','C233','23333','哈士奇')
;-- -. . -..- - / . -. - .-. -.--
insert into 教师(教工号,姓名,性别,部门号,Email )
values
('A242','张三','男','A001','1456741111@qq.com'),
('B241','李四','男','B001','3478292222@qq.com'),
('C233','老六','女','C001','19382746666@qq.com')
;-- -. . -..- - / . -. - .-. -.--
insert into 教师(教工号,姓名,性别,部门号,Email )
values
('A001','张三','男','A242','1456741111@qq.com'),
('B001','李四','男','B241','3478292222@qq.com'),
('C001','老六','女','C233','19382746666@qq.com')
;-- -. . -..- - / . -. - .-. -.--
insert into 图书类型 (类别名,借阅期限)values
('体育',14)
;-- -. . -..- - / . -. - .-. -.--
alter table 图书 add 数量 int
;-- -. . -..- - / . -. - .-. -.--
select *from 图书
;-- -. . -..- - / . -. - .-. -.--
insert  图书(isbn, 图书名, 作者, 出版社, 类别名, 出版时间, 单价, 图书状态,数量)
values
( '978-7-107-18617-0','全品参考书','吴语', '无大雨出版社','教学参考书', '2022-12-2',50,'在馆', 5 ),
('978-7-107-18617-1','活着','余华','人民邮政出版社','文学作品',2012-01-01,30,'借出',99),
('978-7-107-18617-2','内马尔桑巴舞者之足球','内马尔','第一体育出版社','体育',2022-12-10,66,'在馆',5),
('978-7-107-18617-3','量子纠缠',' 墨子','物理研究所出版社','学术期刊',2022-09-30,66,'借出',50),
( '978-7-107-18617-4','西游记典藏歌曲','吴承恩', '音乐', '在馆',1985-6-6,200, '在馆',20)
;-- -. . -..- - / . -. - .-. -.--
insert  图书(isbn, 图书名, 作者, 出版社, 类别名, 出版时间, 单价, 图书状态,数量)
values
( '978-7-107-18617-0','全品参考书','吴语', '无大雨出版社','教学参考书', 2022-12-2,50,'在馆', 5 ),
('978-7-107-18617-1','活着','余华','人民邮政出版社','文学作品',2012-01-01,30,'借出',99),
('978-7-107-18617-2','内马尔桑巴舞者之足球','内马尔','第一体育出版社','体育',2022-12-10,66,'在馆',5),
('978-7-107-18617-3','量子纠缠',' 墨子','物理研究所出版社','学术期刊',2022-09-30,66,'借出',50),
( '978-7-107-18617-4','西游记典藏歌曲','吴承恩', '音乐', '在馆',1985-6-6,200, '在馆',20)
;-- -. . -..- - / . -. - .-. -.--
insert  图书(isbn, 图书名, 作者, 出版社, 类别名, 出版时间, 单价, 图书状态,数量)
values
( '978-7-107-18617-0','全品参考书','吴语', '无大雨出版社','教学参考书', 2022-12-2,50,'在馆', 5 ),
('978-7-107-18617-1','活着','余华','人民邮政出版社','文学作品',2012-01-01,30,'借出',99),
('978-7-107-18617-2','内马尔桑巴舞者之足球','内马尔','第一体育出版社','体育',2022-12-10,66,'在馆',5),
('978-7-107-18617-3','量子纠缠',' 墨子','物理研究所出版社','学术期刊',2022-09-30,66,'借出',50),
( '978-7-107-18617-4','西游记典藏歌曲','吴承恩', '广州音乐学院出版社','音乐', '在馆',1985-6-6,200, '在馆',20)
;-- -. . -..- - / . -. - .-. -.--
insert  图书(isbn, 图书名, 作者, 出版社, 类别名, 出版时间, 单价, 图书状态,数量)
values
( '978-7-107-18617-0','全品参考书','吴语', '无大雨出版社','教学参考书', 2022-12-2,50,'在馆', 5 ),
('978-7-107-18617-1','活着','余华','人民邮政出版社','文学作品',2012-01-01,30,'借出',99),
('978-7-107-18617-2','内马尔桑巴舞者之足球','内马尔','第一体育出版社','体育',2022-12-10,66,'在馆',5),
('978-7-107-18617-3','量子纠缠',' 墨子','物理研究所出版社','学术期刊',2022-09-30,66,'借出',50),
( '978-7-107-18617-4','西游记典藏歌曲','吴承恩', '广州音乐学院出版社','音乐',1985-6-6,200, '在馆',1)
;-- -. . -..- - / . -. - .-. -.--
insert  图书(isbn, 图书名, 作者, 出版社, 类别名, 出版时间, 单价, 图书状态,数量)
values
( '978-7-107-18617-0','全品参考书','吴语', '无大雨出版社','教学参考书', 2022-12-2,50,'在馆', 5 ),
('978-7-107-18617-1','活着','余华','人民邮政出版社','文学',2012-01-01,30,'借出',99),
('978-7-107-18617-2','内马尔桑巴舞者之足球','内马尔','第一体育出版社','体育',2022-12-10,66,'在馆',5),
('978-7-107-18617-3','量子纠缠',' 墨子','物理研究所出版社','学术期刊',2022-09-30,66,'借出',50),
( '978-7-107-18617-4','西游记典藏歌曲','吴承恩', '广州音乐学院出版社','音乐',1985-6-6,200, '在馆',1)
;-- -. . -..- - / . -. - .-. -.--
alter table 借还书登记 add 借书时间 datetime
;-- -. . -..- - / . -. - .-. -.--
alter table 借还书登记 drop column 还书办理人,归还时间
;-- -. . -..- - / . -. - .-. -.--
alter table 借还书登记 add 还书办理人 char(10)
;-- -. . -..- - / . -. - .-. -.--
alter table 借还书登记 add 归还时间 datetime
;-- -. . -..- - / . -. - .-. -.--
select * from 借还书登记
;-- -. . -..- - / . -. - .-. -.--
select *from 教师
;-- -. . -..- - / . -. - .-. -.--
update 图书 set 图书状态= '在馆'
    where 图书名='活着'
    insert 借还书登记(业务编号, ISBN, 教工号,借书时间, 借书办理人, 还书办理人,归还时间)
values
(1,'978-7-107-18617-1','A001','2022-5-20','洁')
;-- -. . -..- - / . -. - .-. -.--
update 图书 set 图书状态= '在馆'
    where 图书名='活着'
insert 借还书登记(业务编号, ISBN, 教工号,借书时间, 借书办理人, 还书办理人,归还时间)
values
(1,'978-7-107-18617-1','A001','2022-5-20','洁');
;-- -. . -..- - / . -. - .-. -.--
update 图书 set 图书状态= '在馆'
    where 图书名='活着'
insert 借还书登记(业务编号, ISBN, 教工号,借书时间, 借书办理人)
values
(1,'978-7-107-18617-1','A001','2022-5-20','洁');
;-- -. . -..- - / . -. - .-. -.--
update 图书 set 图书状态= '借出'
    where 图书名='活着'
insert 借还书登记(业务编号, ISBN, 教工号,借书时间, 借书办理人)
values
(1,'978-7-107-18617-1','A001','2022-5-20','洁');
;-- -. . -..- - / . -. - .-. -.--
update 图书 set 图书状态= '借出'
    where 图书名='活着'
;-- -. . -..- - / . -. - .-. -.--
update 图书
set 作者='陆梓鹏'
where 图书名='量子纠缠'
;-- -. . -..- - / . -. - .-. -.--
select *from 借还书登记 where 教工号='A001'
;-- -. . -..- - / . -. - .-. -.--
select *from 借还书登记 where ISBN='978-7-107-18617-1   '
;-- -. . -..- - / . -. - .-. -.--
SELECT *FROM 图书
;-- -. . -..- - / . -. - .-. -.--
insert 借还书登记(业务编号, ISBN, 教工号,借书时间, 借书办理人)
values
(2,'978-7-107-18617-1','B001','2022-6-6','洁'),
(3,'978-7-107-18617-3','C001','2022-7-7','洁')
;-- -. . -..- - / . -. - .-. -.--
insert into 借还书登记(业务编号, isbn, 教工号, 归还时间,还书办理人)
values 
(4,'978-7-107-18617-1','B001','2022-12-1','洁')
;-- -. . -..- - / . -. - .-. -.--
insert into 借还书登记(业务编号, isbn, 教工号, 借书办理人,归还时间,还书办理人)
values
(4,'978-7-107-18617-1','B001','洁','2022-12-1','洁')
;-- -. . -..- - / . -. - .-. -.--
select *from 借还书登记 where ISBN='978-7-107-18617-1'
;-- -. . -..- - / . -. - .-. -.--
-- a)	借出图书视图
create view 借出图书
as
    select * from 图书 where 图书状态='借出'
;-- -. . -..- - / . -. - .-. -.--
alter table 图书类型 add 借阅期限 tinyint not null
;-- -. . -..- - / . -. - .-. -.--
select * from 图书类型
;-- -. . -..- - / . -. - .-. -.--
-- b)	借阅逾期视图
create view 借阅逾期视图
as
    select * from 图书 inner join 借还书登记  on 图书.ISBN = 借还书登记.ISBN
inner join 图书类型  on 图书.类别名 = 图书类型.类别名
where 图书.图书状态='借出' and datediff(day(,借还书登记.借书时间,getdate()))>图书类型.借阅期限
;-- -. . -..- - / . -. - .-. -.--
-- b)	借阅逾期视图
create view 借阅逾期视图
as
    select * from 图书 inner join 借还书登记  on 图书.ISBN = 借还书登记.ISBN
inner join 图书类型  on 图书.类别名 = 图书类型.类别名
where 图书.图书状态='借出' and datediff(day(借还书登记.借书时间,getdate()))>图书类型.借阅期限
;-- -. . -..- - / . -. - .-. -.--
-- b)	借阅逾期视图
create view 借阅逾期视图
as
    select * from 图书 inner join 借还书登记  on 图书.ISBN = 借还书登记.ISBN
inner join 图书类型  on 图书.类别名 = 图书类型.类别名
where 图书.图书状态='借出' and datediff(day,借还书登记.借书时间,getdate())>图书类型.借阅期限
;-- -. . -..- - / . -. - .-. -.--
-- b)	借阅逾期视图
create view 借阅逾期
as
    select * from 图书 inner join 借还书登记  on 图书.ISBN = 借还书登记.ISBN
inner join 图书类型  on 图书.类别名 = 图书类型.类别名
where 图书.图书状态='借出' and datediff(day,借还书登记.借书时间,getdate())>图书类型.借阅期限
;-- -. . -..- - / . -. - .-. -.--
select *from 图书类型
;-- -. . -..- - / . -. - .-. -.--
-- c)	图书分类统计册数视图
create view 分类统计
as
    select count(*) as 书籍册数,类别名
    from 图书 group by 类别名
;-- -. . -..- - / . -. - .-. -.--
-- b)	借阅逾期视图
create view 借阅逾期
as
select * from 图书 inner join 借还书登记  on 图书.ISBN = 借还书登记.ISBN
inner join 图书类型  on 图书.类别名 = 图书类型.类别名
where 图书.图书状态='借出' and datediff(day,借还书登记.借书时间,getdate())>图书类型.借阅日期
;-- -. . -..- - / . -. - .-. -.--
-- b)	借阅逾期视图
create view 借阅逾期
as
select * from 图书 inner join 借还书登记  on 图书.ISBN = 借还书登记.ISBN
inner join 图书类型  on 图书.类别名 = 图书类型.类别名
where 图书.图书状态='借出' and datediff(day,借还书登记.借书时间,getdate())>图书类型.借阅期限
;-- -. . -..- - / . -. - .-. -.--
-- b)	借阅逾期视图
create view 借阅逾期
as
select 借还书登记.借书办理人,借还书登记.教工号,图书.图书名 from 图书 inner join 借还书登记  on 图书.ISBN = 借还书登记.ISBN
                   inner join 图书类型  on 图书.类别名 = 图书类型.类别名
where 图书.图书状态='借出' and datediff(day,借还书登记.借书时间,getdate())>图书类型.借阅期限
;-- -. . -..- - / . -. - .-. -.--
use BookStore
;-- -. . -..- - / . -. - .-. -.--
exec sp_addlogin operl,'123456','BookStore'
;-- -. . -..- - / . -. - .-. -.--
execute sp_addrolemember 'db_datareader','operl'
grant update on 图书 to operl
grant update on 借还书登记 to operl
;-- -. . -..- - / . -. - .-. -.--
grant update on 图书 to operl
;-- -. . -..- - / . -. - .-. -.--
execute sp_addrolemember 'db_datareader','oper1'
;-- -. . -..- - / . -. - .-. -.--
use  BookStore
;-- -. . -..- - / . -. - .-. -.--
execute sp_addrolemember 'db_datareader','oper1'
grant update on 图书 to operl
grant update on 借还书登记 to operl
;-- -. . -..- - / . -. - .-. -.--
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
;-- -. . -..- - / . -. - .-. -.--
create procedure proc_getBooklog
@bookname nchar(20),
@ISBN char(20)
as
    begin
        select * from 借还书登记 借还 join 教师 教 on 借还.教工号 = 教.教工号
        join 图书 图 on 借还.ISBN = 图.ISBN
        where 借还.ISBN=@ISBN or 图.图书名=@bookname
    end
;-- -. . -..- - / . -. - .-. -.--
DROP PROCEDURE proc_getBooklog
;-- -. . -..- - / . -. - .-. -.--
create procedure proc_getBooklog
@bookname nchar(20),
@ISBN char(20)
as
    begin
        select 教.姓名,图.图书名,借还.借书时间,归还时间 from 借还书登记 借还 join 教师 教 on 借还.教工号 = 教.教工号
        join 图书 图 on 借还.ISBN = 图.ISBN
        where 借还.ISBN=@ISBN or 图.图书名=@bookname
    end;

DROP PROCEDURE proc_getBooklog;
;-- -. . -..- - / . -. - .-. -.--
exec sp_addlogin oper1,'123456','BookStore'
;-- -. . -..- - / . -. - .-. -.--
exec sp_addrolemember 'db_datareader','oper1'
grant update on 图书 to oper1
grant update on 借还书登记 to oper1
;-- -. . -..- - / . -. - .-. -.--
exec sp_addrolemember 'db_datareader','oper1'
;-- -. . -..- - / . -. - .-. -.--
grant update on 图书 to oper1
;-- -. . -..- - / . -. - .-. -.--
grant update on 借还书登记 to oper1
;-- -. . -..- - / . -. - .-. -.--
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
;-- -. . -..- - / . -. - .-. -.--
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
;-- -. . -..- - / . -. - .-. -.--
create trigger tri_b
on 催还书登记 after delete
as
if user_name()='oper1'
begin
    if (select count(*)from deleted)>0
    rollback
end
;-- -. . -..- - / . -. - .-. -.--
insert into 图书(isbn, 图书名, 作者, 出版社, 类别名, 出版时间, 单价, 图书状态)
values
('978-6-666-66666-6','数据库从入门到精通','耿晓丽','数据库研究中心出版社','教学参考书',2022-9-9,100,'在馆')
;-- -. . -..- - / . -. - .-. -.--
select * from 图书
;-- -. . -..- - / . -. - .-. -.--
sp_helptext 'proc_lendbook'
;-- -. . -..- - / . -. - .-. -.--
EXECUTE proc_lendbook
;-- -. . -..- - / . -. - .-. -.--
EXECUTE proc_lendbook ('A001')
;-- -. . -..- - / . -. - .-. -.--
EXECUTE proc_lendbook 'A001'
;-- -. . -..- - / . -. - .-. -.--
insert into 教师(教工号, 姓名, 性别, 部门号, Email)
values
('^^6^^','喜杨杨','男','A242','999999999@qq.com')
;-- -. . -..- - / . -. - .-. -.--
EXECUTE proc_lendbook @aid='^^6^^',@ISBN = '978-6-666-66666-6',@aname='枫',@atime = '2022年12月11日23:06:08'
;-- -. . -..- - / . -. - .-. -.--
EXECUTE proc_lendbook @aid='^^6^^',@ISBN = '978-6-666-66666-6',@aname='枫',@atime = '2022-12-11,23:06:08'
;-- -. . -..- - / . -. - .-. -.--
select *from 借还书登记
;-- -. . -..- - / . -. - .-. -.--
EXECUTE proc_lendbook @aid='^^6^^',@ISBN = '978-6-666-66666-6',@aname='枫',@atime = 2022-12-01 09
;-- -. . -..- - / . -. - .-. -.--
EXECUTE proc_lendbook 1,@aid='^^6^^',@ISBN = '978-6-666-66666-6',@aname='枫',@atime ='2022-12-01 09:00:00.000'
;-- -. . -..- - / . -. - .-. -.--
EXECUTE proc_lendbook 9,@aid='^^6^^',@ISBN = '978-6-666-66666-6',@aname='枫',@atime ='2022-12-01 09:00:00.000'
;-- -. . -..- - / . -. - .-. -.--
exec sp_help
;-- -. . -..- - / . -. - .-. -.--
exec sp_help 借还书登记
;-- -. . -..- - / . -. - .-. -.--
EXECUTE proc_lendbook @aid='^^6^^',@ISBN = '978-6-666-66666-6',@aname='枫',@atime ='2022-12-01 09:00:00.000'
;-- -. . -..- - / . -. - .-. -.--
create user Oper1
;-- -. . -..- - / . -. - .-. -.--
grant update on  图书 TO oper1
;-- -. . -..- - / . -. - .-. -.--
grant update on 借还书登记 TO oper1
;-- -. . -..- - / . -. - .-. -.--
create database test
;-- -. . -..- - / . -. - .-. -.--
use test
;-- -. . -..- - / . -. - .-. -.--
create table student(
    学号 char(10) primary key ,
    姓名 char(10),
    性别 nchar(2) default 性别='男'
)
;-- -. . -..- - / . -. - .-. -.--
create table student(
    学号 char(10) primary key ,
    姓名 char(10),
    性别 nchar(2) default '性别'='男'
)
;-- -. . -..- - / . -. - .-. -.--
create table student(
    学号 char(10) primary key ,
    姓名 char(10),
    性别 nchar(2) default '男'
)
;-- -. . -..- - / . -. - .-. -.--
create table grade(
    cno char(10),
    sc int
)
;-- -. . -..- - / . -. - .-. -.--
insert into student values ('1001','yi','女')
;-- -. . -..- - / . -. - .-. -.--
insert into grade (cno, sc) values ('a101',100)
;-- -. . -..- - / . -. - .-. -.--
alter table grade add 学号 char(10) references grade
;-- -. . -..- - / . -. - .-. -.--
alter table grade add 学号 char(10) references student
;-- -. . -..- - / . -. - .-. -.--
insert into grade (学号,cno, sc) values ('1002','b101')
;-- -. . -..- - / . -. - .-. -.--
insert into grade (学号,cno, sc) values ('1002','b101',)
;-- -. . -..- - / . -. - .-. -.--
insert into grade (学号,cno) values ('1002','b101')
;-- -. . -..- - / . -. - .-. -.--
insert into grade (cno) values ('1002')
;-- -. . -..- - / . -. - .-. -.--
select *from grade
;-- -. . -..- - / . -. - .-. -.--
valu

    es
;-- -. . -..- - / . -. - .-. -.--
insert into student values ('1002','er')
;-- -. . -..- - / . -. - .-. -.--
insert into student(学号, 姓名) values ('1002','er')
;-- -. . -..- - / . -. - .-. -.--
select * from student left join grade g on student.学号 = g.学号
;-- -. . -..- - / . -. - .-. -.--
select * from student  left join grade g on student.学号 = g.学号
;-- -. . -..- - / . -. - .-. -.--
select * from student right join grade g on student.学号 = g.学号
;-- -. . -..- - / . -. - .-. -.--
use  teaching1
;-- -. . -..- - / . -. - .-. -.--
drop database test
;-- -. . -..- - / . -. - .-. -.--
USE [海产品管理系统]
;-- -. . -..- - / . -. - .-. -.--
INSERT Category ([classifcation_id], [classifcation_name]) VALUES (N'01', N'活鲜鱼类')
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].Category ([classifcation_id], [classifcation_name]) VALUES (N'02', N'冰鲜鱼类')
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].Category ([classifcation_id], [classifcation_name]) VALUES (N'03', N'活鲜贝类')
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].Category ([classifcation_id], [classifcation_name]) VALUES (N'04', N'虾类')
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].Category ([classifcation_id], [classifcation_name]) VALUES (N'05', N'冰鲜肉类')
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].Category ([classifcation_id], [classifcation_name]) VALUES (N'06', N'活鲜贝类')
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].Category ([classifcation_id], [classifcation_name]) VALUES (N'07', N'虾类')
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].Category ([classifcation_id], [classifcation_name]) VALUES (N'08', N'蟹类')
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].Category ([classifcation_id], [classifcation_name]) VALUES (N'09', N'藻类')
;-- -. . -..- - / . -. - .-. -.--
select * from Category
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].Supplier ([supplier_id], [supplier_name], [director], [telephone]) VALUES (N'a0001', N'北海道渔场', N'小王', N'020-126789')
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].Supplier ([supplier_id], [supplier_name], [director], [telephone]) VALUES (N'a0002', N'纽芬兰渔场', N'小海', N'020-761921')
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Supplier] ([supplier_id], [supplier_name], [director], [telephone]) VALUES (N'a0003', N'叶某鱼场', N'小叶', N'010-263764')
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Supplier] ([supplier_id], [supplier_name], [director], [telephone]) VALUES (N'a0004', N'北海渔场', N'小汤', N'020-278376')
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Supplier] ([supplier_id], [supplier_name], [director], [telephone]) VALUES (N'a0005', N'秘鲁渔场', N'小陈', N'050-278374')
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Supplier] ([supplier_id], [supplier_name], [director], [telephone]) VALUES (N'a0006', N'舟山渔场', N'小杨', N'080-238718')
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Supplier] ([supplier_id], [supplier_name], [director], [telephone]) VALUES (N'a0007', N'黄渤海渔场', N'小思', N'080-238718')
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Supplier] ([supplier_id], [supplier_name], [director], [telephone]) VALUES (N'a0008', N'南部沿海渔场', N'小陆', N'080-238718')
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Supplier] ([supplier_id], [supplier_name], [director], [telephone]) VALUES (N'a0009', N'北部湾渔场', N'小美', N'080-238718')
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].Storehouse ([storehouse_id], [director], [telephone], [area]) VALUES (N'v01', N'小红', N'020-367162', 200)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].Storehouse ([storehouse_id], [director], [telephone], [area]) VALUES (N'v02', N'小白', N'020-367816', 220)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].Storehouse ([storehouse_id], [director], [telephone], [area]) VALUES (N'v03', N'小黄', N'020-478365', 400)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].Storehouse ([storehouse_id], [director], [telephone], [area]) VALUES (N'v04', N'小黑子', N'020-472675', 350)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].Storehouse ([storehouse_id], [director], [telephone], [area]) VALUES (N'v05', N'小坤', N'020-378265', 400)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].Storehouse ([storehouse_id], [director], [telephone], [area]) VALUES (N'v06', N'小美', N'020-367514', 500)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].Goods ([Goods_name], [goods_id], [Classification_id], [supplier_id], [storehouse_id], [unit_price], [Stock_quantity], [Order_quantity]) VALUES (N'先生鱼', N'g001', N'01', N'a0005', N'v02', 9.0000, 300, 15)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].Department ([department_id], [department_name], [telephone], [manager]) VALUES (N'A001', N'管理部', N'17423863672', N'郑秀珍')
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Department] ([department_id], [department_name], [telephone], [manager]) VALUES (N'B001', N'销售部', N'17688182563', N'小翔')
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Department] ([department_id], [department_name], [telephone], [manager]) VALUES (N'C001', N'仓库部', N'19723746571', N'小海')
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Department] ([department_id], [department_name], [telephone], [manager]) VALUES (N'D001', N'采购部', N'18726354975', N'小东')
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Department] ([department_id], [department_name], [telephone], [manager]) VALUES (N'E001', N'市场部', N'13417923202', N'小陈')
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Department] ([department_id], [department_name], [telephone], [manager]) VALUES (N'F001', N'人力资源部', N'17818190820', N'小仕')
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Department] ([department_id], [department_name], [telephone], [manager]) VALUES (N'G001', N'秘书部', N'12637845693', N'小森')
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Department] ([department_id], [department_name], [telephone], [manager]) VALUES (N'H001', N'后勤部', N'1273648924', N'小华')
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Employee] ([employee_id], [employee_name], [department_id], [sex], [Birth_date], [Hire_date], [telephone], [wages], [address]) VALUES (N'A01', N'熊大', N'A001', N'男', CAST(0x00007DB300000000 AS DateTime), CAST(0x00009C4000000000 AS DateTime), N'17328568632', 7000.0000, N'广从南路')
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Employee] ([employee_id], [employee_name], [department_id], [sex], [Birth_date], [Hire_date], [telephone], [wages], [address]) VALUES (N'A01', N'熊大', N'A001', N'男', CAST(0x00007DB300000000 AS DateTime), CAST(0x00009C4000000000 AS DateTime), N'1732856863', 7000.0000, N'广从南路')
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[职工表] ([employee_id], [employee_name], [department_id], [sex], [birth], [hire], [telephone], [wages], [address]) VALUES (N'A02', N'高启强', N'A001', N'男', CAST(0x00007C6100000000 AS DateTime), CAST(0x00009D7000000000 AS DateTime), N'1782297538', 6000.0000, N'东风六路')
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].Employee ([employee_id], [employee_name], [department_id], [sex], [birth], [hire], [telephone], [wages], [address]) VALUES (N'A02', N'高启强', N'A001', N'男', CAST(0x00007C6100000000 AS DateTime), CAST(0x00009D7000000000 AS DateTime), N'1782297538', 6000.0000, N'东风六路')
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].Employee ([employee_id], [employee_name], [department_id], [sex], [Birth_date], [Hire_date], [telephone], [wages], [address]) VALUES (N'A02', N'高启强', N'A001', N'男', CAST(0x00007C6100000000 AS DateTime), CAST(0x00009D7000000000 AS DateTime), N'1782297538', 6000.0000, N'东风六路')
;-- -. . -..- - / . -. - .-. -.--
select *from Department
;-- -. . -..- - / . -. - .-. -.--
select * from Employee
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].employee ([employee_id], [employee_name], [department_id], [sex], [Birth_date], [Hire_date], [telephone], [wages], [address]) VALUES (N'A03', N'郑秀珍', N'A001', N'女', CAST(0x000072C100000000 AS DateTime), CAST(0x00009C0300000000 AS DateTime), N'1742386367', 8000.0000, N'建设路')
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Employee] ([employee_id], [employee_name], [department_id], [sex], [birth_date], [hire_date], [telephone], [wages], [address]) VALUES (N'B01', N'小翔', N'B001', N'男', CAST(0x0000813E00000000 AS DateTime), CAST(0x00009EA200000000 AS DateTime), N'17688182563', 9000.0000, N'北京路')
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Employee] ([employee_id], [employee_name], [department_id], [sex], [birth_date], [hire_date], [telephone], [wages], [address]) VALUES (N'B01', N'小翔', N'B001', N'男', CAST(0x0000813E00000000 AS DateTime), CAST(0x00009EA200000000 AS DateTime), N'1768818256', 9000.0000, N'北京路')
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Employee] ([employee_id], [employee_name], [department_id], [sex], [birth_date], [hire_date], [telephone], [wages], [address]) VALUES (N'B02', N'赵晓薇', N'B001', N'女', CAST(0x000086D900000000 AS DateTime), CAST(0x0000A97100000000 AS DateTime), N'1782390512', 5000.0000, N'南京路')
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Employee] ([employee_id], [employee_name], [department_id], [sex], [birth_date], [hire_date], [telephone], [wages], [address]) VALUES (N'B03', N'陆某', N'B001', N'男', CAST(0x000087CC00000000 AS DateTime), CAST(0x0000AB9600000000 AS DateTime), N'1782934927', 3000.0000, N'集体宿舍')
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Employee] ([employee_id], [employee_name], [department_id], [sex], [birth_date], [hire_date], [telephone], [wages], [address]) VALUES (N'B04', N'黄海海', N'B001', N'男', CAST(0x0000810F00000000 AS DateTime), CAST(0x0000A89C00000000 AS DateTime), N'1234567905', 4000.0000, N'爱情路')
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Employee] ([employee_id], [employee_name], [department_id], [sex], [birth_date], [hire_date], [telephone], [wages], [address]) VALUES (N'B05', N'李白', N'B001', N'男', CAST(0x000084DC00000000 AS DateTime), CAST(0x0000A44200000000 AS DateTime), N'1987654318', 5000.0000, N'科技一路')
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Employee] ([employee_id], [employee_name], [department_id], [sex], [birth_date], [hire_date], [telephone], [wages], [address]) VALUES (N'B06', N'刘备', N'B001', N'男', CAST(0x0000878C00000000 AS DateTime), CAST(0x0000A98D00000000 AS DateTime), N'1546892467', 5000.0000, N'科技二路')
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Employee] ([employee_id], [employee_name], [department_id], [sex], [birth_date], [hire_date], [telephone], [wages], [address]) VALUES (N'B07', N'嫦娥', N'B001', N'女', CAST(0x0000876300000000 AS DateTime), CAST(0x0000AB1E00000000 AS DateTime), N'1346702754', 4000.0000, N'集体宿舍')
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Employee] ([employee_id], [employee_name], [department_id], [sex], [birth_date], [hire_date], [telephone], [wages], [address]) VALUES (N'B08', N'萧小红', N'B001', N'女', CAST(0x0000849700000000 AS DateTime), CAST(0x0000A2E400000000 AS DateTime), N'17824617913', 6000.0000, N'前进路')
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Employee] ([employee_id], [employee_name], [department_id], [sex], [birth_date], [hire_date], [telephone], [wages], [address]) VALUES (N'B08', N'萧小红', N'B001', N'女', CAST(0x0000849700000000 AS DateTime), CAST(0x0000A2E400000000 AS DateTime), N'1782461913', 6000.0000, N'前进路')
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Employee] ([employee_id], [employee_name], [department_id], [sex], [birth_date], [hire_date], [telephone], [wages], [address]) VALUES (N'C01', N'丽丽', N'C001', N'女', CAST(0x00008A6600000000 AS DateTime), CAST(0x0000AB5A00000000 AS DateTime),   N'1276351896', 3000.0000, N'集体宿舍')
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Employee] ([employee_id], [employee_name], [department_id], [sex], [birth_date], [hire_date], [telephone], [wages], [address]) VALUES (N'C02', N'安心', N'C001', N'男', CAST(0x00007F3A00000000 AS DateTime), CAST(0x00009D2C00000000 AS DateTime), N'1972374671', 8000.0000, NULL)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Employee] ([employee_id], [employee_name], [department_id], [sex], [birth_date], [hire_date], [telephone], [wages], [address]) VALUES (N'C03', N'唐滑翔', N'C001', N'男', CAST(0x0000896200000000 AS DateTime), CAST(0x0000A88000000000 AS DateTime), N'1287361836', 4000.0000, NULL)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Employee] ([employee_id], [employee_name], [department_id], [sex], [birth_date], [hire_date], [telephone], [wages], [address]) VALUES (N'C04', N'安琪拉', N'C001', N'女', CAST(0x00008D6F00000000 AS DateTime), CAST(0x0000AA1500000000 AS DateTime), N'1786238921', 4000.0000, N'冲锋路')
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Employee] ([employee_id], [employee_name], [department_id], [sex], [birth_date], [hire_date], [telephone], [wages], [address]) VALUES (N'C05', N'白小川', N'C001', N'男', CAST(0x0000838100000000 AS DateTime), CAST(0x0000A74C00000000 AS DateTime), N'1782346712', 5000.0000, NULL)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Employee] ([employee_id], [employee_name], [department_id], [sex], [birth_date], [hire_date], [telephone], [wages], [address]) VALUES (N'D01', N'东方礼', N'D001', N'男', CAST(0x00007A4700000000 AS DateTime), CAST(0x00009BC300000000 AS DateTime), N'1872635495', 8000.0000, NULL)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Employee] ([employee_id], [employee_name], [department_id], [sex], [birth_date], [hire_date], [telephone], [wages], [address]) VALUES (N'D02', N'胡军', N'D001', N'男', CAST(0x00008A4600000000 AS DateTime), CAST(0x0000A5FE00000000 AS DateTime), N'1768923564', 6000.0000, N'广从南路111号')
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Employee] ([employee_id], [employee_name], [department_id], [sex], [birth_date], [hire_date], [telephone], [wages], [address]) VALUES (N'D03', N'谢丽欣', N'D001', N'女', CAST(0x0000888100000000 AS DateTime), CAST(0x0000A47500000000 AS DateTime), N'17923202245', 6000.0000, N'情侣路')
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Employee] ([employee_id], [employee_name], [department_id], [sex], [birth_date], [hire_date], [telephone], [wages], [address]) VALUES (N'D03', N'谢丽欣', N'D001', N'女', CAST(0x0000888100000000 AS DateTime), CAST(0x0000A47500000000 AS DateTime), N'1792320245', 6000.0000, N'情侣路')
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Employee] ([employee_id], [employee_name], [department_id], [sex], [birth_date], [hire_date], [telephone], [wages], [address]) VALUES (N'D04', N'王莲', N'D001', N'女', CAST(0x00008AB100000000 AS DateTime), CAST(0x0000A8BC00000000 AS DateTime), N'1782563894', 5000.0000, NULL)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Employee] ([employee_id], [employee_name], [department_id], [sex], [birth_date], [hire_date], [telephone], [wages], [address]) VALUES (N'D05', N'吴晶晶', N'D001', N'女', CAST(0x0000906B00000000 AS DateTime), CAST(0x0000AE9000000000 AS DateTime), N'1782364581', 4000.0000, N'科技二路')
;-- -. . -..- - / . -. - .-. -.--
select *from Employee
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Customers] ([customer_id], [company], [contacts], [address], [telephone], [email]) VALUES (N'1000', N'广软饭堂', N'何小刚', N'广从南路', N'030-276876', NULL)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Customers] ([customers_id], [company], [contacts], [address], [telephone], [email]) VALUES (N'1001', N'电子厂饭堂', N'何小红', N'电子南路', N'040-267154', NULL)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Customers] ([customers_id], [company], [contacts], [address], [telephone], [email]) VALUES (N'1002', N'大众超市', N'汤小明', N'爱情北路', N'050-783651', N'126378@qq.com')
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Customers] ([customers_id], [company], [contacts], [address], [telephone], [email]) VALUES (N'1003', N'得一超市', N'伍家辉', N'紫荆路', N'060-257461', NULL)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Customers] ([customers_id], [company], [contacts], [address], [telephone], [email]) VALUES (N'1004', N'何氏档口', N'吴佳慧', N'无名路', N'070-567438', N'273645@qq.com.')
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Customers] ([customers_id], [company], [contacts], [address], [telephone], [email]) VALUES (N'1005', N'蔬菜超市', N'顾小华', N'黄杨南路', N'020-278365', N'267356312@qq.com')
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Customers] ([customers_id], [company], [contacts], [address], [telephone], [email]) VALUES (N'1006', N'鱼类加工厂', N'钱小强', N'黄杨北路', N'030-276386', NULL)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Customers] ([customers_id], [company], [contacts], [address], [telephone], [email]) VALUES (N'1007', N'串串火锅', N'吴晓华', N'南门路', N'020-457816', N'2178364@qq.com')
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Customers] ([customers_id], [company], [contacts], [address], [telephone], [email]) VALUES (N'1008', N'喜顺烤肉', N'陈晓明', N'华夏路', N'050-328763', NULL)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Customers] ([customers_id], [company], [contacts], [address], [telephone], [email]) VALUES (N'1000', N'广软饭堂', N'何小刚', N'广从南路', N'030-276876', NULL)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Sell_order] ([order_id], [employee_id], [goods_id], [customer_id], [discount], [kg], [order_date], [cost]) VALUES (N'A0001', N'B08', N's001', N'1000', 0.98, 50, CAST(0x0000AE4E00000000 AS DateTime), NULL)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Sell_order] ([order_id], [employee_id], [goods_id], [customers_id], [discount], [kg], [order_date], [cost]) VALUES (N'A0001', N'B08', N's001', N'1000', 0.98, 50, CAST(0x0000AE4E00000000 AS DateTime), NULL)
;-- -. . -..- - / . -. - .-. -.--
select *from Customers
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Goods] ([goods_name], [goods_id], [classifcation_id], [supplier_id], [storehouse_id], [unit_price], [stock_quantiy], [order_quantiy]) VALUES (N'苹果', N'g001', N'04', N'a0005', N'v02', 9.0000, 300, 15)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Goods] ([goods_name], [goods_id], [Classifcation_id], [supplier_id], [storehouse_id], [unit_price], [stock_quantiy], [Order_quantity]) VALUES (N'苹果', N'g001', N'04', N'a0005', N'v02', 9.0000, 300, 15)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Goods] ([goods_name], [goods_id], [Classifcation_id], [supplier_id], [storehouse_id], [unit_price], [stock_quantiy], [Order_quantity]) VALUES (N'小龙虾', N'g001', N'04', N'a0005', N'v02', 9.0000, 300, 15)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Goods] ([goods_name], [goods_id], [Classification_id], [supplier_id], [storehouse_id], [unit_price], [stock_quantiy], [Order_quantity]) VALUES (N'小龙虾', N'g001', N'04', N'a0005', N'v02', 9.0000, 300, 15)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Goods] ([goods_name], [goods_id], [Classification_id], [supplier_id], [storehouse_id], [unit_price], [Stock_quantity], [Order_quantity]) VALUES (N'小龙虾', N'g001', N'04', 'a0005', N'v02', 9.0000, 300, 15)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Goods] ([goods_name], [goods_id], [classifcation_id], [supplier_id], [storehouse_id], [unit_price], [stock_quantiy], [order_quantiy]) VALUES (N'桃花虾', N'g008', N'04', N'a0005', N'v02', 6.0000, 200, 12)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Goods] ([goods_name], [goods_id], [Classifcation_id], [Supplier_id], [storehouse_id], [unit_price], [stock_quantiy], [order_quantiy]) VALUES (N'桃花虾', N'g008', N'04', N'a0005', N'v02', 6.0000, 200, 12)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Goods] ([goods_name], [goods_id], [Classifcation_id], [Supplier_id], [storehouse_id], [unit_price], [Stock_quantiy], [Order_quantiy]) VALUES (N'桃花虾', N'g008', N'04', N'a0005', N'v02', 6.0000, 200, 12)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Goods] ([goods_name], [goods_id], [Classification_id], [supplier_id], [storehouse_id], [unit_price], [Stock_quantity], [Order_quantity]) VALUES (N'小龙虾', N'g001', N'04', N'a0005', N'v02', 9.0000, 300, 15)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Goods] ([goods_name], [goods_id], [Classification_id], [Supplier_id], [storehouse_id], [unit_price], [Stock_quantity], [Order_quantity]) VALUES (N'小龙虾', N'g001', N'04', N'a0005', N'v02', 9.0000, 300, 15)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Goods] ([goods_name], [goods_id], [Classification_id], [Supplier_id], [storehouse_id], [unit_price], [Stock_quantity], [Order_quantity]) VALUES (N'小龙虾', N'g001', N'04', N'a0001', N'v02', 9.0000, 300, 15)
;-- -. . -..- - / . -. - .-. -.--
select * from Supplier
;-- -. . -..- - / . -. - .-. -.--
insert into Goods (Goods_name,Goods_id,  Classification_id, Storehouse_id, Supplier_id, Unit_price, Stock_quantity, Order_quantity) values (N'苹果', N'g001', N'04', N'a0005', N'v02', 9.0000, 300, 15)
;-- -. . -..- - / . -. - .-. -.--
select * from Storehouse
;-- -. . -..- - / . -. - .-. -.--
insert into Goods (Goods_name,Goods_id,  Classification_id, Storehouse_id, Supplier_id, Unit_price, Stock_quantity, Order_quantity) values (N'苹果', N'g001', N'04',  N'v02',N'a0005', 9.0000, 300, 15)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Supplier] ([supplier_id], [supplier_name], [director], [telephone]) VALUES (N'a0010', N'小渔场', N'小帅', N'080-2238718')
;-- -. . -..- - / . -. - .-. -.--
insert into Goods (Goods_name,Goods_id,  Classification_id, Storehouse_id, Supplier_id, Unit_price, Stock_quantity, Order_quantity) values (N'苹果', N'g001', N'04',  N'v02',N'a0010', 9.0000, 300, 15)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Sell_order] ([order_id], [employee_id], [goods_id], [customers_id], [discount], [kg], [order_date], [cost],Order_num) VALUES (N'A0001', N'B08', N's001', N'1000', 0.98, 50, CAST(0x0000AE4E00000000 AS DateTime), NULL,10)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[user] ([usename], [pwd], [keys]) VALUES (N'lisa', N'7777', 7)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[user] ([username], [pwd], [keys]) VALUES (N'lisa', N'7777', 7)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[user] ([username], [pwd], [keys]) VALUES (N'lu', N'8888', 8)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[user] ([username], [pwd], [keys]) VALUES (N'yang', N'8888', 8)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[user] ([username], [pwd], [keys]) VALUES (N'sam', N'3333', 3)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[user] ([username], [pwd], [keys]) VALUES (N'sha', N'123456', 5)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[user] ([username], [pwd], [keys]) VALUES (N'sum', NULL, 9)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[user] ([username], [pwd], [keys]) VALUES (N'tinna', N'4444', 4)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[user] ([username], [pwd], [keys]) VALUES (N'tom', N'1111', 1)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[user] ([username], [pwd], [keys]) VALUES (N'tony', N'2122', 2)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[user] ([username], [pwd], [keys]) VALUES (N'users', N'6666', 6)
;-- -. . -..- - / . -. - .-. -.--
insert into Goods (Goods_name,Goods_id,  Classification_id, Storehouse_id, Supplier_id, Unit_price, Stock_quantity, Order_quantity) values (N'小虾', N'g001', N'04',  N'v02',N'a0010', 9.0000, 300, 15)
;-- -. . -..- - / . -. - .-. -.--
select *from Goods
;-- -. . -..- - / . -. - .-. -.--
insert into Goods (Goods_name,Goods_id,  Classification_id, Storehouse_id, Supplier_id, Unit_price, Stock_quantity, Order_quantity) values
                                        (N'小虾', N'g001', N'04',  N'v02',N'a0010', 9.0000, 300, 15)
;-- -. . -..- - / . -. - .-. -.--
insert into Goods (Goods_name,Goods_id,  Classification_id, Storehouse_id, Supplier_id, Unit_price, Stock_quantity, Order_quantity) values
                                        ('小虾', 'g001', '04',  'v02','a0010', 9.0000, 300, 15)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Goods] ([goods_name], [goods_id], [Classifcation_id], [supplier_id], [storehouse_id], [unit_price], [stock_quantiy], [order_quantiy]) VALUES (N'龙虾', N'g008', N'04', N'a0005', N'v02', 6.0000, 200, 12)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Goods] ([goods_name], [goods_id], [Classification_id], [supplier_id], [storehouse_id], [unit_price], [Stock_quantity], [Order_quantity])
VALUES (N'龙虾', N'g008', N'04', N'a0005', N'v02', 6.0000, 200, 12)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Goods] ([goods_name], [goods_id], [Classification_id], [supplier_id], [storehouse_id], [unit_price], [Stock_quantity], [Order_quantity])
VALUES (N'先生鱼肉', N'g015', N'04', N'a0005', N'v02', 22.0000, 300, 10)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Goods] ([goods_name], [goods_id], [Classification_id], [supplier_id], [storehouse_id], [unit_price], [Stock_quantity], [Order_quantity])
VALUES (N'多宝鱼', N'm001', N'03', N'a0001', N'v05', 3.0000, 1000, 20)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Goods] ([goods_name], [goods_id], [Classification_id], [supplier_id], [storehouse_id], [unit_price], [Stock_quantity], [Order_quantity])
VALUES (N'八爪鱼', N'm002', N'03', N'a0002', N'v04', 5.0000, 1000, 15)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Goods] ([goods_name], [goods_id], [Classification_id], [supplier_id], [storehouse_id], [unit_price], [Stock_quantity], [Order_quantity])
VALUES (N'小姐鱼', N'm003', N'03', N'a0001', N'v04', 10.0000, 500, 20)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Goods] ([goods_name], [goods_id], [Classification_id], [supplier_id], [storehouse_id], [unit_price], [Stock_quantity], [Order_quantity])
VALUES (N'赤贝', N'q001', N'02', N'a0003', N'v03', 2.5000, 500, 10)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Goods] ([goods_name], [goods_id], [Classification_id], [supplier_id], [storehouse_id], [unit_price], [Stock_quantity], [Order_quantity])
VALUES (N'虾仁', N'q002', N'02', N'a0006', N'v03', 3.0000, 500, 11)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Goods] ([goods_name], [goods_id], [Classification_id], [supplier_id], [storehouse_id], [unit_price], [Stock_quantity], [Order_quantity])
VALUES (N'鱼肠', N'q010', N'02', N'a0006', N'v03', 15.0000, 300, 6)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Goods] ([goods_name], [goods_id], [Classification_id], [supplier_id], [storehouse_id], [unit_price], [Stock_quantity], [Order_quantity])
VALUES (N'鱼肚', N'q011', N'02', N'a0006', N'v03', 20.0000, 300, 8)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Goods] ([goods_name], [goods_id], [Classification_id], [supplier_id], [storehouse_id], [unit_price], [Stock_quantity], [Order_quantity])
VALUES (N'先生鱼', N's001', N'01', N'a0001', N'v01', 2.0000, 100, 3)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Goods] ([goods_name], [goods_id], [Classification_id], [supplier_id], [storehouse_id], [unit_price], [Stock_quantity], [Order_quantity])
VALUES (N'甲鱼', N's012', N'01', N'a0008', N'v01', 3.0000, 200, 4)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Goods] ([goods_name], [goods_id], [Classification_id], [supplier_id], [storehouse_id], [unit_price], [Stock_quantity], [Order_quantity])
VALUES (N'海鲁鱼', N's020', N'01', N'a0004', N'v01', 4.0000, 400, 8)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Goods] ([goods_name], [goods_id], [Classification_id], [supplier_id], [storehouse_id], [unit_price], [Stock_quantity], [Order_quantity])
VALUES (N'鲶鱼', N's021', N'01', N'a0004', N'v01', 5.0000, 400, 7)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Goods] ([goods_name], [goods_id], [Classification_id], [supplier_id], [storehouse_id], [unit_price], [Stock_quantity], [Order_quantity])
VALUES (N'扇贝肉', N'y009', N'05', N'a0006', N'v03', 17.0000, 50, 12)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Goods] ([goods_name], [goods_id], [Classification_id], [supplier_id], [storehouse_id], [unit_price], [Stock_quantity], [Order_quantity])
VALUES (N'刀子鱼', N'y011', N'05', N'a0002', N'v06', 25.0000, 100, 7)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Goods] ([goods_name], [goods_id], [Classification_id], [supplier_id], [storehouse_id], [unit_price], [Stock_quantity], [Order_quantity])
VALUES (N'功夫菜', N'y034', N'05', N'a0002', N'v06', 30.0000, 80, 10)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Goods] ([goods_name], [goods_id], [Classification_id], [supplier_id], [storehouse_id], [unit_price], [Stock_quantity], [Order_quantity])
VALUES (N'发菜', N'y035', N'09', N'a0002', N'v06', 26.0000, 100, 12)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Sell_order] ([order_id], [employee_id], [goods_id], [customers_id], [discount], [kg], [order_date], [cost],Order_num)
VALUES (N'A0001', N'B08', N's001', N'1000', 0.98, 50, CAST(0x0000AE4E00000000 AS DateTime), NULL,10)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Sell_order] ([order_id], [employee_id], [goods_id], [customers_id], [discount], [kg], [order_date], [cost]) VALUES (N'A0002', N'B08', N's020', N'1000', 0.95, 30, CAST(0x0000AE4E00000000 AS DateTime), NULL,10)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Sell_order] ([order_id], [employee_id], [goods_id], [customers_id], [discount], [kg], [order_date], [cost],Order_num)
VALUES (N'A0002', N'B08', N's020', N'1000', 0.95, 30, CAST(0x0000AE4E00000000 AS DateTime), NULL,10)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Sell_order] ([order_id], [employee_id], [goods_id], [customers_id], [discount], [kg], [order_date], [cost]) VALUES (N'A0003', N'B08', N'q001', N'1000', 0.98, 40, CAST(0x0000AE4E00000000 AS DateTime), NULL)
;-- -. . -..- - / . -. - .-. -.--
select *from Sell_order
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Sell_order] ([order_id], [employee_id], [goods_id], [customers_id], [discount], [kg], [order_date], [cost],Order_num) VALUES (N'A0003', N'B08', N'q001', N'1000', 0.98, 40, CAST(0x0000AE4E00000000 AS DateTime), NULL,25)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Sell_order] ([order_id], [employee_id], [goods_id], [customers_id], [discount], [kg], [order_date], [cost],Order_num) VALUES (N'A0004', N'B03', N's021', N'1001', 0.98, 60, CAST(0x0000AE6C00000000 AS DateTime), NULL,15)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Sell_order] ([order_id], [employee_id], [goods_id], [customers_id], [discount], [kg], [order_date], [cost],Order_num) VALUES (N'A0005', N'B04', N'y035', N'1001', 0.95, 70, CAST(0x0000AE6C00000000 AS DateTime), NULL,60)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Sell_order] ([order_id], [employee_id], [goods_id], [customers_id], [discount], [kg], [order_date], [cost],Order_num) VALUES (N'A0006', N'B05', N'y009', N'1002', 0.9, 50, CAST(0x0000AE8D00000000 AS DateTime), NULL,66)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Sell_order] ([order_id], [employee_id], [goods_id], [customers_id], [discount], [kg], [order_date], [cost],Order_num) VALUES (N'A0007', N'B02', N'q002', N'1002', 0.95, 100, CAST(0x0000AE9A00000000 AS DateTime), NULL,99)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Sell_order] ([order_id], [employee_id], [goods_id], [customers_id], [discount], [kg], [order_date], [cost],Order_num) VALUES (N'A0008', N'B06', N'q011', N'1003', 0.9, 100, CAST(0x0000AEEC00000000 AS DateTime), NULL,69)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Sell_order] ([order_id], [employee_id], [goods_id], [customers_id], [discount], [kg], [order_date], [cost],Order_num) VALUES (N'A0009', N'B07', N'q010', N'1003', 0.94, 100, CAST(0x0000AEEC00000000 AS DateTime), NULL,88)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Sell_order] ([order_id], [employee_id], [goods_id], [customers_id], [discount], [kg], [order_date], [cost],Order_num) VALUES (N'A0010', N'B03', N'q010', N'1004', 0.94, 100, CAST(0x0000AF2200000000 AS DateTime), NULL,22)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Sell_order] ([order_id], [employee_id], [goods_id], [customers_id], [discount], [kg], [order_date], [cost],Order_num) VALUES (N'A0011', N'B01', N'y034', N'1004', 0.95, 80, CAST(0x0000AE8900000000 AS DateTime), NULL,33)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Sell_order] ([order_id], [employee_id], [goods_id], [customers_id], [discount], [kg], [order_date], [cost],Order_num) VALUES (N'A0012', N'B04', N'm001', N'1005', 0.9, 500, CAST(0x0000AE1200000000 AS DateTime), NULL,9)
;-- -. . -..- - / . -. - .-. -.--
INSERT [dbo].[Sell_order] ([order_id], [employee_id], [goods_id], [customers_id], [discount], [kg], [order_date], [cost],Order_num) VALUES (N'A0013', N'B05', N's020', N'1005', 0.95, 100, CAST(0x0000AE6A00000000 AS DateTime), NULL,6)
;-- -. . -..- - / . -. - .-. -.--
select * from [User]