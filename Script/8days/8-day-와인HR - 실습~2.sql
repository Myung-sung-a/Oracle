
DROP TABLE sale CASCADE CONSTRAINTS PURGE;



DROP TABLE member CASCADE CONSTRAINTS PURGE;



DROP TABLE grade_pt_rade CASCADE CONSTRAINTS PURGE;



DROP TABLE stock_mamagement CASCADE CONSTRAINTS PURGE;



DROP TABLE manager CASCADE CONSTRAINTS PURGE;



DROP TABLE wine CASCADE CONSTRAINTS PURGE;



DROP TABLE today CASCADE CONSTRAINTS PURGE;



DROP TABLE theme CASCADE CONSTRAINTS PURGE;



DROP TABLE wine_type CASCADE CONSTRAINTS PURGE;



DROP TABLE nation CASCADE CONSTRAINTS PURGE;



CREATE TABLE grade_pt_rade
(
	mem_grade            VARCHAR2(30) NOT NULL ,
	grade_pt_rate        NUMBER(3,2) NULL 
);



CREATE UNIQUE INDEX XPK회원_등급별_마일리지 ON grade_pt_rade
(mem_grade   ASC);



ALTER TABLE grade_pt_rade
	ADD CONSTRAINT  XPK회원_등급별_마일리지 PRIMARY KEY (mem_grade);



CREATE TABLE manager
(
	manager_id           VARCHAR2(30) NOT NULL ,
	manager_pwd          VARCHAR2(20) NOT NULL ,
	manager_tel          VARCHAR2(20) NULL 
);



CREATE UNIQUE INDEX XPK관리자정보 ON manager
(manager_id   ASC);



ALTER TABLE manager
	ADD CONSTRAINT  XPK관리자정보 PRIMARY KEY (manager_id);



CREATE TABLE member
(
	mem_id               VARCHAR2(6) NOT NULL ,
	mem_grade            VARCHAR2(20) NULL ,
	mem_pw               VARCHAR2(30) NOT NULL ,
	mem_birth            DATE DEFAULT  sysdate  NOT NULL ,
	mem_tel              VARCHAR2(20) NULL ,
	mem_pt               VARCHAR2(10) NOT NULL 
);



CREATE UNIQUE INDEX XPK회원정보 ON member
(mem_id   ASC);



ALTER TABLE member
	ADD CONSTRAINT  XPK회원정보 PRIMARY KEY (mem_id);



CREATE TABLE nation
(
	nation_code          VARCHAR2(26) NOT NULL ,
	nation_name          VARCHAR2(50) NOT NULL 
);



CREATE UNIQUE INDEX XPK국가정보 ON nation
(nation_code   ASC);



ALTER TABLE nation
	ADD CONSTRAINT  XPK국가정보 PRIMARY KEY (nation_code);



CREATE TABLE sale
(
	sale_date            DATE DEFAULT  sysdate  NOT NULL ,
	wine_code            VARCHAR2(6) NOT NULL ,
	sale_amount          VARCHAR2(5) NOT NULL ,
	sale_price           VARCHAR2(6) NOT NULL ,
	sale_tot_price       VARCHAR2(15) NOT NULL ,
	mem_id               VARCHAR2(30) NOT NULL 
);



CREATE UNIQUE INDEX XPK구매 ON sale
(sale_date   ASC);



ALTER TABLE sale
	ADD CONSTRAINT  XPK구매 PRIMARY KEY (sale_date);



CREATE TABLE stock_mamagement
(
	stock_code           VARCHAR2(6) NOT NULL ,
	wine_code            VARCHAR2(26) NULL ,
	ware_date            DATE DEFAULT  sysdate  NOT NULL ,
	stock_amount         NUMBER(5) DEFAULT  0  NOT NULL ,
	manager_id           VARCHAR2(30) NOT NULL 
);



CREATE UNIQUE INDEX XPK재고정보 ON stock_mamagement
(stock_code   ASC);



