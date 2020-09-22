create table STUDENT_TBL(
	STUDENT_NO CHAR(6) primary key,
	STUDENT_NAME VARCHAR2(50),
	CLASS_CODE CHAR(2),
	BIRTH_DATE DATE,
	STUDENT_STATUS CHAR(1),
	STUDENT_GRADE NUMBER(1),
	STUDENT_TEL VARCHAR2(13),
	STUDENT_ADDR VARCHAR2(100));
	
	SELECT *FROM STUDENT_TBL;
drop table STUDENT_TBL;
drop table SCORE_TBL;
insert into STUDENT_TBL
values('180001','박길동','A1','2000/10/01','1',1,'010-2222-3333','대구시 북구 복현동');

insert into STUDENT_TBL
values('180002','홍나라','A1','2000/02/10','2',1,'010-1111-2222','대구시 서구 내당동');

insert into STUDENT_TBL
values('180003','김정은','A2','2000/03/01','1',1,'010-4444-5555','경북 경산시 중산동');

insert into STUDENT_TBL
values('180004','최현우','A2','1999/02/02','2',2,'010-3333-4444','경북 경산시 중방동');

insert into STUDENT_TBL
values('170005','박지연','A1','1999/05/05','1',2,'010-5555-6666','대구시 수성구 사월동');

insert into STUDENT_TBL
values('170006','여은','A1','1999/04/15','1',2,'010-6666-7777','경북 경산시 옥산동');

insert into STUDENT_TBL
values('160007','강고을','A1','1998/08/18','1',3,'010-8888-9999','경북 경산시 옥곡동');

create table SCORE_TBL(
SCORE_YEAR NUMBER ,
SCORE_TERM NUMBER,
STUDENT_NO CHAR(6),
SUBJECT_NAME VARCHAR2(40),
SCORE NUMBER,
SCORE_UNIT NUMBER,
primary key (SCORE_YEAR,SCORE_TERM,STUDENT_NO,SUBJECT_NAME));
select nvl(max(STUDENT_NO),0)+1 from STUDENT_TBL;

insert into SCORE_TBL values(2018,1,'180001','운영체제', 85, 2);
insert into SCORE_TBL values(2018,1,'180002','운영체제', 95, 2);
insert into SCORE_TBL values(2018,1,'180003','운영체제', 70, 2);
insert into SCORE_TBL values(2018,1,'180001','자바', 60, 5);
insert into SCORE_TBL values(2018,1,'180002','자바', 80, 5);
insert into SCORE_TBL values(2018,1,'180003','자바', 60, 5);
insert into SCORE_TBL values(2018,1,'180001','JSP', 80, 3);
insert into SCORE_TBL values(2018,1,'180002','JSP', 90, 3);
insert into SCORE_TBL values(2018,1,'180003','JSP', 70, 3);
insert into SCORE_TBL values(2018,1,'180001','HTML', 90, 2);
insert into SCORE_TBL values(2018,1,'180002','HTML', 95, 2);
insert into SCORE_TBL values(2018,1,'180003','HTML', 100, 2);
insert into SCORE_TBL values(2018,2,'180001','PHP', 90, 2);
insert into SCORE_TBL values(2018,2,'180002','PHP', 90, 2);
insert into SCORE_TBL values(2018,2,'180003','PHP', 80, 2);
insert into SCORE_TBL values(2018,2,'180001','보안', 80, 3);
insert into SCORE_TBL values(2018,2,'180002','보안', 90, 3);
insert into SCORE_TBL values(2018,2,'180003','보안', 70, 3);

select * from SCORE_TBL;
commit;
select STUDENT_NO, STUDENT_NAME,
decode(CLASS_CODE,'A1','컴퓨터공학','A2','사이버보안') CLASS_CODE,
to_char(BIRTH_DATE,'yyyy/mm/dd') BIRTH_DATE,
decode(STUDENT_STATUS,'1','재학','2','휴학','3','재학') STUDENT_STATUS,
STUDENT_GRADE, STUDENT_TEL, STUDENT_ADDR from STUDENT_TBL order by 1;

select st.STUDENT_NO, STUDENT_NAME, SCORE_YEAR, SCORE_TERM, round(sum(SCORE*SCORE_UNIT)/sum(SCORE_UNIT),1) as grade
 from STUDENT_TBL st join SCORE_TBL sc 
 on st.STUDENT_NO = sc.STUDENT_NO
 group by st.STUDENT_NO, STUDENT_NAME, SCORE_YEAR, SCORE_TERM	
 order by SCORE_TERM, st.STUDENT_NO;