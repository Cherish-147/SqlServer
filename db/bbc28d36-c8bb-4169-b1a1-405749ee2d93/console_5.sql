USE [海产品管理系统]
GO
INSERT Category ([classifcation_id], [classifcation_name]) VALUES (N'01', N'活鲜鱼类')
GO
INSERT [dbo].Category ([classifcation_id], [classifcation_name]) VALUES (N'02', N'冰鲜鱼类')
GO
INSERT [dbo].Category ([classifcation_id], [classifcation_name]) VALUES (N'03', N'活鲜贝类')
GO
INSERT [dbo].Category ([classifcation_id], [classifcation_name]) VALUES (N'04', N'虾类')
GO
INSERT [dbo].Category ([classifcation_id], [classifcation_name]) VALUES (N'05', N'冰鲜肉类')
GO
INSERT [dbo].Category ([classifcation_id], [classifcation_name]) VALUES (N'06', N'活鲜贝类')
GO
INSERT [dbo].Category ([classifcation_id], [classifcation_name]) VALUES (N'07', N'虾类')
GO
INSERT [dbo].Category ([classifcation_id], [classifcation_name]) VALUES (N'08', N'蟹类')
GO
INSERT [dbo].Category ([classifcation_id], [classifcation_name]) VALUES (N'09', N'藻类')
GO
select * from Category

INSERT [dbo].Supplier ([supplier_id], [supplier_name], [director], [telephone]) VALUES (N'a0001', N'北海道渔场', N'小王', N'020-126789')
GO
INSERT [dbo].Supplier ([supplier_id], [supplier_name], [director], [telephone]) VALUES (N'a0002', N'纽芬兰渔场', N'小海', N'020-761921')
GO
INSERT [dbo].[Supplier] ([supplier_id], [supplier_name], [director], [telephone]) VALUES (N'a0003', N'叶某鱼场', N'小叶', N'010-263764')
GO
INSERT [dbo].[Supplier] ([supplier_id], [supplier_name], [director], [telephone]) VALUES (N'a0004', N'北海渔场', N'小汤', N'020-278376')
GO
INSERT [dbo].[Supplier] ([supplier_id], [supplier_name], [director], [telephone]) VALUES (N'a0005', N'秘鲁渔场', N'小陈', N'050-278374')
GO
INSERT [dbo].[Supplier] ([supplier_id], [supplier_name], [director], [telephone]) VALUES (N'a0006', N'舟山渔场', N'小杨', N'080-238718')
GO
INSERT [dbo].[Supplier] ([supplier_id], [supplier_name], [director], [telephone]) VALUES (N'a0007', N'黄渤海渔场', N'小思', N'080-238718')
GO
INSERT [dbo].[Supplier] ([supplier_id], [supplier_name], [director], [telephone]) VALUES (N'a0008', N'南部沿海渔场', N'小陆', N'080-238718')
GO
INSERT [dbo].[Supplier] ([supplier_id], [supplier_name], [director], [telephone]) VALUES (N'a0009', N'北部湾渔场', N'小美', N'080-238718')
GO
INSERT [dbo].[Supplier] ([supplier_id], [supplier_name], [director], [telephone]) VALUES (N'a0010', N'小渔场', N'小帅', N'080-2238718')
GO

select * from Supplier;

INSERT [dbo].Storehouse ([storehouse_id], [director], [telephone], [area]) VALUES (N'v01', N'小红', N'020-367162', 200)
GO
INSERT [dbo].Storehouse ([storehouse_id], [director], [telephone], [area]) VALUES (N'v02', N'小白', N'020-367816', 220)
GO
INSERT [dbo].Storehouse ([storehouse_id], [director], [telephone], [area]) VALUES (N'v03', N'小黄', N'020-478365', 400)
GO
INSERT [dbo].Storehouse ([storehouse_id], [director], [telephone], [area]) VALUES (N'v04', N'小黑子', N'020-472675', 350)
GO
INSERT [dbo].Storehouse ([storehouse_id], [director], [telephone], [area]) VALUES (N'v05', N'小坤', N'020-378265', 400)
GO
INSERT [dbo].Storehouse ([storehouse_id], [director], [telephone], [area]) VALUES (N'v06', N'小美', N'020-367514', 500)
GO


select *from Goods
select * from Supplier
select * from Storehouse

insert into Goods (Goods_name,Goods_id,  Classification_id, Storehouse_id, Supplier_id, Unit_price, Stock_quantity, Order_quantity) values
(N'小虾', 'g001', '04', 'v02', 'a0004', 9.0000, 300, 15)

