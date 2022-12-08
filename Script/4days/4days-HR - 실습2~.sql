create table tb_zipcode(
    zipcode varchar2(7) not null constraint PK_tb_zipcode_zipcode primary key,
    sido varchar2(30),
    gugum varchar2 (30),
    dong varchar2 (30),
    bungi varchar2 (30)
    );
insert into tb_zipcode values ('014650', '서울시' ,'도봉구' ,'창2동','804'); 
insert into tb_zipcode values ('014450', '서울시' ,'강북구' ,'창2동','802'); 
insert into tb_zipcode values ('014750', '서울시' ,'도봉구' ,'창1동','804'); 
    

create table member(
    id VARCHAR2(20) NOT NULL constraint PK_member_id primary key,
    pwd VARCHAR2(20),
    name VARCHAR2(50),
    zipcode VARCHAR2(7),
    constraint member_zipcode_FK foreign key(zipcode)references tb_zipcode(zipcode) ,
    address VARCHAR2(20),
    tel VARCHAR2(13),
    indate date DEFAULT SYSDATE
    );
insert into member values ('aaaa', '1234' ,'명성아' ,'014650','몰라','56555',DEFAULT); 
insert into member values ('bbbb', '2134' ,'명성아' ,'014450','몰라','56555',DEFAULT);
insert into member values ('cccc', '8654' ,'명성아' ,'014750','몰라','56555',DEFAULT);
    
create table products(
    product_code VARCHAR2(20) NOT NULL constraint PK_products_product_code primary key,
    product_name VARCHAR2(100),
    product_kind char(1),
    product_price1 VARCHAR2(10),
    product_price2 VARCHAR2(10),
    product_content VARCHAR2(1000),
    product_image VARCHAR2(50),
    sizeSt VARCHAR2(5),
    sizeEt VARCHAR2(5),
    product_quantity VARCHAR2(5),
    useyn char(1),
    indate date
    );
insert into  products values ('5656', '가디건' ,'1' ,'2000','3000','후드','가디건 사진','45','55','100','N','22-12-08');
insert into  products values ('5616', '가디건' ,'1' ,'2000','4000','후드','바지 사진','45','55','100','N','22-02-08');
insert into  products values ('5156', '가디건' ,'1' ,'2000','2000','후드','상의 사진','45','55','100','N','22-11-08');
    
create table orders (
    o_seq number(10) NOT NULL constraint orders_o_seq_PK Primary key,
    product_code varchar2(20),
    constraint  FK_orders_product_code_products foreign key(product_code)references products(product_code),
    id varchar2(16),
    constraint FK_orders_id_member foreign key(id)references member(id),
    product_size varchar2(5),
    quantity varchar2(5),
    result char(1),
    indate date
    );
insert into  orders values ('89785', '5656' ,'aaaa' ,'44','200','Y','22/02/22');
insert into  orders values ('87542', '5616' ,'bbbb' ,'44','200','Y','22/02/22');
insert into  orders values ('85547', '5156' ,'cccc' ,'44','200','Y','22/02/22');
    
    
