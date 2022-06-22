create table notices(
seq varchar2(10),
title varchar2(100),
writer varchar2(30),
conteant varchar2(300),
regdate date,
hit number);
desc notices;
alter table notices rename column conteant to content;
select*from notice;

insert into notices(seq,title,writer,content,regdate,hit) values('1','test1','hong','content1',sysdate,0);
insert into notices(seq,title,writer,content,regdate,hit) values('2','test1','hong','content1',sysdate,0);
insert into notices(seq,title,writer,content,regdate,hit) 
values((select max(to_number(seq))+1 from notices),'test1','hong','content1',sysdate,0);

commit;
select * from notices where seq='4';
select * from notices order by to_number(seq) desc;

select seq+3 from notices;

select max(seq) from notices;
select max(to_number(seq))+1 from notices;
select * from notices;

delete from notices where seq='6';

update notices set title='haha', content='수정' where seq='6';
commit;
---------------------------
create table board(
bno varchar2(10),
bsubj varchar2(200),
bwriter varchar2(50),
bmemo varchar2(500),
bdate date,
bcnt number);

insert into board(bno,bsubj,bwriter,bmemo,bdate,bcnt) 
values('1','test1','choi','content1',sysdate,0);
select * from board where bno=1;
select * from board;
update board set bsubj='꿩', bmemo='꿩꿩꿩' where bno=2;
delete from board where bno=1;
commit;
--------------------------
create table nmember(
id varchar2(50),
pwd varchar2(50),
name varchar2(50),
gender varchar2(10),
birth varchar2(10),
is_lunar varchar2(10),
cphone varchar2(15),
email varchar2(50),
habit varchar2(200),
regdate date);

select * from nmember;
--------------------------
create table nmember2(
tid varchar2(50),
tpwd varchar2(50),
tname varchar2(50),
tgender varchar2(10),
tbirth varchar2(10),
tis_lunar varchar2(10),
tcphone varchar2(15),
temail varchar2(50),
thabit varchar2(200),
tregdate date);

select * from nmember2;

insert into nmember2(tid,tpwd,tname,tgender,tbirth,tis_lunar,tcphone,temail,thabit,tregdate)
values('blue','111','hong','남성','2000-05-05','solar','010-1111-3333','a@b.com','movie',sysdate);
commit;
