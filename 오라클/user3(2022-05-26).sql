-- USER3
INSERT INTO tbl_student(st_num, st_name, st_grade, st_addr, st_tel);

DROP TABLE tbl_user;

CREATE TABLE tbl_user (
    username VARCHAR(30)    PRIMARY KEY,
    password VARCHAR(128)   NOT NULL,
    name     nVARCHAR2(20),
    email    VARCHAR2(125),
    role     VARCHAR2(10)
)


