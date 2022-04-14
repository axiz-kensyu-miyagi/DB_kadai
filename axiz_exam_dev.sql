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
SELECT amount
amount * 1.1 
FROM sales;

-- 9 sales�e�[�u������4


-- 10 customer�e�[�u������1


-- 10 sales�e�[�u���̃��R�[�h�X�V


-- 10.5 sales�e�[�u���̃��R�[�h�폜