INSERT [dbo].[Goods] ([goods_name], [goods_id], [Classification_id], [supplier_id], [storehouse_id], [unit_price], [Stock_quantity], [Order_quantity])
VALUES (N'龙虾', N'g008', N'04', N'a0004', N'v02', 6.0000, 200, 12)
GO

INSERT [dbo].[Goods] ([goods_name], [goods_id], [Classification_id], [supplier_id], [storehouse_id], [unit_price], [Stock_quantity], [Order_quantity])
VALUES (N'先生鱼肉', N'g015', N'04', N'a0005', N'v02', 22.0000, 300, 10)
GO

INSERT [dbo].[Goods] ([goods_name], [goods_id], [Classification_id], [supplier_id], [storehouse_id], [unit_price], [Stock_quantity], [Order_quantity])
VALUES (N'多宝鱼', N'm001', N'03', N'a0001', N'v05', 3.0000, 1000, 20)
GO
INSERT [dbo].[Goods] ([goods_name], [goods_id], [Classification_id], [supplier_id], [storehouse_id], [unit_price], [Stock_quantity], [Order_quantity])
VALUES (N'八爪鱼', N'm002', N'03', N'a0002', N'v04', 5.0000, 1000, 15)
GO
INSERT [dbo].[Goods] ([goods_name], [goods_id], [Classification_id], [supplier_id], [storehouse_id], [unit_price], [Stock_quantity], [Order_quantity])
VALUES (N'小姐鱼', N'm003', N'03', N'a0001', N'v04', 10.0000, 500, 20)
GO
INSERT [dbo].[Goods] ([goods_name], [goods_id], [Classification_id], [supplier_id], [storehouse_id], [unit_price], [Stock_quantity], [Order_quantity])
VALUES (N'赤贝', N'q001', N'02', N'a0003', N'v03', 2.5000, 500, 10)
GO
INSERT [dbo].[Goods] ([goods_name], [goods_id], [Classification_id], [supplier_id], [storehouse_id], [unit_price], [Stock_quantity], [Order_quantity])
VALUES (N'虾仁', N'q002', N'02', N'a0006', N'v03', 3.0000, 500, 11)
GO
INSERT [dbo].[Goods] ([goods_name], [goods_id], [Classification_id], [supplier_id], [storehouse_id], [unit_price], [Stock_quantity], [Order_quantity])
VALUES (N'鱼肠', N'q010', N'02', N'a0006', N'v03', 15.0000, 300, 6)
GO
INSERT [dbo].[Goods] ([goods_name], [goods_id], [Classification_id], [supplier_id], [storehouse_id], [unit_price], [Stock_quantity], [Order_quantity])
VALUES (N'鱼肚', N'q011', N'02', N'a0006', N'v03', 20.0000, 300, 8)
GO
INSERT [dbo].[Goods] ([goods_name], [goods_id], [Classification_id], [supplier_id], [storehouse_id], [unit_price], [Stock_quantity], [Order_quantity])
VALUES (N'先生鱼', N's001', N'01', N'a0001', N'v01', 2.0000, 100, 3)
GO
INSERT [dbo].[Goods] ([goods_name], [goods_id], [Classification_id], [supplier_id], [storehouse_id], [unit_price], [Stock_quantity], [Order_quantity])
VALUES (N'甲鱼', N's012', N'01', N'a0008', N'v01', 3.0000, 200, 4)
GO
INSERT [dbo].[Goods] ([goods_name], [goods_id], [Classification_id], [supplier_id], [storehouse_id], [unit_price], [Stock_quantity], [Order_quantity])
VALUES (N'海鲁鱼', N's020', N'01', N'a0004', N'v01', 4.0000, 400, 8)
GO
INSERT [dbo].[Goods] ([goods_name], [goods_id], [Classification_id], [supplier_id], [storehouse_id], [unit_price], [Stock_quantity], [Order_quantity])
VALUES (N'鲶鱼', N's021', N'01', N'a0004', N'v01', 5.0000, 400, 7)
GO
INSERT [dbo].[Goods] ([goods_name], [goods_id], [Classification_id], [supplier_id], [storehouse_id], [unit_price], [Stock_quantity], [Order_quantity])
VALUES (N'扇贝肉', N'y009', N'05', N'a0006', N'v03', 17.0000, 50, 12)
GO
INSERT [dbo].[Goods] ([goods_name], [goods_id], [Classification_id], [supplier_id], [storehouse_id], [unit_price], [Stock_quantity], [Order_quantity])
VALUES (N'刀子鱼', N'y011', N'05', N'a0002', N'v06', 25.0000, 100, 7)
GO
INSERT [dbo].[Goods] ([goods_name], [goods_id], [Classification_id], [supplier_id], [storehouse_id], [unit_price], [Stock_quantity], [Order_quantity])
VALUES (N'功夫菜', N'y034', N'05', N'a0002', N'v06', 30.0000, 80, 10)
GO
INSERT [dbo].[Goods] ([goods_name], [goods_id], [Classification_id], [supplier_id], [storehouse_id], [unit_price], [Stock_quantity], [Order_quantity])
VALUES (N'发菜', N'y035', N'09', N'a0002', N'v06', 26.0000, 100, 12)
GO
UPDATE 海产品管理系统.dbo.Goods
SET Goods_name = N'大海虾'
WHERE Goods_id LIKE N'g015' ESCAPE '#';
select *from Goods
---
INSERT [dbo].Department ([department_id], [department_name], [telephone], [manager]) VALUES (N'A001', N'管理部', N'17423863672', N'郑秀珍')
GO
INSERT [dbo].[Department] ([department_id], [department_name], [telephone], [manager]) VALUES (N'B001', N'销售部', N'17688182563', N'小翔')
GO
INSERT [dbo].[Department] ([department_id], [department_name], [telephone], [manager]) VALUES (N'C001', N'仓库部', N'19723746571', N'小海')
GO
INSERT [dbo].[Department] ([department_id], [department_name], [telephone], [manager]) VALUES (N'D001', N'采购部', N'18726354975', N'小东')
GO
INSERT [dbo].[Department] ([department_id], [department_name], [telephone], [manager]) VALUES (N'E001', N'市场部', N'13417923202', N'小陈')
GO
INSERT [dbo].[Department] ([department_id], [department_name], [telephone], [manager]) VALUES (N'F001', N'人力资源部', N'17818190820', N'小仕')
GO
INSERT [dbo].[Department] ([department_id], [department_name], [telephone], [manager]) VALUES (N'G001', N'秘书部', N'12637845693', N'小森')
GO
INSERT [dbo].[Department] ([department_id], [department_name], [telephone], [manager]) VALUES (N'H001', N'后勤部', N'1273648924', N'小华')
select *from Department
INSERT [dbo].[Employee] ([employee_id], [employee_name], [department_id], [sex], [Birth_date], [Hire_date], [telephone], [wages], [address]) VALUES (N'A01', N'熊大', N'A001', N'男', CAST(0x00007DB300000000 AS DateTime), CAST(0x00009C4000000000 AS DateTime), N'1732856863', 7000.0000, N'广从南路')
GO
INSERT [dbo].Employee ([employee_id], [employee_name], [department_id], [sex], [Birth_date], [Hire_date], [telephone], [wages], [address]) VALUES (N'A02', N'高启强', N'A001', N'男', CAST(0x00007C6100000000 AS DateTime), CAST(0x00009D7000000000 AS DateTime), N'1782297538', 6000.0000, N'东风六路')
GO
INSERT [dbo].employee ([employee_id], [employee_name], [department_id], [sex], [Birth_date], [Hire_date], [telephone], [wages], [address]) VALUES (N'A03', N'郑秀珍', N'A001', N'女', CAST(0x000072C100000000 AS DateTime), CAST(0x00009C0300000000 AS DateTime), N'1742386367', 8000.0000, N'建设路')
GO
INSERT [dbo].[Employee] ([employee_id], [employee_name], [department_id], [sex], [birth_date], [hire_date], [telephone], [wages], [address]) VALUES (N'B01', N'小翔', N'B001', N'男', CAST(0x0000813E00000000 AS DateTime), CAST(0x00009EA200000000 AS DateTime), N'1768818256', 9000.0000, N'北京路')
GO
INSERT [dbo].[Employee] ([employee_id], [employee_name], [department_id], [sex], [birth_date], [hire_date], [telephone], [wages], [address]) VALUES (N'B02', N'赵晓薇', N'B001', N'女', CAST(0x000086D900000000 AS DateTime), CAST(0x0000A97100000000 AS DateTime), N'1782390512', 5000.0000, N'南京路')
GO
INSERT [dbo].[Employee] ([employee_id], [employee_name], [department_id], [sex], [birth_date], [hire_date], [telephone], [wages], [address]) VALUES (N'B03', N'陆某', N'B001', N'男', CAST(0x000087CC00000000 AS DateTime), CAST(0x0000AB9600000000 AS DateTime), N'1782934927', 3000.0000, N'集体宿舍')
GO
INSERT [dbo].[Employee] ([employee_id], [employee_name], [department_id], [sex], [birth_date], [hire_date], [telephone], [wages], [address]) VALUES (N'B04', N'黄海海', N'B001', N'男', CAST(0x0000810F00000000 AS DateTime), CAST(0x0000A89C00000000 AS DateTime), N'1234567905', 4000.0000, N'爱情路')
GO
INSERT [dbo].[Employee] ([employee_id], [employee_name], [department_id], [sex], [birth_date], [hire_date], [telephone], [wages], [address]) VALUES (N'B05', N'李白', N'B001', N'男', CAST(0x000084DC00000000 AS DateTime), CAST(0x0000A44200000000 AS DateTime), N'1987654318', 5000.0000, N'科技一路')
GO
INSERT [dbo].[Employee] ([employee_id], [employee_name], [department_id], [sex], [birth_date], [hire_date], [telephone], [wages], [address]) VALUES (N'B06', N'刘备', N'B001', N'男', CAST(0x0000878C00000000 AS DateTime), CAST(0x0000A98D00000000 AS DateTime), N'1546892467', 5000.0000, N'科技二路')
GO
INSERT [dbo].[Employee] ([employee_id], [employee_name], [department_id], [sex], [birth_date], [hire_date], [telephone], [wages], [address]) VALUES (N'B07', N'嫦娥', N'B001', N'女', CAST(0x0000876300000000 AS DateTime), CAST(0x0000AB1E00000000 AS DateTime), N'1346702754', 4000.0000, N'集体宿舍')
GO
INSERT [dbo].[Employee] ([employee_id], [employee_name], [department_id], [sex], [birth_date], [hire_date], [telephone], [wages], [address]) VALUES (N'B08', N'萧小红', N'B001', N'女', CAST(0x0000849700000000 AS DateTime), CAST(0x0000A2E400000000 AS DateTime), N'1782461913', 6000.0000, N'前进路')
GO
INSERT [dbo].[Employee] ([employee_id], [employee_name], [department_id], [sex], [birth_date], [hire_date], [telephone], [wages], [address]) VALUES (N'C01', N'丽丽', N'C001', N'女', CAST(0x00008A6600000000 AS DateTime), CAST(0x0000AB5A00000000 AS DateTime),   N'1276351896', 3000.0000, N'集体宿舍')
GO
INSERT [dbo].[Employee] ([employee_id], [employee_name], [department_id], [sex], [birth_date], [hire_date], [telephone], [wages], [address]) VALUES (N'C02', N'安心', N'C001', N'男', CAST(0x00007F3A00000000 AS DateTime), CAST(0x00009D2C00000000 AS DateTime), N'1972374671', 8000.0000, NULL)
GO
INSERT [dbo].[Employee] ([employee_id], [employee_name], [department_id], [sex], [birth_date], [hire_date], [telephone], [wages], [address]) VALUES (N'C03', N'唐滑翔', N'C001', N'男', CAST(0x0000896200000000 AS DateTime), CAST(0x0000A88000000000 AS DateTime), N'1287361836', 4000.0000, NULL)
GO
INSERT [dbo].[Employee] ([employee_id], [employee_name], [department_id], [sex], [birth_date], [hire_date], [telephone], [wages], [address]) VALUES (N'C04', N'安琪拉', N'C001', N'女', CAST(0x00008D6F00000000 AS DateTime), CAST(0x0000AA1500000000 AS DateTime), N'1786238921', 4000.0000, N'冲锋路')
GO
INSERT [dbo].[Employee] ([employee_id], [employee_name], [department_id], [sex], [birth_date], [hire_date], [telephone], [wages], [address]) VALUES (N'C05', N'白小川', N'C001', N'男', CAST(0x0000838100000000 AS DateTime), CAST(0x0000A74C00000000 AS DateTime), N'1782346712', 5000.0000, NULL)
GO
INSERT [dbo].[Employee] ([employee_id], [employee_name], [department_id], [sex], [birth_date], [hire_date], [telephone], [wages], [address]) VALUES (N'D01', N'东方礼', N'D001', N'男', CAST(0x00007A4700000000 AS DateTime), CAST(0x00009BC300000000 AS DateTime), N'1872635495', 8000.0000, NULL)
GO
INSERT [dbo].[Employee] ([employee_id], [employee_name], [department_id], [sex], [birth_date], [hire_date], [telephone], [wages], [address]) VALUES (N'D02', N'胡军', N'D001', N'男', CAST(0x00008A4600000000 AS DateTime), CAST(0x0000A5FE00000000 AS DateTime), N'1768923564', 6000.0000, N'广从南路111号')
GO
INSERT [dbo].[Employee] ([employee_id], [employee_name], [department_id], [sex], [birth_date], [hire_date], [telephone], [wages], [address]) VALUES (N'D03', N'谢丽欣', N'D001', N'女', CAST(0x0000888100000000 AS DateTime), CAST(0x0000A47500000000 AS DateTime), N'1792320245', 6000.0000, N'情侣路')
GO
INSERT [dbo].[Employee] ([employee_id], [employee_name], [department_id], [sex], [birth_date], [hire_date], [telephone], [wages], [address]) VALUES (N'D04', N'王莲', N'D001', N'女', CAST(0x00008AB100000000 AS DateTime), CAST(0x0000A8BC00000000 AS DateTime), N'1782563894', 5000.0000, NULL)
GO
INSERT [dbo].[Employee] ([employee_id], [employee_name], [department_id], [sex], [birth_date], [hire_date], [telephone], [wages], [address]) VALUES (N'D05', N'吴晶晶', N'D001', N'女', CAST(0x0000906B00000000 AS DateTime), CAST(0x0000AE9000000000 AS DateTime), N'1782364581', 4000.0000, N'科技二路')
GO
select *from Employee

