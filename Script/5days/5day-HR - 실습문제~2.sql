create table grade_pt_rade(
   mem_grade varchar2(20) not null primary key,
   grade_pt_rate number(3,2)
   );
select * from grade_pt_rade;

insert into grade_pt_rade
values('gold',2);

insert into grade_pt_rade
values('sliver',3);
commit;
   
create table member (
    mem_id varchar2(6) not null constraint MEMBER_MEM_ID_PK primary key,
    mem_grade varchar2(20),
    mem_pw varchar2(20) not null,
    mem_birth date DEFAULT sysdate not null,
    mem_tel varchar2(20),
    mem_pt varchar2(10) DEFAULT 0 not null,
    constraint MEMBER_MEM_GRADE_FK foreign key(mem_grade) references grade_pt_rade(mem_grade)
    );  
select * from member;
   
drop table member cascade constraint purge;

insert into member
values('1234','sliver','1234',Default,'56897','7562');
commit;

create table today(
today_code varchar2(6) not null primary key,
today_sens_value number(3),
today_intell_value number(3),
today_phy_value number(3)
);

insert into today
values('1234',4,5,6);

insert into today
values('1424',4,5,6);

insert into today
values('1784',4,5,6);
commit;

create table nation(
nation_code varchar2(26) not null primary key,
nation_name varchar2(50) not null
);

insert into nation
values('7895','KOREA');

insert into nation
values('7874','KOREA');

insert into nation
values('7155','KOREA');

select * from nation;
commit;

create table theme(
theme_code varchar2(6) not null primary key,
theme_name varchar2(50) not null
);

insert into theme
values('1234','ass');

insert into theme
values('1454','ass');

insert into theme
values('1564','ass');
commit;

create table manager(
manager_id varchar2(30) not null primary key,
manager_pwd varchar2(20) not null,
manager_tel varchar2(20)
);

insert into manager
values('aaaa','1234','865');

insert into manager
values('bbbb','1234','865');

insert into manager
values('cccc','1234','865');
commit;

create table wine_type(
wine_type_code varchar2(6) not null primary key,
wine_type_name varchar2(50)
);

insert into wine_type
values('8520','wer');

insert into wine_type
values('8541','wer');

insert into wine_type
values('9658','wer');

select * from wine_type;
commit;

create table stock_mamagement(
stock_code varchar2(6) not null primary key,
wine_code varchar2(6), 
manager_id varchar2(30), 
ware_date date Default sysdate NOT NULL,
stock_amount number(5)  Default 0 NOT NULL
);

alter table stock_mamagement
add constraint stock_wine_code_FK foreign key (wine_code) references  wine(wine_code);

alter table stock_mamagement
add constraint stock_manager_id_FK foreign key (manager_id) references  manager(manager_id);

select * from stock_mamagement;

insert into stock_mamagement
values('1784','ass','7895',);
commit;

create table wine(
wine_code varchar2(26) NOT NULL primary key,
wine_name varchar2(100) NOT NULL,
wine_url blob,
nation_code varchar2(6) ,
wine_type_code varchar2(6) ,
wine_sugar_code number(2),
wine_price number(15) Default 0 NOT NULL,
wine_vintage date,
theme_code varchar2(6),
today_code varchar2(6) 

);

alter table wine
add constraint wine_nation_code_FK foreign key (nation_code) references nation(nation_code);

alter table wine
add constraint wine_type_code_FK foreign key (wine_type_code) references  wine_type(wine_type_code);

alter table wine
add constraint wine_theme_code_FK foreign key (theme_code) references  theme(theme_code);

alter table wine
add constraint wine_today_code_FK foreign key (today_code) references  today(today_code);

select * from wine;

insert into wine
values('1484','awer', NULL,'7895','8520',5,2000,'22-12-02','1234','1234' );
commit;



create table sale (
    sale_date date default sysdate not null constraint SALE_SALE_DATE_PK primary key,
    wine_code varchar2(6) not null,
        constraint SALE_WINE_CODE_FK foreign key(wine_code) references wine(wine_code),
    mem_id varchar2(30) not null,
        constraint SALE_MEM_ID_FK foreign key(mem_id) references member (mem_id),
    sale_amount varchar2(5) default 0 not null,
    sale_price varchar2(6) default 0 not null,
    sale_tot_price varchar2(15) default 0 not null
    ); 
    
select * from sale;

insert into sale
values(Default,'1484','1234','4520','5000','20000');
commit;