ALTER TABLE stock_mamagement
	ADD CONSTRAINT  XPK재고정보 PRIMARY KEY (stock_code);



CREATE TABLE theme
(
	theme_code           VARCHAR2(6) NOT NULL ,
	theme_name           VARCHAR2(50) NOT NULL 
);



CREATE UNIQUE INDEX XPK와인_테마 ON theme
(theme_code   ASC);



ALTER TABLE theme
	ADD CONSTRAINT  XPK와인_테마 PRIMARY KEY (theme_code);



CREATE TABLE today
(
	today_code           VARCHAR2(6) NOT NULL ,
	today_sens_value     NUMBER(3) NULL ,
	today_intell_value   NUMBER(3) NULL ,
	today_phy_value      NUMBER(3) NULL 
);



CREATE UNIQUE INDEX XPK오늘의_와인정보 ON today
(today_code   ASC);



ALTER TABLE today
	ADD CONSTRAINT  XPK오늘의_와인정보 PRIMARY KEY (today_code);



CREATE TABLE wine
(
	wine_code            VARCHAR2(26) NOT NULL ,
	wine_name            VARCHAR2(100) NOT NULL ,
	wine_url             BLOB NULL ,
	nation_code          VARCHAR2(26) NULL ,
	wine_type_code       VARCHAR2(6) NULL ,
	wine_sugar_code      NUMBER(2) NULL ,
	wine_price           NUMBER(15) NOT NULL ,
	wine_vintage         DATE NULL ,
	theme_code           VARCHAR2(6) NULL ,
	today_code           VARCHAR2(6) NULL 
);



CREATE UNIQUE INDEX XPK와인정보 ON wine
(wine_code   ASC);



ALTER TABLE wine
	ADD CONSTRAINT  XPK와인정보 PRIMARY KEY (wine_code);



CREATE TABLE wine_type
(
	wine_type_code       VARCHAR2(6) NOT NULL ,
	wine_type_name       VARCHAR2(50) NULL 
);



CREATE UNIQUE INDEX XPK와인종류정보 ON wine_type
(wine_type_code   ASC);



ALTER TABLE wine_type
	ADD CONSTRAINT  XPK와인종류정보 PRIMARY KEY (wine_type_code);



ALTER TABLE member
	ADD (CONSTRAINT R_6 FOREIGN KEY (mem_grade) REFERENCES grade_pt_rade (mem_grade) ON DELETE SET NULL);



ALTER TABLE sale
	ADD (CONSTRAINT R_3 FOREIGN KEY (mem_id) REFERENCES member (mem_id));



ALTER TABLE sale
	ADD (CONSTRAINT R_5 FOREIGN KEY (wine_code) REFERENCES wine (wine_code) ON DELETE SET NULL);



ALTER TABLE stock_mamagement
	ADD (CONSTRAINT R_14 FOREIGN KEY (wine_code) REFERENCES wine (wine_code) ON DELETE SET NULL);



ALTER TABLE stock_mamagement
	ADD (CONSTRAINT R_15 FOREIGN KEY (manager_id) REFERENCES manager (manager_id) ON DELETE SET NULL);



ALTER TABLE wine
	ADD (CONSTRAINT R_8 FOREIGN KEY (nation_code) REFERENCES nation (nation_code) ON DELETE SET NULL);



ALTER TABLE wine
	ADD (CONSTRAINT R_9 FOREIGN KEY (wine_type_code) REFERENCES wine_type (wine_type_code) ON DELETE SET NULL);



ALTER TABLE wine
	ADD (CONSTRAINT R_10 FOREIGN KEY (theme_code) REFERENCES theme (theme_code) ON DELETE SET NULL);



ALTER TABLE wine
	ADD (CONSTRAINT R_11 FOREIGN KEY (today_code) REFERENCES today (today_code) ON DELETE SET NULL);