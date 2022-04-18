--データベースを作成
CREATE database db_exam;

--bookテーブルを作成
CREATE TABLE book(
 book_id INT PRIMARY KEY
,book_name VARCHAR(50)
,company_id INT
,price DECIMAL
,order_date DATE
,author_id INT
);

--companyテーブルを作成
CREATE TABLE company(
 company_id INT PRIMARY KEY
,company_name VARCHAR(50)
);

--authorテーブルを作成
CREATE TABLE author(
 author_id INT PRIMARY KEY
,author_name VARCHAR(50)
);

--bookテーブルへデータを登録
INSERT INTO book(
  book_id --AS 書籍ID
, book_name --AS 書籍
, company_id --AS 出版社
, price --AS 定価
, order_date --AS 発行年月日
, author_id --AS 著者ID
)
VALUES 
  (1001, 'ネコのひみつ',     101,  600,   '2018/1/1', NULL)
, (1002, '犬にたかられる人', 101,  600,   '2020/4/1', 101)
, (1003, '星の歌',           102, 1100,   '2015/5/2', 102)
, (1004, '凸凹',             102,  750,   '2012/3/4', 103)
, (1005, 'こころ',           102, 3850,  '2019/2/18', NULL)
, (1006, '教師',             101,  800, '2000/12/12', 104)
, (1007, '欠けない月はない', 101, 1800,   '1992/7/7', NULL)
, (1008, '明けない夜もある', 102, 2530,   '2001/9/4', 105);

--companyテーブルへデータを登録
INSERT INTO company(
  company_id --AS 出版社ID
, company_name --AS 出版社
)
VALUES 
  (101, 'テクノ出版')
, (102, 'AxiZ文庫');

--authorテーブルへデータを登録
INSERT INTO author(
  author_id --AS 著者ID
, author_name --AS 著者名
)
VALUES 
  (101, '阿句 静')
, (102, '山田 太郎')
, (103, '鈴木 次郎')
, (104, '手久野 子亜')
, (105, '坂田 三郎');


--確認用
SELECT *
FROM book;

SELECT *
FROM company;

SELECT *
FROM author;
