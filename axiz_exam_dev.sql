-- 1 データベース作成
create database axiz_exam_dev;


-- 2 customerテーブル作成 OK
CREATE TABLE customer(
customer_id INT PRIMARY KEY
,customer_name VARCHAR(50)
);


-- 3 salesテーブル作成 OK
CREATE TABLE sales(
 sales_id INT PRIMARY KEY
,oder_date DATE
,customer_id INT NOT NULL REFERENCES customer(customer_id)
,amount DECIMAL
);


-- 4 customerテーブルへデータ登録 OK
insert into customer(customer_id, customer_name)
values 
  (1, '田中')
, (2, '鈴木')
, (3, '田中')
, (4, '田島');


-- 5 salesテーブルへデータ登録 OK
insert into sales(sales_id, oder_date, customer_id, amount)
values 
  (1, '2018/11/01', 1, 3000)
, (2, '2018/10/01', 3, 5000)
, (3, '2018/10/01', 4, 6000)
, (4, '2018/11/02', 2, 2000)
, (5, '2018/11/15', 2, NULL);


-- 6 salestテーブル検索1
SELECT *
FROM sales
WHERE amount<5000;


-- 7 salesテーブル検索2
SELECT *
FROM sales
WHERE amount>=5000;

-- 8 salesテーブル検索3
SELECT amount
amount * 1.1 
FROM sales;

-- 9 salesテーブル検索4


-- 10 customerテーブル検索1


-- 10 salesテーブルのレコード更新


-- 10.5 salesテーブルのレコード削除

