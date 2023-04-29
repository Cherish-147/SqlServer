create proc proc_course
(@cname nvarchar(20),
@avgscore decimal(3,1) output )
as
select @avgscore=avg(sc.score)
from course join sc on course.cno=sc.cno
where course.cno=@cname

