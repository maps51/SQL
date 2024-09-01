--1.
--creating tables book, Members, Borrowed_Books

create table book(
bookid int primary key,
bookname varchar2(50) not null unique, 
category varchar2(50) not null,
Author varchar2(50) not null,
Published_Year varchar2(50) not null,
Available_copies number(5) not null);

create table Members(
Member_id int primary key,
Name varchar2(50) not null,
Email varchar2(100) not null,
Join_Date date not null);

create table Borrowed_books(
Borrow_id int primary key,
Member_id int,
bookid int,
Borrow_date date,
Returned_date date,
foreign key (Member_id) references Members(Member_id),
foreign key (bookid) references book(bookid));

--2.
--adding fine column to Borrowed_books
alter table Borrowed_books add fine number(5,2) default 100.00;

--3.
--adding unique constraint to bookid and Member_id in
--table Borrowed_books

alter table Borrowed_books add constraint u_borrow unique(bookid, Member_id);

--4. 
--inserting rows into each table

--book table

insert into book values(1001, 'The 5 AM Club', 'Self-Help', 'Robin Sharma', 2021, 23);
insert into book values(1002, 'The Monk who sold his Ferrari', 'Self-Help', 'Robin Sharma', 2017, 20);
insert into book values(1003, 'Harry Potter: The Philosopher Stone', 'Fantasy', 'J.K. Rowling', 1995, 25);
insert into book values(1004, 'ABC Murders', 'Thriller', 'Agatha Chirstie', 1947, 29);
insert into book values(1005, 'The Devil Wears Prada', 'Comedy', 'Sarah J', 2008, 21);
insert into book values(1006, 'Lord of the Rings', 'Fantasy', 'J.R. Tolkien', 1967, 29);
insert into book values(1007, 'A Game of Thrones', 'Fantasy', 'George Martin', 1999, 26);
insert into book values(1008, 'Alice in Wonderland', 'Children Classics', 'Author_A', 1956, 31);
insert into book values(1009, 'Pride and Prejudice', 'Literature Classics', 'Jane Austen', 1789, 20);
insert into book values(1010, 'Wizard of OZ', 'Children Classics',  'Author_B', 1920, 19);

select * from book;

--Members table

insert into Members values (901, 'Deepika More', 'deemp23@gmail.com', 
to_date('2021-01-24','YYYY-MM-DD'));
insert into Members values (902, 'Anushka Jain', 'Ajain@gmail.com', 
to_date('2019-10-23','YYYY-MM-DD'));
insert into Members values (903, 'Sanika Dixit', 'sandy555@gmail.com', 
to_date('2019-02-09','YYYY-MM-DD'));
insert into Members values (904, 'Himanshu Dhawale', 'hd8989@gmail.com', 
to_date('2022-11-12','YYYY-MM-DD'));
insert into Members values (905, 'Sahil Chavan', 'slchavand6@gmail.com', 
to_date('2018-08-16','YYYY-MM-DD'));
insert into Members values (906, 'Priya Sharma', 'priya121211@gmail.com', 
to_date('2017-02-19','YYYY-MM-DD'));
insert into Members values (907, 'Nikil Singh', 'nn44@gmail.com', 
to_date('2021-10-13','YYYY-MM-DD'));
insert into Members values (908, 'Aditya Yadav', 'Ayadav@gmail.com', 
to_date('2020-11-08','YYYY-MM-DD'));
insert into Members values (909, 'Devarat Dixit', 'dexit23@gmail.com', 
to_date('2022-12-03','YYYY-MM-DD'));
insert into Members values (910, 'Rajesh Sharma', 'raj999@gmail.com', 
to_date('2019-06-23','YYYY-MM-DD'));

select * from Members;

--Borrowed_books 

