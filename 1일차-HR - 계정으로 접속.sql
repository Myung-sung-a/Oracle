

--1. HR 계정으로 접속 확인: resoure : 테이블 생성, 수정, 삭제,
show user;

--2. 테이블 생성,    ; <== 까지가 하나의 명령어가 처리되는 블락
create table myTbl2 (
    id varchar2 (20),
    pass varchar2 (20)
    );

--3. 테이블에 값 넣기 : commit (저장하라)
insert into myTbl2 values ( '1', '1234');
commit;     -- DB에 영구적으로 저장하라. (Insert, update, delete 구문에서 사용)

--4. 테이블의 값을 출력하기
select * from myTbl2;

--5. 테이블 삭제 하기
drop table myTbl2;

-- 원격 접속한 Oracle 버전 확인
select *from v$version;

-- 접속한 DataBase에 존재하는 모든 테이블 보기
select * from tab;

