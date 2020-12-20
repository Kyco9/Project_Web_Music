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
 ImgUrl nvarchar(1000),
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
insert into Singer (Name, Age, Describe) values('Justin Bieber',22,'Young Singer')
insert into Singer (Name, Age, Describe) values('24KGoldn',22,'rapper')
insert into Singer (Name, Age, Describe) values('Jawsh 685',22,'Singer')

----Insert Song-------
insert into Song (Name, Duration, Published, Listened, idAuthor, idSinger, idCategory, idUser, idPlaylist, ImgUrl) values('Baby',180,'10-08-2002',12935, 2, 1, 2, 1, 1,'..\img\Music\1.jpg')
insert into Song (Name, Duration, Published, Listened, idAuthor, idSinger, idCategory, idUser, idPlaylist, ImgUrl) values('Savage Love',90,'10-08-2020',124435, 1, 3, 1, 1, 1, '..\img\Music\2.jpg')
insert into Song (Name, Duration, Published, Listened, idAuthor, idSinger, idCategory, idUser, idPlaylist, ImgUrl) values('Mood',80,'10-08-2002',12945, 1, 2, 1, 1, 1, '..\img\Music\3.jpg')
insert into Song (Name, Duration, Published, Listened, idAuthor, idSinger, idCategory, idUser, idPlaylist, ImgUrl) values('NOW Thats What I Call Christmas',80,'10-08-2015',4435, 1, 2, 1, 1, 1, '..\img\Music\1.jpg')
insert into Song (Name, Duration, Published, Listened, idAuthor, idSinger, idCategory, idUser, idPlaylist, ImgUrl) values('Slime & B',80,'10-08-2020',4435, 1, 1, 2, 2, 1, '..\img\Music\5.jpg')


------


CREATE PROC USP_Login
@userName nvarchar(100), @passWord nvarchar(100)
AS
BEGIN
	SELECT * FROM Account WHERE UserName = @userName AND PassWord = @passWord
END
GO


--Hiện bảng song

SELECT s.id as 'ID', s.Name as 'Song Name', si.Name as 'Singer', a.Name as 'Author', s.Duration, s.Published, c.Name as 'Category' FROM Song as s, Category as c, Author as a, Singer as si
WHERE s.idAuthor = a.id and s.idCategory = c.id and s.idSinger = si.id

select s.id, s.Name, si.Name as SingerName, a.Name as AuthorName, c.Name as CategoryName, Duration, convert(varchar(10), Published, 120) as Published1 from Song as s, Category as c, Author as a, Singer as si WHERE s.idAuthor = a.id and s.idCategory = c.id and s.idSinger = si.id

update Song set Name = 'asdasd', idCategory = 3 where id=12


DELETE FROM Song WHERE Name = 'Babe' AND idAuthor = '1' AND idSinger = '1' AND idCategory = '1' AND Duration = '1' AND Published = '2002-10-08'