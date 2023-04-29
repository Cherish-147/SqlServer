create database BookStore;---重做remake

use BookStore;

create table 管理员
(
用户名 Char(10)	primary key NOT NULL ,
性别	char(2)	Not null,
口令	nchar(20)	Not Null
);

create table 图书类型
(--ISBN char(10) not null ,
图书类别 char(20) primary key ,
借阅期限 char(10) not null
);



create table 部门
(
部门名 char(20) not null unique,
部门号 char(4) primary key not null,
联系电话 Nchar(11) not null,
负责人  char(10) not null,
);

create table 教师
(
 教工号 char(20) primary key ,
 教师姓名 char(10) not null,
 性别 Nchar(2) not null,
 部门号 char(4) foreign key references 部门,
 职位 char(20) not null,
 邮件地址 char(20) not null unique
)


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
);

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

);

create table 催还书登记
(
ISBN	Char(20)	foreign key references 图书,
教工号	char(20)	foreign key references 教师,
办理人	Char(10)	Not Null,
催还日期 datetime	Not Null,
借书时间	Date	Not Null
);

select *from 图书类型;
insert 图书类型(图书类别, 借阅期限)
values('教学参考书',100),
('文学作品',80),
('学术期刊',200),
('学术专著',50)


insert  图书()
values
( 'A001','全品参考书','吴语', '教学参考书', '在库', 5 ),
('B001','活着','余华','文学作品','借出',20),
('C001','青少年体育','林斌','学术期刊','在库',4),
('D001','概率论沉思录',' Jaynes','学术专著','借出',50),
( 'B002','西游记','吴承恩', '文学作品', '在库', 20)

insert 部门
values('基础部','A01','001-243667','钱达理'),
('网络技术系','B01','002-463433','李丽'),
('思政部','C01','003-642789','吴尊'),
('学术部','D01','001-243667','杨建民')

insert 教师(教工号,教师姓名,性别,部门号, 职位 ,邮件地址 )
values(
'A1010','张三','男','A01','教师','145674@qq.com'),
('C1000','李四','男','C01','副主任','347829@qq.com'),
('D1002','萧红','女','D01','主任','1938274@qq.com')

insert 借书登记
values
('C1000','B001','活着','李四','2022-9-14','洁'),
('D1002', 'D001','概率论沉思录','萧红','2022-8-9','洁'),
('A1010','D001','概率论沉思录','张三','2022-1-8','洁')

update 图书
set 作者='汤华翔'
where ISBN ='D001'

update 图书
set 图书状态='借出'
where ISBN ='B002'

insert 借书登记
values('A1010','B002','西游记','张三','2022-10-4','洁')

insert 还书登记
values ('A1010','B002','西游记','张三','2022-11-29','洁')

select distinct *
from  教师 a join 借书登记 b on  a.教工号=b.教工号
             join 还书登记 c on  a.教工号=c.教工号

where a.教工号='A1010'


select a.教工号,a.教师姓名,a.部门号,b.图书名,b.借书时间,c.还书时间
from  教师 a join 借书登记 b on  a.教工号=b.教工号
             join 还书登记 c on  a.教工号=c.教工号
go

create view 借出图书(ISBN,图书名,图书类别)
as
select a.ISBN,a.图书名,b.图书类别
from 借书登记 a join 图书 b on a.ISBN=b.ISBN
go

create view 借阅逾期(ISBN,图书名,教工号,姓名,天数)
as
select a.ISBN,a.图书名,教工号,b.借书人,datediff(day,b.借书时间,getdate()) 天数
from 图书 a join 借书登记 b on a.ISBN=b.ISBN
     join 图书类型 c on a.图书类别=c.图书类别
where datediff(day,b.借书时间,getdate())>=c.借阅期限

go

create view 图书分类统计册数(图书类别,册数)
as
select 图书类别,count(图书类别) 册数
from 图书
group by 图书类别
-- use teaching1
-- drop database BookStore;