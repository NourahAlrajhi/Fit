use Fit;

create table Trainer(
Salary int(4) not null,
Name_ varchar(5) not null,
DOB date,
ID int not null,
Phone varchar(10) not null,
Experince varchar(10) not null,
Nationality varchar(10) not null,
primary key(ID));

insert into Trainer(Salary,Name_,DOB,ID,Phone,Experince,Nationality)
value(5600,'HUDA','1994-06-23',2243,0500427013,'4 years','Saudi');

insert into Trainer(Salary,Name_,DOB,ID,Phone,Experince,Nationality)
value(3200,'LAMA','1993-03-2',1343,0514870155,'6 years','Saudi');

insert into Trainer(Salary,Name_,DOB,ID,Phone,Experince,Nationality)
value(5000,'SARA','1994-12-08',1663,0531220106,'3 years','Saudi');

insert into Trainer(Salary,Name_,DOB,ID,Phone,Experince,Nationality)
value(3440,'MAHA','1995-03-12',2253,0510427013,'2 years','Saudi');

insert into Trainer(Salary,Name_,DOB,ID,Phone,Experince,Nationality)
value(3980,'AMAL','1996-12-14',4402,0510327621,'1 years','Saudi');

select *
from Trainer; 


create table Branch(
City varchar(20) not null,
Location varchar(20) not null,
Branch_num int not null,
Phone varchar(10) not null,
primary key(Branch_num));

insert into Branch(City,Location,Branch_num,Phone)
value('Riyadh','Almalqa',5,0510117621);

insert into Branch(City,Location,Branch_num,Phone)
value('Jeddah','Alssahafa',3,0550117003);

insert into Branch(City,Location,Branch_num,Phone)
value('Riyadh','Alwaha',4,0510712961);


insert into Branch(City,Location,Branch_num,Phone)
value('Altaif','Alhada',1,0560711990);

insert into Branch(City,Location,Branch_num,Phone)
value('Riyadh','Alrayan',2,0570721918);

select *
from Branch; 

create table studio(
Description_ varchar (200),
Name_ varchar(30) not null,
Capacity int(2) not null,
SBranch_num int not null,
primary key(Name_),
Foreign key (SBranch_num) references Branch(Branch_num)
);
insert into studio(Description_,Name_,Capacity,SBranch_num)
value('Cardio area','Studio1',20,5);

insert into studio(Description_,Name_,Capacity,SBranch_num)
value('Spinning area','Studio2',25,3);

insert into studio(Description_,Name_,Capacity,SBranch_num)
value('Functional training area','Studio3',35,2);

insert into studio(Description_,Name_,Capacity,SBranch_num)
value('Group exercise area','Studio4',20,1);

insert into studio(Description_,Name_,Capacity,SBranch_num)
value('Free weights area','Studio5',25,4);

select *
from studio; 

create table class(
Fee int(4) not null,
Name_ varchar(30) not null,
ID int not null,
Time_ time,
Date_ date,
Max_num_trainee int(2) not null,
TID int not null,
SName_ varchar(30) not null,
primary key(ID),
Foreign key (TID) references Trainer(ID),
Foreign key (SName_) references studio(Name_));

insert into class(Fee,Name_,ID,Time_,Date_,Max_num_trainee,TID,SName_)
value(50,'Cardio',2253,'08:00:00','2022-12-14',20,2243,'Studio1');

insert into class(Fee,Name_,ID,Time_,Date_,Max_num_trainee,TID,SName_)
value(35,'Ab Fit',2871,'04:00:00','2022-3-5',12,1343,'Studio5');

insert into class(Fee,Name_,ID,Time_,Date_,Max_num_trainee,TID,SName_)
value(60,'Yoga',1541,'03:00:00','2022-1-26',15,1663,'Studio3');

insert into class(Fee,Name_,ID,Time_,Date_,Max_num_trainee,TID,SName_)
value(150,'Zumba',3289,'01:00:00','2022-8-19',18,2253,'Studio4');

insert into class(Fee,Name_,ID,Time_,Date_,Max_num_trainee,TID,SName_)
value(80,'Spinning',8742,'06:00:00','2022-9-2',20,1343,'Studio2');

select *
from class; 


select T.Name_ ,T.Experince
from Trainer AS T
Where T.ID IN(
select C.TID
from class AS C
Where C.Max_num_trainee=20);




select Trainer.Experince, Trainer.Name_
from Trainer , Branch,studio,class
where Trainer.ID=class.TID AND class.SName_=studio.Name_ AND studio.SBranch_num=Branch.Branch_num AND Branch.City='Riyadh'
order by Trainer.Experince desc;


select T.Name_ , count(*)
from Trainer AS T , class AS C
where T.ID = C.TID
group by T.Name_;


select T.Name_ , C.ID
from Trainer AS T left outer join class AS C on T.ID = C.TID;


select B.Location , S.Name_
from Branch AS B left outer join studio AS S on B.Branch_num = S.SBranch_num;


update class
set Max_num_trainee=20
where ID=3289;
select *
from class; 



delete from Trainer
where ID=4402;
select *
from Trainer; 