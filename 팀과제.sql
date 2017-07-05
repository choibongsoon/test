CREATE TABLE major(
    majorcode CHAR(10) PRIMARY KEY,
    majorname VARCHAR2(30) NOT NULL
)

CREATE TABLE student(
    snum CHAR(10) PRIMARY KEY,
    sname CHAR(12) NOT NULL,
    sphone CHAR(11),
    saddress VARCHAR2(60),
    majorcode CHAR(10),
    sgrade CHAR(1) NOT NULL,
    foreign key (majorcode)--( 해당 테이블에서 FK로 셋팅 할 컬럼 )
    references major(majorcode)--참조되는 테이블명(참조되는 테이블의 컬럼)
)

CREATE TABLE takelecture(
    subjectcode CHAR(10),
    teachercode CHAR(10),
    classnum char(2),
    classroom  varchar2(18),
    PRIMARY KEY (subjectcode, teachercode)
)
create table teacher(
    teachercode char(10) primary key,
    teachername varchar2(30) not null,
    majorcode char(10),
    foreign key (majorcode)--( 해당 테이블에서 FK로 셋팅 할 컬럼 )
    references major(majorcode)--참조되는 테이블명(참조되는 테이블의 컬럼)
)
--select * from tab; 
create table lecture (
    subjectcode char(10),
    teachercode char(10),
    snum char(10),
    ranking int check(ranking between 1 and 100),
    lecturegrade char(2) not null,
    PRIMARY KEY (subjectcode, teachercode ,snum)
)


create table subject(
    subjectcode char(10) primary key,
    subjectname varchar2(30) not null,
    course varchar2(30) not null
)

--//--조인하기!
SELECT * FROM student INNER JOIN lecture
ON student.snum = lecture.snum;

SELECT * FROM major INNER JOIN teacher
ON major.majorcode = teacher.majorcode;

SELECT * FROM takelecture INNER JOIN teacher
ON takelecture.teachercode = teacher.teachercode;

--// 조인 3개하기!
SELECT * FROM major INNER JOIN teacher ON major.majorcode = teacher.majorcode
INNER JOIN takelecture ON takelecture.teachercode = teacher.teachercode;

--// 조인 4개하기!
SELECT * FROM major INNER JOIN teacher ON major.majorcode = teacher.majorcode
INNER JOIN takelecture ON takelecture.teachercode = teacher.teachercode
--INNER JOIN lecture ON takelecture
