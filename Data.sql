Create database DBSong

go
use DBSong

--GO
--create table Admin(
-- id int identity primary key,
-- UserName nvarchar(100),
-- PassWord nvarchar(100),
-- DisplayName nvarchar(100)
--)
GO
create table Account(
 id int identity primary key,
 UserName nvarchar(150),
 Email nvarchar(100),
 DisplayName nvarchar(150),
 PassWord nvarchar(150),
 Type int default 0, -- 1 user premium && 0 user basic
 Permission nvarchar(5)
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
 idPlaylist int,
 foreign key (idUser) references Account (id),
 foreign key (idSinger) references Singer (id),
 foreign key (idAuthor) references Author (id),
 foreign key (idCategory) references Category (id),
 foreign key (idPlaylist) references Playlist (id),
)

GO
----Insert Admin-------
--insert Admin values()
--insert Admin values()

----Insert Account-------
insert into Account (UserName,Email,DisplayName,PassWord, Permission) values('spider','spiderman2012@gmail.com','Peter Parker','123456','User')
insert into Account (UserName,Email,DisplayName,PassWord, Permission) values('trung','admin@gmail.com','Trung','2108','Admin')

----Insert Author-------
insert into Author (Name,Age,Describe) values('ABC',25,'tro meo akjbdibvis bk jbkjdbjk')
insert into Author (Name,Age,Describe) values('XYZ',32,'tro meo a2kjbdibvis bk jbkjdbjk')

----Insert Category-------
insert into Category (Name) values('Rock')
insert into Category (Name) values('Pop')
insert into Category (Name) values('R&B')
insert into Category (Name) values('Ballah')

----Insert Playlist-------
insert into Playlist (Name, Describe, Listened) values('Loved','my playlist most the love',918232)
insert into Playlist (Name, Describe, Listened) values('Lo-fi','lofi music',13918232)

----Insert Singer-------
insert into Singer (Name, Age, Describe) values('Justin Bieber',27,'ksbjvlsgvkjsvgrsbhs')
insert into Singer (Name, Age, Describe) values('Longji Iam',22,'asdh weg64jt')

----Insert Song-------
insert into Song (Name, Duration, Published, Listened, idAuthor, idSinger, idCategory, idUser, idPlaylist) values('Babe',180,'10-08-2002',1294804435, 2, 1, 4, 1, 1)
insert into Song (Name, Duration, Published, Listened, idAuthor, idSinger, idCategory, idUser, idPlaylist) values('Babe',180,'10-08-2002',1294804435, 1, 2, 1, 1, 1)


------


CREATE PROC USP_Login
@userName nvarchar(100), @passWord nvarchar(100)
AS
BEGIN
	SELECT * FROM Account WHERE UserName = @userName AND PassWord = @passWord
END
GO


--Hiện bảng song

SELECT s.Name as 'Song Name', a.Name as 'Author', si.Name as 'Singer', s.Duration, s.Published, c.Name as 'Category' FROM Song as s, Category as c, Author as a, Singer as si
WHERE s.idAuthor = a.id and s.idCategory = c.id and s.idSinger = si.id