--���K���2-���W
-- 1 �f�[�^�x�[�X�쐬
create database axiz_exam_dev;

-- 2 customer�e�[�u���쐬 OK
CREATE TABLE customer(
customer_id INT PRIMARY KEY
,customer_name VARCHAR(50)
);

-- 3 sales�e�[�u���쐬 OK
CREATE TABLE sales(
 sales_id INT PRIMARY KEY
,oder_date DATE
,customer_id INT NOT NULL REFERENCES customer(customer_id)
,amount DECIMAL
);

-- 4 customer�e�[�u���փf�[�^�o�^ OK
insert into customer(customer_id, customer_name)
values 
  (1, '�c��')
, (2, '���')
, (3, '�c��')
, (4, '�c��');

-- 5 sales�e�[�u���փf�[�^�o�^ OK
insert into sales(sales_id, oder_date, customer_id, amount)
values 
  (1, '2018/11/01', 1, 3000)
, (2, '2018/10/01', 3, 5000)
, (3, '2018/10/01', 4, 6000)
, (4, '2018/11/02', 2, 2000)
, (5, '2018/11/15', 2, NULL);

-- 6 salest�e�[�u������1
SELECT *
FROM sales
WHERE amount<5000;

-- 7 sales�e�[�u������2
SELECT *
FROM sales
WHERE amount>=5000;

-- 8 sales�e�[�u������3
SELECT *, amount * 1.1 AS �J�������Ȃ�
FROM sales;

-- 9 sales�e�[�u������4
SELECT *
FROM sales
WHERE amount IS NOT NULL;

-- 10 customer�e�[�u������1
SELECT customer_id, customer_name
FROM customer
WHERE customer_name NOT IN ('�c��');

--�J�������̕ύX
ALTER TABLE sales
 RENAME COLUMN oder_date TO order_date;

-- 11 sales�e�[�u���̃��R�[�h�X�V
UPDATE sales
SET order_date = '2018/11/05', customer_id = '4'
WHERE sales_id= 4;

-- 12 sales�e�[�u���̃��R�[�h�폜
DELETE FROM sales
WHERE amount IS NULL;

--NULL�ɂ�=�͎g���Ȃ�

--�e�[�u���m�F�p
SELECT *
FROM sales
order by sales_id;

SELECT *
FROM customer;


--2���W-1 CREATE
CREATE TABLE sales_old(
sales_id INT PRIMARY KEY
, order_date DATE
, customer_id INT NOT NULL REFERENCES customer(customer_id)
, amount DECIMAL
);


--2���W-2 INSERT
INSERT INTO sales_old(sales_id, order_date, customer_id, amount)
VALUES
  (6, '2018/09/02', 2, 20000)
, (7, '2018/09/02', 1, 5000)
, (8, '2018/09/02', 3, 6000)
, (9, '2018/09/05', 1, 3000);


--2���W-3 INSERT�ASELECT
INSERT INTO sales SELECT * FROM sales_old ;


--2���W-4 DROP
DROP TABLE sales_old;


--2���W-5 CASE WHEN�A�ʖ�
SELECT sales_id, order_date
, CASE
    WHEN order_date < '2018/10/01' THEN '��'
    WHEN order_date >= '2018/10/01' THEN ' '
    ELSE '���̑�'
  END is_old
  FROM sales
ORDER BY order_date;


--2���W-6 �����񌋍��A�ʖ�
SELECT CONCAT(customer_id , ':' , customer_name) AS customer_id_name
FROM customer
ORDER BY customer_id;
--�����^�Ȃ̂�CONCAT���g�p


--2���W-7 LIMIT
SELECT sales_id, order_date, customer_id, amount
FROM sales 
WHERE customer_id = 1
ORDER BY order_date DESC
LIMIT 2;


--2���W-8 GROUP BY�AMIN�ASUM�A�T�u�N�G���A�ʖ�
SELECT order_date, sum(amount) AS sum_amount
FROM sales
WHERE order_date IN (SELECT min(order_date)
                    FROM sales)
GROUP BY order_date;


--2���W-9 GROUP BY�AJOIN�AAVG�ATRUNC�A�ʖ�
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


--2���W-10 BETWEEN�ALIMIT�A�T�u�N�G��
SELECT * 
FROM sales
WHERE order_date BETWEEN '2018/09/01' AND '2018/09/30'
LIMIT 1;



--�m�F�p
SELECT *
FROM sales;

SELECT *
FROM customer;



--�m�F�p
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


