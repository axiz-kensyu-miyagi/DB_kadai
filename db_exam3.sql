--�f�[�^�x�[�X���쐬
CREATE database db_exam;

--book�e�[�u�����쐬
CREATE TABLE book(
 book_id INT PRIMARY KEY
,book_name VARCHAR(50)
,company_id INT
,price DECIMAL
,order_date DATE
,author_id INT
);

--company�e�[�u�����쐬
CREATE TABLE company(
 company_id INT PRIMARY KEY
,company_name VARCHAR(50)
);

--author�e�[�u�����쐬
CREATE TABLE author(
 author_id INT PRIMARY KEY
,author_name VARCHAR(50)
);

--book�e�[�u���փf�[�^��o�^
INSERT INTO book(
  book_id --AS ����ID
, book_name --AS ����
, company_id --AS �o�Ŏ�
, price --AS �艿
, order_date --AS ���s�N����
, author_id --AS ����ID
)
VALUES 
  (1001, '�l�R�̂Ђ݂�',     101,  600,   '2018/1/1', NULL)
, (1002, '���ɂ�������l', 101,  600,   '2020/4/1', 101)
, (1003, '���̉�',           102, 1100,   '2015/5/2', 102)
, (1004, '�ʉ�',             102,  750,   '2012/3/4', 103)
, (1005, '������',           102, 3850,  '2019/2/18', NULL)
, (1006, '���t',             101,  800, '2000/12/12', 104)
, (1007, '�����Ȃ����͂Ȃ�', 101, 1800,   '1992/7/7', NULL)
, (1008, '�����Ȃ��������', 102, 2530,   '2001/9/4', 105);

--company�e�[�u���փf�[�^��o�^
INSERT INTO company(
  company_id --AS �o�Ŏ�ID
, company_name --AS �o�Ŏ�
)
VALUES 
  (101, '�e�N�m�o��')
, (102, 'AxiZ����');

--author�e�[�u���փf�[�^��o�^
INSERT INTO author(
  author_id --AS ����ID
, author_name --AS ���Җ�
)
VALUES 
  (101, '���� ��')
, (102, '�R�c ���Y')
, (103, '��� ���Y')
, (104, '��v�� �q��')
, (105, '��c �O�Y');


--�m�F�p
SELECT *
FROM book;

SELECT *
FROM company;

SELECT *
FROM author;
