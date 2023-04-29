create user 'itcast0'@'localhost' identified by '123456';
create user 'itheima0'@'%' identified by '123456';
alter user 'itheima0'@'%' identified with mysql_native_password by'1234';
drop user 'itcast0'@'localhost';

select * from mysql.user;

show  grants for 'itheima0'@'%';

grant all on itheima0.* to 'itheima0'@'%';
grant all on itcast.* to 'itheima0'@'%';
-- 'mysql -u itheima0 -p
 --    密码：1234

show databases ;


revoke all on itcast.* from 'itheima0'@'%';
revoke all on itheima0.* from 'itheima0'@'%';