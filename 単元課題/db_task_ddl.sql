-- Project Name : �f�[�^�x�[�X�݌v�Q�P���ۑ�
-- Date/Time    : 2022/04/19 17:15:24
-- Author       : �{��@�u��
-- RDBMS Type   : PostgreSQL
-- Application  : A5:SQL Mk-2

/*
  << ���ӁI�I >>
  BackupToTempTable, RestoreFromTempTable�^�����߂��t������Ă��܂��B
  ����ɂ��Adrop table, create table ����f�[�^���c��܂��B
  ���̋@�\�͈ꎞ�I�� $$TableName �̂悤�Ȉꎞ�e�[�u�����쐬���܂��B
  ���̋@�\�� A5:SQL Mk-2�ł̂ݗL���ł��邱�Ƃɒ��ӂ��Ă��������B
*/

-- ���W
--* RestoreFromTempTable
create table "���W" (
  "���WID" integer primary key
  , "���W" character varying
) ;

-- �`�[�ԍ�
--* RestoreFromTempTable
create table "�`�[�ԍ�" (
  "�`�[�ԍ�" integer primary key
  , "�X��ID" integer
) ;

-- howtopay
--* RestoreFromTempTable
create table "���WID" (
  "�x�������@�R�[�h" integer primary key
  , "�x�������@" character varying
) ;

-- main
--* RestoreFromTempTable
create table main (
  "�XID" integer
  , "�X��ID" integer
  , "���t" DATE
  , "����" time
  , "���WID" integer not null
  , "�X��ID" integer
  , "�y���ŗ��Ώۏ��iID" integer
  , "�y���ŗ��ΏۊOID" integer
  , "�i�Ŕ����j���i���" double precision
  , "�l�����v" double precision
  , "���v" double precision
  , "�ŗ��i�W���Ώہj" double precision
  , "�ŗ��i�P�O���Ώہj" double precision
  , "�i������ŗ��j" double precision
  , "�x�������@�R�[�h" integer
  , "�`�[�ԍ�" integer
  , constraint main_PKC primary key ("�`�[�ԍ�","�X��ID","�y���ŗ��Ώۏ��iID","�y���ŗ��ΏۊOID","�x�������@�R�[�h")
) ;

-- �X
--* RestoreFromTempTable
create table �X (
  "�XID" integer
  , "�X��" character varying
  , constraint "�X_PKC" primary key ("�XID")
) ;

-- �y���ŗ��ΏۊO���i�i�P�O���j�R�[�h
--* RestoreFromTempTable
create table "�y���ŗ��ΏۊO���i�i�P�O���j�R�[�h" (
  "�y���ŗ��ΏۊO���i�i�P�O���j�R�[�h" integer
  , "���i��" character varying
  , "�i�P���j���z" integer
  , "��" integer
  , "���v�i�Ŕ��P�O���j" integer
  , "����œ��i�P�O���j" real
  , "�l���z" integer
  , constraint "�y���ŗ��ΏۊO���i�i�P�O���j�R�[�h_PKC" primary key ("�y���ŗ��ΏۊO���i�i�P�O���j�R�[�h")
) ;

-- �y���ŗ��Ώۏ��i�i�W���j�R�[�h
--* RestoreFromTempTable
create table "�y���ŗ��Ώۏ��i�i�W���j�R�[�h" (
  "�y���ŗ��Ώۏ��i�i�W���j�R�[�h" integer
  , "���i��" character varying
  , "�i�P���j���z" integer
  , "��" integer
  , "���v�i�Ŕ��W���j" integer
  , "����œ��i�W���j" real
  , "�l���z" integer
  , constraint "�y���ŗ��Ώۏ��i�i�W���j�R�[�h_PKC" primary key ("�y���ŗ��Ώۏ��i�i�W���j�R�[�h")
) ;

-- �X��
--* RestoreFromTempTable
create table "�X��" (
  "�X��ID" integer not null
  , "�X��ID" integer
  , "�X����" character varying
  , constraint "�X��_PKC" primary key ("�X��ID")
) ;

-- �X��
--* RestoreFromTempTable
create table "�X��" (
  "�XID" integer not null
  , "�X��ID" integer
  , "�X��ID" integer
  , "�X�ܖ�" character varying
  , "�X�܏Z��" character varying
  , "�X�܏Z���Ԓn�ȍ~" character varying
  , "�X�ܓd�b�ԍ�" double precision
  , constraint "�X��_PKC" primary key ("�XID")
) ;

comment on table "���W" is '���W';
comment on column "���W"."���WID" is '���WID';
comment on column "���W"."���W" is '���W';

comment on table "�`�[�ԍ�" is '�`�[�ԍ�';
comment on column "�`�[�ԍ�"."�`�[�ԍ�" is '�`�[�ԍ�';
comment on column "�`�[�ԍ�"."�X��ID" is '�X��ID';

comment on table "���WID" is 'howtopay';
comment on column "���WID"."�x�������@�R�[�h" is '�x�������@�R�[�h';
comment on column "���WID"."�x�������@" is '�x�������@';

comment on table main is 'main';
comment on column main."�XID" is '�XID';
comment on column main."�X��ID" is '�X��ID';
comment on column main."���t" is '���t';
comment on column main."����" is '����';
comment on column main."���WID" is '���WID';
comment on column main."�X��ID" is '�X��ID';
comment on column main."�y���ŗ��Ώۏ��iID" is '�y���ŗ��Ώۏ��i�i�W���j�R�[�h';
comment on column main."�y���ŗ��ΏۊOID" is '�y���ŗ��ΏۊO���i�i10���j�R�[�h';
comment on column main."�i�Ŕ����j���i���" is '�i�Ŕ����j���i���';
comment on column main."�l�����v" is '�l�����v';
comment on column main."���v" is '���v';
comment on column main."�ŗ��i�W���Ώہj" is '�ŗ��i�W���Ώہj';
comment on column main."�ŗ��i�P�O���Ώہj" is '�ŗ��i�P�O���Ώہj';
comment on column main."�i������ŗ��j" is '�i������ŗ��j';
comment on column main."�x�������@�R�[�h" is '�x�������@�R�[�h';
comment on column main."�`�[�ԍ�" is '�`�[�ԍ�';

comment on table �X is '�X';
comment on column �X."�XID" is '�XID';
comment on column �X."�X��" is '�X��';

comment on table "�y���ŗ��ΏۊO���i�i�P�O���j�R�[�h" is '�y���ŗ��ΏۊO���i�i�P�O���j�R�[�h';
comment on column "�y���ŗ��ΏۊO���i�i�P�O���j�R�[�h"."�y���ŗ��ΏۊO���i�i�P�O���j�R�[�h" is '�y���ŗ��ΏۊO���i�i�P�O���j�R�[�h';
comment on column "�y���ŗ��ΏۊO���i�i�P�O���j�R�[�h"."���i��" is '���i��';
comment on column "�y���ŗ��ΏۊO���i�i�P�O���j�R�[�h"."�i�P���j���z" is '�i�P���j���z';
comment on column "�y���ŗ��ΏۊO���i�i�P�O���j�R�[�h"."��" is '��';
comment on column "�y���ŗ��ΏۊO���i�i�P�O���j�R�[�h"."���v�i�Ŕ��P�O���j" is '���v�i�Ŕ��P�O���j';
comment on column "�y���ŗ��ΏۊO���i�i�P�O���j�R�[�h"."����œ��i�P�O���j" is '����œ��i�P�O���j';
comment on column "�y���ŗ��ΏۊO���i�i�P�O���j�R�[�h"."�l���z" is '�l���z';

comment on table "�y���ŗ��Ώۏ��i�i�W���j�R�[�h" is '�y���ŗ��Ώۏ��i�i�W���j�R�[�h';
comment on column "�y���ŗ��Ώۏ��i�i�W���j�R�[�h"."�y���ŗ��Ώۏ��i�i�W���j�R�[�h" is '�y���ŗ��Ώۏ��i�i�W���j�R�[�h';
comment on column "�y���ŗ��Ώۏ��i�i�W���j�R�[�h"."���i��" is '���i��';
comment on column "�y���ŗ��Ώۏ��i�i�W���j�R�[�h"."�i�P���j���z" is '�i�P���j���z';
comment on column "�y���ŗ��Ώۏ��i�i�W���j�R�[�h"."��" is '��';
comment on column "�y���ŗ��Ώۏ��i�i�W���j�R�[�h"."���v�i�Ŕ��W���j" is '���v�i�Ŕ��W���j';
comment on column "�y���ŗ��Ώۏ��i�i�W���j�R�[�h"."����œ��i�W���j" is '����œ��i�W���j';
comment on column "�y���ŗ��Ώۏ��i�i�W���j�R�[�h"."�l���z" is '�l���z';

comment on table "�X��" is '�X��';
comment on column "�X��"."�X��ID" is '�X��ID';
comment on column "�X��"."�X��ID" is '�X��ID';
comment on column "�X��"."�X����" is '�X����';

comment on table "�X��" is '�X��';
comment on column "�X��"."�XID" is '�XID';
comment on column "�X��"."�X��ID" is '�XID';
comment on column "�X��"."�X��ID" is '�X��ID';
comment on column "�X��"."�X�ܖ�" is '�X�ܖ�';
comment on column "�X��"."�X�܏Z��" is '�X�܏Z��';
comment on column "�X��"."�X�܏Z���Ԓn�ȍ~" is '�X�܏Z���Ԓn�ȍ~';
comment on column "�X��"."�X�ܓd�b�ԍ�" is '�X�ܓd�b�ԍ�';