insert into Borrowed_books values(1901, 902, 1001, 
to_date('2021-04-20','YYYY-MM-DD'), to_date('2021-05-04','YYYY-MM-DD'), 0.0);
insert into Borrowed_books values(1902, 905, 1005,
to_date('2019-04-18','YYYY-MM-DD'), to_date('2019-05-10','YYYY-MM-DD'), 150.0);
insert into Borrowed_books values(1903, 905, 1006,
to_date('2022-03-20','YYYY-MM-DD'), to_date('2022-04-03','YYYY-MM-DD'), 0.0);
insert into Borrowed_books values (1904, 904, 1003,
to_date('2023-10-21','YYYY-MM-DD'), to_date('2023-11-04','YYYY-MM-DD'), 0.0);
insert into Borrowed_books values(1905, 904, 1004,
to_date('2023-02-12','YYYY-MM-DD'), to_date('2023-02-26','YYYY-MM-DD'), 0.0);
insert into Borrowed_books values(1906, 907, 1003,
to_date('2022-04-20','YYYY-MM-DD'), to_date('2022-05-04','YYYY-MM-DD'), 0.0);
insert into Borrowed_books values(1907, 908, 1008,
to_date('2021-09-20','YYYY-MM-DD'), to_date('2021-10-04','YYYY-MM-DD'), 0.0);
insert into Borrowed_books values(1908, 909, 1010,
to_date('2023-09-20','YYYY-MM-DD'), to_date('2023-10-10','YYYY-MM-DD'), 200.0);
insert into Borrowed_books values(1909, 910, 1004,
to_date('2023-12-02','YYYY-MM-DD'), to_date('2023-12-18','YYYY-MM-DD'), 150.0);
insert into Borrowed_books values(1910, 903, 1007,
to_date('2020-07-20','YYYY-MM-DD'), to_date('2020-08-10','YYYY-MM-DD'), 200.0);

select * from Borrowed_books;

--5.
--update the number of copies of books after its borrowed

update book set Available_copies=20 where bookid=1005;
update book set Available_copies=22 where bookid=1001;
update book set Available_copies=28 where bookid=1006;
update book set Available_copies=23 where bookid=1003;
update book set Available_copies=27 where bookid=1004;
update book set Available_copies=30 where bookid=1008;
update book set Available_copies=18 where bookid=1010;
update book set Available_copies=25 where bookid=1007;

select * from book;

--6.
--inserting new borrowing row

insert into Borrowed_books values(1911, 903, 1004,
to_date('2021-05-12','YYYY-MM-DD'), to_date('2021-05-29','YYYY-MM-DD'), 150.0);

update book set Available_copies=26 where bookid=1004;

--7. 
--list of books borrowed by a specific member

select bookname from book where bookid in (select bookid from Borrowed_books where Member_id=905);

select bookname from book where bookid in (select bookid from Borrowed_books where Member_id=904);

--8.
--members who borrowed a specific book

select m.Name from Members m join
Borrowed_books b on 
m.Member_id=b.Member_id
where b.bookid=1003;

select m.Name from Members m join
Borrowed_books b on 
m.Member_id=b.Member_id
where b.bookid=1004;

--9.
--find bookname and Member Name from books that are overdue

select b.bookname, m.Name
from Borrowed_books bb
join book b on bb.bookid=b.bookid
join Members m on bb.Member_id=m.Member_id
where (bb.Returned_date - bb.Borrow_date)>14;

--10.
--most popular book category and
--category with the highest number of books borrowed

select b.category, count(bb.bookid) as Number_of_Borrow
from Borrowed_books bb
join book b on bb.bookid=b.bookid
group by b.category
order by Number_of_Borrow desc
fetch first 1 rows only;

select b.category, count(distinct bb.bookid) as each_category 
from Borrowed_books bb
join book b on bb.bookid=b.bookid
group by b.category
order by each_category desc
fetch first 1 rows only;

select b.category, count(bb.bookid) as Number_of_Borrow
from Borrowed_books bb
join book b on bb.bookid=b.bookid
group by b.category
order by Number_of_Borrow desc;

select b.category, count(distinct bb.bookid) as each_category 
from Borrowed_books bb
join book b on bb.bookid=b.bookid
group by b.category
order by each_category desc;

--11.
--total sum of fines and books that are overdue

select sum(fine) as total_amount from Borrowed_books;

select b.bookname, m.Name, bb.Borrow_date, bb.Returned_date,
(bb.Returned_date-bb.Borrow_date) as days_borrowed
from Borrowed_books bb
join book b on bb.bookid=b.bookid
join Members m on bb.Member_id=m.Member_id
where bb.Returned_date is not null
and (bb.Returned_date-bb.Borrow_date)>14;

--12.
--top 5 members who borrowed the most books 


select m.Name, count(bb.bookid) as no_borrow
from Borrowed_books bb
join Members m on bb.Member_id=m.Member_id
group by m.Name
order by no_borrow desc
fetch first 5 rows only;

--13.
--and memebrs who returned the books under 14 days
--and under 8 days

select b.bookname, m.Name
from Borrowed_books bb
join book b on bb.bookid=b.bookid
join Members m on bb.Member_id=m.Member_id
where (bb.Returned_date - bb.Borrow_date)<14;

select b.bookname, m.Name
from Borrowed_books bb
join book b on bb.bookid=b.bookid
join Members m on bb.Member_id=m.Member_id
where (bb.Returned_date - bb.Borrow_date)<8;

--14.
--remove a borrowing record when book is returned 

delete from Borrowed_books where borrow_id=1904;