INSERT [dbo].[Customers] ([customers_id], [company], [contacts], [address], [telephone], [email]) VALUES (N'1000', N'广软饭堂', N'何小刚', N'广从南路', N'030-276876', NULL)
GO
INSERT [dbo].[Customers] ([customers_id], [company], [contacts], [address], [telephone], [email]) VALUES (N'1001', N'电子厂饭堂', N'何小红', N'电子南路', N'040-267154', NULL)
GO
INSERT [dbo].[Customers] ([customers_id], [company], [contacts], [address], [telephone], [email]) VALUES (N'1002', N'大众超市', N'汤小明', N'爱情北路', N'050-783651', N'126378@qq.com')
GO
INSERT [dbo].[Customers] ([customers_id], [company], [contacts], [address], [telephone], [email]) VALUES (N'1003', N'得一超市', N'伍家辉', N'紫荆路', N'060-257461', NULL)
GO
INSERT [dbo].[Customers] ([customers_id], [company], [contacts], [address], [telephone], [email]) VALUES (N'1004', N'何氏档口', N'吴佳慧', N'无名路', N'070-567438', N'273645@qq.com.')
GO
INSERT [dbo].[Customers] ([customers_id], [company], [contacts], [address], [telephone], [email]) VALUES (N'1005', N'蔬菜超市', N'顾小华', N'黄杨南路', N'020-278365', N'267356312@qq.com')
GO
INSERT [dbo].[Customers] ([customers_id], [company], [contacts], [address], [telephone], [email]) VALUES (N'1006', N'鱼类加工厂', N'钱小强', N'黄杨北路', N'030-276386', NULL)
GO
INSERT [dbo].[Customers] ([customers_id], [company], [contacts], [address], [telephone], [email]) VALUES (N'1007', N'串串火锅', N'吴晓华', N'南门路', N'020-457816', N'2178364@qq.com')
GO
INSERT [dbo].[Customers] ([customers_id], [company], [contacts], [address], [telephone], [email]) VALUES (N'1008', N'喜顺烤肉', N'陈晓明', N'华夏路', N'050-328763', NULL)
GO
select *from Customers

