create database schema;
show databases ;
create table tb_user(
id int comment '编号',
name varchar(50) comment '姓名',
age int comment '年龄',
gender varchar(1) comment '性别'
) comment '用户表';
use schema;
show databases ;
use 'schema';