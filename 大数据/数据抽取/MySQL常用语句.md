# 1、mysql服务的启动和停止
```mysql
net stop mysql
```
* 启动 net start mysql #停止
# 2、登录mysql
```mysql
mysql -h localhost -u root -P 3306 -p
password: *******
```
-h mysql连接地址

-u mysql登录用户名

-P mysql连接端口(默认为 3306)

-p mysql登录密码(不建议直接在后面写密码[明文])

# 3、密码直接登录mysql
```mysql
mysql -h localhost -u root -p 123456
```
# 4、查看数据库

```mysql
SHOW DATABASES;
```

# 5、创建和删除数据库
```mysql
CREATE { DATABASE | SCHEMA } [ IF NOT EXISTS ] db_name [DEFAULT] CHARACTER SET [ = ] charset_name; #创建

DROP DATABASE db_name;　　#删除
```

# 6、查看数据库存储引擎、使用数据库、查看当前使用的数据库
```mysql
SHOW ENGINES; #查看存储引擎

USE db_name; # 使用数据库

SELECT DATABASE(); #查看当前使用的数据库
```

# 7、使用SHOW 语句查询mysql支持的存储引擎

```mysql
SHOW VARIABLES LIKE 'have%'; # 查询支持have开头的存储引擎
```

# 8、显示库中的数据表
```mysql
USE db_name; 　　#使用数据库SHOW TABLES;　　#显示数据表
```

# 9、创建和删除数据表
```mysql
CREATE TABLE [IF NOT EXISTS] table_name(column_name column_type...)#创建DROP TABLE table_name; #删除
```
- 实例：

```mysql
CREATE TABLE `fa_card_bill` ( `id` int(11) NOT NULL AUTO_INCREMENT, `card_list_id` int(11) NOT NULL COMMENT '手机号id', `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '导入电话', `name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '费用名称', `money` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '费用金额', `createtime` int(11) NULL DEFAULT NULL COMMENT '添加时间', `add_time` int(11) NULL DEFAULT NULL COMMENT '月份账单', PRIMARY KEY (`id`) USING BTREE) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;
```

# 10、查看数据表的结构

```mysql
DESC table_name;DESCRIBE table_name;EXPLAIN table_name;SHOW COLUMNS FROM table_name;
```

# 11、插入数据

```mysql
INSERT INTO card_bill VALUES (61, '17311112222', 'ddd', '20.33', 1636528616, 1636473600);
```
# 或者
```mysql
INSERT INTO card_bill(card_list_id,phone,name,money,createtime,add_time) VALUES (61, '17311112222', 'ddd', '20.33', 1636528616, 1636473600);
```

  # 12、查询数据



SELECT * FROM tb1 WHERE name='李四';
13、UPDATE 查询

将字段中的特定字符串批量修改为其他字符串时，可已使用以下操作：









UPDATE table_name SET field = REPLACE(field, 'old-value', 'new-value') [WHERE Clause] ;

UPDATE tb1 SET name = REPLACE (name,'a','aaa') WHERE id = 1;
14、基本的使用形式为









UPDATE table_name SET column_name = new-value [WHERE Clause] ;

UPDATE tb1 SET status = DEFAULT WHERE id = 4 ;
15、DELETE 语句









DELETE FROM table_name [WHERE Clause];

DELETE FROM tb1 WHERE id= '7777';
16、LIKE

注意：没有使用百分号 %, LIKE 子句与等号 = 的效果是一样的









SELECT * FROM table1 WHERE name LIKE 'aaa%';

SELECT * FROM table1 WHERE name LIKE '%aaa' AND id = '1%';
17、UNION

NION 操作符用于连接两个以上的 SELECT 语句的结果组合到一个结果集合中。多个 SELECT 语句会删除重复的数据。





















SELECT expression1, expression2, ... FROM table_name [WHERE conditions] 　　 >UNION [ ALL | DISTINCT ] >SELECT expression1, expression2, ... FROM table_name [WHERE conditions];#expression1, expression2, ... : 要检索的列。#tables: 要检索的数据表。
#WHERE conditions: 可选， 检索条件。
#DISTINCT: 可选，删除结果集中重复的数据。默认情况下 UNION 操作符已经删除了重复数据，所以 DISTINCT 修饰符对结果没啥影响。#ALL: 可选，返回所有结果集，包含重复数据。