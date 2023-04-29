create proc proc_course
(@cname nvarchar(20),
@avgscore decimal(3,1) output )
as
select @avgscore=avg(sc.score)
from course join sc on course.cno=sc.cno
where course.cno=@cname;

declare @avgscore decimal(3,1)
exec  proc_course '数据库原理与应用',@avgscore output
select @avgscore 平均成绩