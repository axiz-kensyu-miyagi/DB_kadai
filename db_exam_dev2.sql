--演習問題2-発展
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
SELECT *, amount * 1.1 AS カラム名なし
FROM sales;

-- 9 salesテーブル検索4
SELECT *
FROM sales
WHERE amount IS NOT NULL;

-- 10 customerテーブル検索1
SELECT customer_id, customer_name
FROM customer
WHERE customer_name NOT IN ('田中');

--カラム名の変更
ALTER TABLE sales
 RENAME COLUMN oder_date TO order_date;

-- 11 salesテーブルのレコード更新
UPDATE sales
SET order_date = '2018/11/05', customer_id = '4'
WHERE sales_id= 4;

-- 12 salesテーブルのレコード削除
DELETE FROM sales
WHERE amount IS NULL;

--NULLには=は使えない

--テーブル確認用
SELECT *
FROM sales
order by sales_id;

SELECT *
FROM customer;


--2発展-1 CREATE
CREATE TABLE sales_old(
sales_id INT PRIMARY KEY
, order_date DATE
, customer_id INT NOT NULL REFERENCES customer(customer_id)
, amount DECIMAL
);


--2発展-2 INSERT
INSERT INTO sales_old(sales_id, order_date, customer_id, amount)
VALUES
  (6, '2018/09/02', 2, 20000)
, (7, '2018/09/02', 1, 5000)
, (8, '2018/09/02', 3, 6000)
, (9, '2018/09/05', 1, 3000);


--2発展-3 INSERT、SELECT
INSERT INTO sales SELECT * FROM sales_old ;


--2発展-4 DROP
DROP TABLE sales_old;


--2発展-5 CASE WHEN、別名
SELECT sales_id, order_date
, CASE
    WHEN order_date < '2018/10/01' THEN '○'
    WHEN order_date >= '2018/10/01' THEN ' '
    ELSE 'その他'
  END is_old
  FROM sales
ORDER BY order_date;


--2発展-6 文字列結合、別名
SELECT CONCAT(customer_id , ':' , customer_name) AS customer_id_name
FROM customer
ORDER BY customer_id;
--同じ型なのでCONCATを使用


--2発展-7 LIMIT
SELECT sales_id, order_date, customer_id, amount
FROM sales 
WHERE customer_id = 1
ORDER BY order_date DESC
LIMIT 2;


--2発展-8 GROUP BY、MIN、SUM、サブクエリ、別名
SELECT order_date, sum(amount) AS sum_amount
FROM sales
WHERE order_date IN (SELECT min(order_date)
                    FROM sales)
GROUP BY order_date;


--2発展-9 GROUP BY、JOIN、AVG、TRUNC、別名
SELECT
   c.customer_id
  ,c.customer_name
  ,TRUNC(avg(amount),0) AS avg_amount
FROM customer AS c
INNER JOIN sales AS s
ON c.customer_id = s.customer_id
GROUP BY
   c.customer_id
  ,c.customer_name
  ORDER BY customer_id;


--2発展-10 BETWEEN、LIMIT、サブクエリ
SELECT * 
FROM sales
WHERE order_date BETWEEN '2018/09/01' AND '2018/09/30'
LIMIT 1;



--確認用
SELECT *
FROM sales;

SELECT *
FROM customer;



--確認用
SELECT 
    order_date
   ,sum(amount)
FROM sales
WHERE order_date IN(SELECT
                    min(order_date)
                    FROM sales
                   )
group by order_date
;


