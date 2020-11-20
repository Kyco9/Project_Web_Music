Create database DB_Song

go
use DB_Song
go

create table Account(
 id int identity primary key,
 UserName nvarchar(150),
 Email nvarchar(100),
 DisplayName nvarchar(150),
 PassWord nvarchar(150),
 Type int default 0, -- 1 user premium && 0 user basic
)
GO
create table Singer(
 id int identity primary key,
 Name nvarchar(100),
 Age int,
 Describe nvarchar(2000),
)
GO
create table Author(
 id int identity primary key,
 Name nvarchar(100),
 Age int,
 Describe nvarchar(2000)
)
GO
create table Category(
 id int identity primary key,
 Name nvarchar(50)
)
GO
create table Playlist(
 id int identity primary key,
 Name nvarchar(100),
 Describe nvarchar(2000),
 Listened int,
)
GO
create table Admin(
 idAdmin int identity primary key,
 UserName nvarchar(100),
 PassWord nvarchar(100),
 DisplayName nvarchar(100),

)
GO
create table Song(
 id int identity primary key,
 Name nvarchar(150),
 Duration int,
 Published date,
 Listened int,
 idUser int,
 idSinger int,
 idAuthor int,
 idCategory int,
 foreign key (idUser) references Account (id),
 foreign key (idSinger) references Singer (id),
 foreign key (idAuthor) references Author (id),
 foreign key (idCategory) references Category (id),
)

