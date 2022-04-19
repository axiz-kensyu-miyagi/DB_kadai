-- Project Name : データベース設計＿単元課題
-- Date/Time    : 2022/04/19 17:15:24
-- Author       : 宮城　志帆
-- RDBMS Type   : PostgreSQL
-- Application  : A5:SQL Mk-2

/*
  << 注意！！ >>
  BackupToTempTable, RestoreFromTempTable疑似命令が付加されています。
  これにより、drop table, create table 後もデータが残ります。
  この機能は一時的に $$TableName のような一時テーブルを作成します。
  この機能は A5:SQL Mk-2でのみ有効であることに注意してください。
*/

-- レジ
--* RestoreFromTempTable
create table "レジ" (
  "レジID" integer primary key
  , "レジ" character varying
) ;

-- 伝票番号
--* RestoreFromTempTable
create table "伝票番号" (
  "伝票番号" integer primary key
  , "店員ID" integer
) ;

-- howtopay
--* RestoreFromTempTable
create table "レジID" (
  "支払い方法コード" integer primary key
  , "支払い方法" character varying
) ;

-- main
--* RestoreFromTempTable
create table main (
  "店ID" integer
  , "店舗ID" integer
  , "日付" DATE
  , "時間" time
  , "レジID" integer not null
  , "店員ID" integer
  , "軽減税率対象商品ID" integer
  , "軽減税率対象外ID" integer
  , "（税抜き）商品代金" double precision
  , "値引合計" double precision
  , "合計" double precision
  , "税率（８％対象）" double precision
  , "税率（１０％対象）" double precision
  , "（内消費税率）" double precision
  , "支払い方法コード" integer
  , "伝票番号" integer
  , constraint main_PKC primary key ("伝票番号","店員ID","軽減税率対象商品ID","軽減税率対象外ID","支払い方法コード")
) ;

-- 店
--* RestoreFromTempTable
create table 店 (
  "店ID" integer
  , "店名" character varying
  , constraint "店_PKC" primary key ("店ID")
) ;

-- 軽減税率対象外商品（１０％）コード
--* RestoreFromTempTable
create table "軽減税率対象外商品（１０％）コード" (
  "軽減税率対象外商品（１０％）コード" integer
  , "商品名" character varying
  , "（単価）金額" integer
  , "個数" integer
  , "小計（税抜１０％）" integer
  , "消費税等（１０％）" real
  , "値引額" integer
  , constraint "軽減税率対象外商品（１０％）コード_PKC" primary key ("軽減税率対象外商品（１０％）コード")
) ;

-- 軽減税率対象商品（８％）コード
--* RestoreFromTempTable
create table "軽減税率対象商品（８％）コード" (
  "軽減税率対象商品（８％）コード" integer
  , "商品名" character varying
  , "（単価）金額" integer
  , "個数" integer
  , "小計（税抜８％）" integer
  , "消費税当（８％）" real
  , "値引額" integer
  , constraint "軽減税率対象商品（８％）コード_PKC" primary key ("軽減税率対象商品（８％）コード")
) ;

-- 店員
--* RestoreFromTempTable
create table "店員" (
  "店舗ID" integer not null
  , "店員ID" integer
  , "店員名" character varying
  , constraint "店員_PKC" primary key ("店員ID")
) ;

-- 店舗
--* RestoreFromTempTable
create table "店舗" (
  "店ID" integer not null
  , "店名ID" integer
  , "店舗ID" integer
  , "店舗名" character varying
  , "店舗住所" character varying
  , "店舗住所番地以降" character varying
  , "店舗電話番号" double precision
  , constraint "店舗_PKC" primary key ("店ID")
) ;

comment on table "レジ" is 'レジ';
comment on column "レジ"."レジID" is 'レジID';
comment on column "レジ"."レジ" is 'レジ';

comment on table "伝票番号" is '伝票番号';
comment on column "伝票番号"."伝票番号" is '伝票番号';
comment on column "伝票番号"."店員ID" is '店員ID';

comment on table "レジID" is 'howtopay';
comment on column "レジID"."支払い方法コード" is '支払い方法コード';
comment on column "レジID"."支払い方法" is '支払い方法';

comment on table main is 'main';
comment on column main."店ID" is '店ID';
comment on column main."店舗ID" is '店舗ID';
comment on column main."日付" is '日付';
comment on column main."時間" is '時間';
comment on column main."レジID" is 'レジID';
comment on column main."店員ID" is '店員ID';
comment on column main."軽減税率対象商品ID" is '軽減税率対象商品（８％）コード';
comment on column main."軽減税率対象外ID" is '軽減税率対象外商品（10％）コード';
comment on column main."（税抜き）商品代金" is '（税抜き）商品代金';
comment on column main."値引合計" is '値引合計';
comment on column main."合計" is '合計';
comment on column main."税率（８％対象）" is '税率（８％対象）';
comment on column main."税率（１０％対象）" is '税率（１０％対象）';
comment on column main."（内消費税率）" is '（内消費税率）';
comment on column main."支払い方法コード" is '支払い方法コード';
comment on column main."伝票番号" is '伝票番号';

comment on table 店 is '店';
comment on column 店."店ID" is '店ID';
comment on column 店."店名" is '店名';

comment on table "軽減税率対象外商品（１０％）コード" is '軽減税率対象外商品（１０％）コード';
comment on column "軽減税率対象外商品（１０％）コード"."軽減税率対象外商品（１０％）コード" is '軽減税率対象外商品（１０％）コード';
comment on column "軽減税率対象外商品（１０％）コード"."商品名" is '商品名';
comment on column "軽減税率対象外商品（１０％）コード"."（単価）金額" is '（単価）金額';
comment on column "軽減税率対象外商品（１０％）コード"."個数" is '個数';
comment on column "軽減税率対象外商品（１０％）コード"."小計（税抜１０％）" is '小計（税抜１０％）';
comment on column "軽減税率対象外商品（１０％）コード"."消費税等（１０％）" is '消費税等（１０％）';
comment on column "軽減税率対象外商品（１０％）コード"."値引額" is '値引額';

comment on table "軽減税率対象商品（８％）コード" is '軽減税率対象商品（８％）コード';
comment on column "軽減税率対象商品（８％）コード"."軽減税率対象商品（８％）コード" is '軽減税率対象商品（８％）コード';
comment on column "軽減税率対象商品（８％）コード"."商品名" is '商品名';
comment on column "軽減税率対象商品（８％）コード"."（単価）金額" is '（単価）金額';
comment on column "軽減税率対象商品（８％）コード"."個数" is '個数';
comment on column "軽減税率対象商品（８％）コード"."小計（税抜８％）" is '小計（税抜８％）';
comment on column "軽減税率対象商品（８％）コード"."消費税当（８％）" is '消費税当（８％）';
comment on column "軽減税率対象商品（８％）コード"."値引額" is '値引額';

comment on table "店員" is '店員';
comment on column "店員"."店舗ID" is '店舗ID';
comment on column "店員"."店員ID" is '店員ID';
comment on column "店員"."店員名" is '店員名';

comment on table "店舗" is '店舗';
comment on column "店舗"."店ID" is '店ID';
comment on column "店舗"."店名ID" is '店ID';
comment on column "店舗"."店舗ID" is '店舗ID';
comment on column "店舗"."店舗名" is '店舗名';
comment on column "店舗"."店舗住所" is '店舗住所';
comment on column "店舗"."店舗住所番地以降" is '店舗住所番地以降';
comment on column "店舗"."店舗電話番号" is '店舗電話番号';