INSERT [dbo].[Sell_order] ([order_id], [employee_id], [goods_id], [customers_id], [discount], [kg], [order_date], [cost],Order_num)
VALUES (N'A0001', N'B08', N's001', N'1000', 0.98, 50, CAST(0x0000AE4E00000000 AS DateTime), NULL,10)
GO
INSERT [dbo].[Sell_order] ([order_id], [employee_id], [goods_id], [customers_id], [discount], [kg], [order_date], [cost],Order_num)
VALUES (N'A0002', N'B08', N's020', N'1000', 0.95, 30, CAST(0x0000AE4E00000000 AS DateTime), NULL,10)
GO
INSERT [dbo].[Sell_order] ([order_id], [employee_id], [goods_id], [customers_id], [discount], [kg], [order_date], [cost],Order_num) VALUES (N'A0003', N'B08', N'q001', N'1000', 0.98, 40, CAST(0x0000AE4E00000000 AS DateTime), NULL,25)
GO
INSERT [dbo].[Sell_order] ([order_id], [employee_id], [goods_id], [customers_id], [discount], [kg], [order_date], [cost],Order_num) VALUES (N'A0004', N'B03', N's021', N'1001', 0.98, 60, CAST(0x0000AE6C00000000 AS DateTime), NULL,15)
GO
INSERT [dbo].[Sell_order] ([order_id], [employee_id], [goods_id], [customers_id], [discount], [kg], [order_date], [cost],Order_num) VALUES (N'A0005', N'B04', N'y035', N'1001', 0.95, 70, CAST(0x0000AE6C00000000 AS DateTime), NULL,60)
GO
INSERT [dbo].[Sell_order] ([order_id], [employee_id], [goods_id], [customers_id], [discount], [kg], [order_date], [cost],Order_num) VALUES (N'A0006', N'B05', N'y009', N'1002', 0.9, 50, CAST(0x0000AE8D00000000 AS DateTime), NULL,66)
GO
INSERT [dbo].[Sell_order] ([order_id], [employee_id], [goods_id], [customers_id], [discount], [kg], [order_date], [cost],Order_num) VALUES (N'A0007', N'B02', N'q002', N'1002', 0.95, 100, CAST(0x0000AE9A00000000 AS DateTime), NULL,99)
GO
INSERT [dbo].[Sell_order] ([order_id], [employee_id], [goods_id], [customers_id], [discount], [kg], [order_date], [cost],Order_num) VALUES (N'A0008', N'B06', N'q011', N'1003', 0.9, 100, CAST(0x0000AEEC00000000 AS DateTime), NULL,69)
GO
INSERT [dbo].[Sell_order] ([order_id], [employee_id], [goods_id], [customers_id], [discount], [kg], [order_date], [cost],Order_num) VALUES (N'A0009', N'B07', N'q010', N'1003', 0.94, 100, CAST(0x0000AEEC00000000 AS DateTime), NULL,88)
GO
INSERT [dbo].[Sell_order] ([order_id], [employee_id], [goods_id], [customers_id], [discount], [kg], [order_date], [cost],Order_num) VALUES (N'A0010', N'B03', N'q010', N'1004', 0.94, 100, CAST(0x0000AF2200000000 AS DateTime), NULL,22)
GO
INSERT [dbo].[Sell_order] ([order_id], [employee_id], [goods_id], [customers_id], [discount], [kg], [order_date], [cost],Order_num) VALUES (N'A0011', N'B01', N'y034', N'1004', 0.95, 80, CAST(0x0000AE8900000000 AS DateTime), NULL,33)
GO
INSERT [dbo].[Sell_order] ([order_id], [employee_id], [goods_id], [customers_id], [discount], [kg], [order_date], [cost],Order_num) VALUES (N'A0012', N'B04', N'm001', N'1005', 0.9, 500, CAST(0x0000AE1200000000 AS DateTime), NULL,9)
GO
INSERT [dbo].[Sell_order] ([order_id], [employee_id], [goods_id], [customers_id], [discount], [kg], [order_date], [cost],Order_num) VALUES (N'A0013', N'B05', N's020', N'1005', 0.95, 100, CAST(0x0000AE6A00000000 AS DateTime), NULL,6)
GO

select *from Sell_order
INSERT [dbo].[user] ([username], [pwd], [keys]) VALUES (N'lisa', N'7777', 7)
GO
INSERT [dbo].[user] ([username], [pwd], [keys]) VALUES (N'yang', N'8888', 8)
GO
INSERT [dbo].[user] ([username], [pwd], [keys]) VALUES (N'sam', N'3333', 3)
GO
INSERT [dbo].[user] ([username], [pwd], [keys]) VALUES (N'sha', N'123456', 5)
GO
INSERT [dbo].[user] ([username], [pwd], [keys]) VALUES (N'sum', NULL, 9)
GO
INSERT [dbo].[user] ([username], [pwd], [keys]) VALUES (N'tinna', N'4444', 4)
GO
INSERT [dbo].[user] ([username], [pwd], [keys]) VALUES (N'tom', N'1111', 1)
GO
INSERT [dbo].[user] ([username], [pwd], [keys]) VALUES (N'tony', N'2122', 2)
GO
INSERT [dbo].[user] ([username], [pwd], [keys]) VALUES (N'users', N'6666', 6)
GO
select * from [Users]


