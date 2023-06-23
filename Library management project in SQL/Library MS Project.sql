create database library_data;
show tables;
show databases;
use library_data;

create table readers
	(
		Reader_id varchar(6),
        First_name varchar(20),
        Middle_name varchar(20),
        Last_name varchar(20),
        City varchar(20),
        Mobile_no varchar(10),
        Occupation varchar(20),
        DOB date,
        constraint Reader_PK primary key(reader_id)
	);
    

INSERT INTO readers VALUES ('000001','Aniket','Vitthal','Andhale','Chh.Sambhajinagar','8432151416','Student','2003-03-08');
INSERT INTO readers VALUES ('000002','Aarav','raghav','Sharma','Chh.Sambhajinagar','8765432109','Student','2003-02-09');
INSERT INTO readers VALUES ('000003','Rahul','Prakash','Kumar','Chh.Sambhajinagar','8765432109','Service','1995-01-05');
INSERT INTO readers VALUES ('000004','Aniket','Prasad','Gupta ','Chh.Sambhajinagar','8432188416','Student','2003-09-06');
INSERT INTO readers VALUES ('000005','Akil','Adnan','Khan','Chh.Sambhajinagar','8765432109','Service','1996-07-04');
INSERT INTO readers VALUES ('000006','Rajesh','kiran','Patel','Chh.Sambhajinagar','8765432109','Student','2003-03-03');
INSERT INTO readers VALUES ('000007','Kavita','mahadev','Verma','Chh.Sambhajinagar','8765432195','Teacher','2000-03-06');
INSERT INTO readers VALUES ('000008','Kavita','Prasad','Shinde','Chh.Sambhajinagar','8432155666','Housewife','2000-09-08');
INSERT INTO readers VALUES ('000009','Suresh','Prakash','Kate','Chh.Sambhajinagar','8765432109','Student','2005-05-09');
INSERT INTO readers VALUES ('000010','Rajesh','jogindar','Singh','Chh.Sambhajinagar','8765432109','Teacher','1999-05-03');

show tables;
desc readers;
select * from readers;


create table Book
	(
		Book_id varchar(6),
        Book_name varchar(40),
        Book_domain varchar(30),
        constraint Book_id_PK primary key(Book_id)
	);


INSERT INTO Book VALUES ('B00001', 'The Alchemist', 'Story');
INSERT INTO Book VALUES ('B00002', 'Sapiens: A Brief History of Humankind', 'Non-Fiction');
INSERT INTO Book VALUES ('B00003', 'The Namesake', 'Fiction');
INSERT INTO Book VALUES ('B00004', 'The Guide', 'Story');
INSERT INTO Book VALUES ('B00005', 'The Immortals of Meluha', 'Fiction');
INSERT INTO Book VALUES ('B00006', 'The White Tiger', 'Story');

select * from book;

create table active_readers
	(
		Account_id varchar(6),
        Reader_id varchar(6),
        Book_id varchar(6),
        Account_type varchar(10),
        Account_status varchar(10),
        constraint active_readers_accountnum_PK primary key(Account_id),
        constraint account_reader_id_FK foreign key(Reader_id) references readers(Reader_id),
        constraint account_Book_id_FK foreign key(Book_id) references Book(Book_id)
	);
        
        
INSERT INTO active_readers VALUES ('A00001', '000001', 'B00001', 'Premium', 'Active');
INSERT INTO active_readers VALUES ('A00002', '000002', 'B00002', 'Regular', 'Active');
INSERT INTO active_readers VALUES ('A00003', '000003', 'B00002', 'Premium', 'Active');
INSERT INTO active_readers VALUES ('A00004', '000002', 'B00003', 'Premium', 'Active');
INSERT INTO active_readers VALUES ('A00005', '000006', 'B00002', 'Regular', 'Active');
INSERT INTO active_readers VALUES ('A00006', '000007', 'B00001', 'Premium', 'Suspended');
INSERT INTO active_readers VALUES ('A00007', '000007', 'B00001', 'Premium', 'Active');
INSERT INTO active_readers VALUES ('A00008', '000001', 'B00003', 'Regular', 'Terminated');
INSERT INTO active_readers VALUES ('A00009', '000003', 'B00002', 'Premium', 'Terminated');
INSERT INTO active_readers VALUES ('A00010', '000004', 'B00002', 'Regular', 'Active');

select * from active_readers;

create table Bookissue_details
	(
		issuenumber varchar(6),
        Account_id varchar(6),
        Book_id varchar(20),
        Book_name varchar(40),
        Numbers_of_book_issued int(7),
        constraint trandetails_tnumber_PK primary key(issuenumber),
        constraint trandetails_Accountnumber_FK foreign key(Account_id) references active_readers (Account_id)
	);
        
select * from Bookissue_details;


INSERT INTO Bookissue_details VALUES ('T00001', 'A00001', 'B00001', 'The Alchemist', 2);
INSERT INTO Bookissue_details VALUES ('ISS002', 'A00001', 'B00002', 'Sapiens: A Brief History of Humankind', 1);
INSERT INTO Bookissue_details VALUES ('ISS003', 'A00002', 'B00001', 'The Alchemist', 3);
INSERT INTO Bookissue_details VALUES ('ISS004', 'A00002', 'B00003', 'The Namesake', 2);

select * from active_readers;

select * from active_readers where Account_status='Active';

select count(Account_id) from active_readers where Account_type='premium';










