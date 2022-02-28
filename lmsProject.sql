use project;
-- 회원 테이블
create table User( 
userNo Integer primary key auto_increment,
userId varchar(30) unique,
userPwd varchar(30) not null,
userName varchar(20),
email varchar(40),
phoneNo varchar(30),
subjectName varchar(20), -- 과목 이름
division int -- 강사인지 학생인지 나누기, 강사면 1 , 학생이면 0
);
desc user;
select * from user;
drop table user;
-- 공지사항
create table notice( 
boardNo Integer primary key auto_increment,
userId varchar(30),
title varchar(40),
content varchar(500),
regDate datetime default current_timestamp,
hit Integer default 0
);
drop table notice;
select * from notice;
select * from user;

-- 댓글
create table comments( 
commentsNo Integer primary key auto_increment,
userId varchar(30),
content varchar(500),
regDate datetime default current_timestamp,
boardNo int
);
select * from comments;
select * from comments where boardNo=6
group by regDate
order by regDate desc
;

commit;

drop table comments;

create table homework( -- 과제
homeworkNo Integer primary key auto_increment,
userId varchar(30),
title varchar(35),
content varchar(500),
deadline date,
regDate datetime default current_timestamp,
subjectName varchar(30)
);

desc homework;

select * from Anotice;
select * from comments;
select count(*) from comments where boardNo=7;

select * from syllabus; -- 강의 계획서

create table datalab( -- 자료실
boardNo Integer primary key auto_increment,
userId varchar(30),
title varchar(40),
content varchar(500),
fileName varchar(50),
regDate datetime default current_timestamp
);
select * from datalab;
drop table datalab;
delete from datalab where boardNo=null;