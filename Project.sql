create database sms;
use sms;

create table school(
school_id int(11) not null primary key,
school_name varchar(20),
details text(50),
address_id int(11)
);

create table teacher(
teacher_id int(11)not null primary key,
name varchar(20),
gender varchar(11),
qualification varchar(20),
phone_no int(11),
school_id int(11)
);

alter table teacher add constraint foreign key (school_id) references school (school_id);

create table students(
student_id int(11)not null primary key,
name varchar(20),
gender varchar(11),
DOB Date,
age int(11)
);

create table classes(
class_id int(11)not null primary key ,
sec_id int(11),
teacher_id int(11)
);

alter table classes add constraint foreign key (teacher_id) references teacher (teacher_id);

create table student_classes(
class_id int(11),
student_id int(11)
);

alter table student_classes add constraint foreign key (class_id) references classes (class_id);
alter table student_classes add constraint foreign key (student_id) references students (student_id);

create table subjects(
subject_id int(11) not null primary key,
subject_name varchar(20)
);

create table section(
section_id int(11) not null primary key,
section_name varchar(20),
subject_id int(11)
);
alter table section add constraint foreign key (subject_id) references subjects (subject_id);
alter table classes add constraint foreign key (sec_id) references section (section_id);

create table address(
address_id int(11) not null primary key,
details text(50)
);
alter table school add constraint foreign key (address_id) references address (address_id);

create table parents(
parent_id int(11)not null primary key,
name varchar(20),
phone_no int(11),
occupation varchar(20)
);

create table parent_address(
parent_id int(11),
address_id int(11)
);

alter table parent_address add constraint foreign key (address_id) references address (address_id);
alter table parent_address add constraint foreign key (parent_id) references parents (parent_id);

create table student_address(
student_id int(11),
address_id int(11)
);
alter table student_address add constraint foreign key (address_id) references address (address_id);
alter table student_address add constraint foreign key (student_id) references students (student_id);

create table reports(
report_id int(11) not null primary key,
student_id int(11),
total_marks int(11),
obtain_marks int(11),
grade varchar(11),
teacher_comment text(50)
);
alter table reports add constraint foreign key (student_id) references students (student_id);
create table fees(
challan_id int(11) not null primary key,
student_id int(11),
total_fee int(11),
payable_fee int(11),
remaining int(11),
due_date date
);
alter table fees add constraint foreign key (student_id) references students (student_id);

create table student_parents(
student_id int(11),
parent_id int(11)
);
alter table student_parents add constraint foreign key (student_id) references students (student_id);
alter table student_parents add constraint foreign key (parent_id) references parents (parent_id);

insert into students values(1,"UMAIR","M",'1998-05-1',20);
insert into students values(2,"KIRAN","F",'1998-06-5',19);
insert into students values(3,"SHAFAQ","F",'1999-08-12',20);
insert into students values(4,"TALHA","M",'1997-10-19',21);
insert into students values(5,"BILAL","M",'1998-01-14',17);

insert into reports values(1,5,100,80,"B-","good");
insert into reports values(2,4,100,85,"B","v.good");
insert into reports values(3,3,100,90,"A-","Excellent");
insert into reports values(4,2,100,95,"A","outclass");
insert into reports values(5,1,100,97,"A","keep it up");

insert into fees values(1,4,100000,50000,50000,"2019-06-05");
insert into fees values(2,3,110000,60000,50000,"2019-07-05");
insert into fees values(3,5,130000,60000,70000,"2019-08-02");
insert into fees values(4,2,120000,60000,60000,"2019-05-09");
insert into fees values(5,1,140000,70000,70000,"2019-06-05");

insert into subjects values(1,"OOAD");
insert into subjects values(2,"DB");
insert into subjects values(3,"LA");
insert into subjects values(4,"PROB");
insert into subjects values(5,"DE");

insert into section values(1,"A",3);
insert into section values(2,"B",4);
insert into section values(3,"C",2);
insert into section values(4,"D",2);
insert into section values(5,"E",5);

insert into parents values(1,"RAZA",4116623,"Designer");
insert into parents values(2,"NADEEM",4116227,"Engineer");
insert into parents values(3,"DURRANI",1246623,"BusinessMan");
insert into parents values(4,"EJAZ",9876623,"Teacher");
insert into parents values(5,"RIAZ",876623,"Principal");

insert into student_parents values(1,2);
insert into student_parents values(2,3);
insert into student_parents values(3,4);
insert into student_parents values(4,1);
insert into student_parents values(5,5);

insert into address values(1,"SAFARI PARK");
insert into address values(2,"JOHAR TOWN");
insert into address values(3,"WAPDA TOWN");
insert into address values(4,"TOWNSHIP");
insert into address values(5,"IQBAL TOWN");

insert into student_address values(1,5);
insert into student_address values(2,4);
insert into student_address values(3,3);
insert into student_address values(4,1);
insert into student_address values(5,2);

insert into parent_address values(1,5);
insert into parent_address values(2,4);
insert into parent_address values(3,3);
insert into parent_address values(4,4);
insert into parent_address values(5,5);

insert into School values(101,"M.N EDUCATION CAMPUS","ISLAMIA PARK BRANCH",1);

insert into parent_address values(1,5);