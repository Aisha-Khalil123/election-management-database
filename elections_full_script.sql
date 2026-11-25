create database FinalProject;
use FinalProject;

create table Citizens(
SSN int PRIMARY KEY,
FirstName varchar(20) NOT NULL,
LastName varchar(20) NOT NULL,
DateOfBirth date NOT NULL, 
City varchar(20) NOT NULL,
StreetName varchar(20) NOT NULL,
BuildingNumber int NOT NULL,
Gender char(1) DEFAULT 'M' check(gender ='M' or gender= 'F'),
CandidateID int NOT NULL,
StationID int NOT NuLL,
Foreign key (CandidateID) REFERENCES Candidates(CandidateID) on update cascade on delete cascade,
Foreign key (StationID) REFERENCES Stations(StationID) on update cascade on delete cascade,
);
select * from Citizens;

create table Candidates(
CandidateID int PRIMARY KEY,
FirstName varchar(20) NOT NULL,
LastName varchar(20) NOT NULL,
VicePresident_First varchar(20) NOT NULL,
VicePresident_Last varchar(20) NOT NULL,
DateOfBirth date NOT NULL,
Email varchar(255) UNIQUE,
Biography text NOT NULL,
);
select * from Candidates;

create table Debates(
DebateID int PRIMARY KEY,
Time time NOT NULL,
Date date NOT NULL,
Place varchar(100),
);
select * from Debates;

create table Stations(
StationID int PRIMARY KEY,
Location varchar(20) NOT NULL,
Timing time NOT NULL,
);
alter table stations drop column Timing;
alter table stations add Opening time, Closing time ;
select * from Stations;

create table Citizens_PhoneNumber(
SSN int NOT NULL,
PhoneNumber int NOT NULL,
primary key (SSN, PhoneNumber),
Foreign key (SSN) REFERENCES Citizens(SSN) on update cascade on delete cascade, 
);
select * from Citizens_PhoneNumber;

create table Candidates_Debates(
CandidateID int NOT NULL,
DebateID int NOT NULL,
primary key (CandidateID, DebateID),
Foreign key (CandidateID) REFERENCES Candidates(CandidateID) on update cascade on delete cascade, 
Foreign key (DebateID) REFERENCES Debates(DebateID) on update cascade on delete cascade, 
);
select * from Candidates_Debates;

insert into citizens values
(11111, 'Ahmed', 'Mohammed', '2000-12-12', 'Tunis', 'Avenue Habib', 12, 'M', 1, 101),
(11112, 'Fatima', 'Ali', '1998-06-15', 'Sousse', 'Avenue Hedi', 3, 'F', 2, 102),
(11113, 'Anis', 'Ahmed', '2001-08-07', 'Tunis', 'Rue de Rome', 5, 'M', 3, 101),
(11114, 'Rania', 'Tarek', '1990-01-09', 'Sfax', 'Rue Mongi Slim', 8, 'F', 1, 103),
(11115, 'Karim', 'Mohammed', '1995-05-07', 'Hammamet', 'Avenue des Nations', 9, 'M', 2, 103),
(11116, 'Youssef', 'Hassan', '1992-03-14', 'Bizerte', 'Rue Marine', 10, 'M', 3, 101),
(11117, 'Laila', 'Omar', '1987-11-23', 'Monastir', 'Avenue Bourguiba', 22, 'F', 1, 102),
(11118, 'Samir', 'Nasser', '1999-07-19', 'Gabès', 'Rue Indépendance', 15, 'M', 2, 102),
(11119, 'Nour', 'Mahmoud', '2003-02-10', 'Kairouan', 'Avenue République', 17, 'F', 3, 103),
(11120, 'Hassan', 'Ibrahim', '1996-09-30', 'Gafsa', 'Boulevard Corniche', 20, 'M', 1, 103);
insert into Citizens values 
(11113, 'Anis', 'Ahmed', '2001-08-07', 'Tunis', 'Rue de Rome', 5, 'M', 3, 101);
insert into Citizens values--pk case
(NULL, 'Mounir', 'Salem', '1997-04-18', 'Tataouine', 'Avenue de la Liberté', 11, 'M', 2, 101);
insert into Citizens values--fk case non=exsistent pk
(1122, 'Mounir', 'Salem', '1997-04-18', 'Tataouine', 'Avenue de la Liberté', 11, 'M', 10, 101);
alter table citizens
drop constraint [FK__Citizens__Candid__44FF419A];
alter table Citizens 
add constraint fk_candidate foreign key (CandidateID) --add a new constraint
references Candidates(CandidateID) 
on delete no action on update no action;
insert into Citizens values--NOT NULL test
(1122, NULL, 'Salem', '1997-04-18', 'Tataouine', 'Avenue de la Liberté', 11, 'M', 10, 101);
insert into Citizens(SSN, FirstName, LastName, DateofBirth, City, Streetname, Buildingnumber, CandidateID, StationID) values--default test
(1122, 'Lara', 'Salem', '1997-04-18', 'Tataouine', 'Avenue de la Liberté', 11, 1, 101);



insert into Candidates values
(1, 'Ali', 'Khalil','Sara', 'Ahmed', '1975-04-12','ali.khalil@gmail.com',  'Ali Khalil is a prominent figure with a background in economics and public service. He has served as a regional governor and is known for his efforts in economic development and infrastructure improvement.'),
(2, 'Nadia', 'Moussa','Mohamed', 'Hassan', '1980-09-25','nadia.moussa@gmail.com', 'Nadia Moussa is a lawyer and human rights advocate. She has worked with several international organizations focusing on legal reforms and women’s rights. Her career is marked by her dedication to justice and equality.'),
(3,  'Omar', 'Youssef', 'Fatima', 'El-Masri', '1968-11-08','omar.youssef@example.com', 'Youssef is a veteran politician with extensive experience in legislative processes and international diplomacy. He has a strong track record in foreign relations and policy-making.');
insert into Candidates values--pk case
(3, 'Laila', 'Hassan', 'Khaled', 'Omar', '1985-06-15', 'laila.hassan@gmail.com', 'Laila Hassan is a former journalist and social entrepreneur.');
update Candidates set CandidateID=4--fk case
where CandidateID=3;
select * from Citizens;
select * from Candidates;
delete from Candidates where CandidateID=4;
insert into Candidates values 
(3,  'Omar', 'Youssef', 'Fatima', 'El-Masri', '1968-11-08','omar.youssef@gmail.com', 'Youssef is a veteran politician with extensive experience in legislative processes and international diplomacy. He has a strong track record in foreign relations and policy-making.');
update Candidates--on update no action
set CandidateID=4
where CandidateID=3;
insert into Candidates values --unique test
(4,  'Omar', 'Youssef', 'Fatima', 'El-Masri', '1968-11-08','omar.youssef@gmail.com', 'Youssef is a veteran politician with extensive experience in legislative processes and international diplomacy. He has a strong track record in foreign relations and policy-making.');

insert into Debates values
(1, '18:00:00', '2024-06-01', 'Tunis Convention Center'),
(2, '20:00:00', '2024-06-02', 'Sousse Town Hall'),
(3, '17:00:00', '2024-06-03', 'Hammamet Cultural Center');

insert into Stations values
(101, 'Tunis Station', '08:00:00', '18:00:00'),
(102, 'Sousse Station', '09:00:00', '19:00:00'),
(103, 'Hammamet Station', '07:30:00', '17:30:00');

insert into Citizens_PhoneNumber values
(11111, 21234567),  
(11111, 22345678),  
(11112, 23456789),
(11113, 24567890),  
(11113, 25678901),  
(11114, 26789012),
(11115, 27890123),
(11116, 28901234),  
(11116, 29012345), 
(11117, 30123456),
(11118, 31234567),
(11119, 32345678),
(11120, 33456789);  

INSERT INTO Candidates_Debates (CandidateID, DebateID) VALUES
(1, 1), 
(1, 2), 
(2, 1), 
(2, 3), 
(3, 2), 
(3, 3);

--first view 
CREATE VIEW CandidateVoteCount
AS SELECT c.CandidateID, c.FirstName, c.LastName, Count(v.SSN) NumberOfVotes
FROM Candidates c JOIN Citizens v  ON c.CandidateID = v.CandidateID
GROUP BY c.CandidateID, c.FirstName, c.LastName;
SELECT * from CandidateVoteCount;

--second view
CREATE VIEW StationVoterCount
AS SELECT s.StationID, s.Location, COUNT(v.SSN) NumberOfVoters
FROM Stations S JOIN Citizens v ON  s.StationID = v.StationID
GROUP BY s.StationID, s.Location;
SELECT * FROM StationVoterCount;

--first procedure
create procedure AddCitizen 
    @SSN int,
    @FirstName varchar(20),
    @LastName varchar(20),
    @DateOfBirth date,
    @City varchar(20),
    @StreetName varchar(20),
    @BuildingNumber int,
    @Gender char(1),
    @CandidateID int,
    @StationID int
AS
   insert into Citizens values(@SSN, @FirstName, @LastName, @DateOfBirth, @City, @StreetName, @BuildingNumber, @Gender, @CandidateID, @StationID);
   select * from Citizens;
GO
EXEC AddCitizen @SSN = 11121, @FirstName = 'Lara', @LastName = 'Hamza', @DateOfBirth = '2004-7-23',@City='Hammamet', @StreetName='Avenue des Nations', @BuildingNumber=6, @Gender='F', @CandidateID=2, @StationID=101;

--second procedure
create procedure getCandidateInfo @FirstName varchar(20)
AS
  select 
  c.CandidateID, c.FirstName, c.LastName, d.DebateID, d.Date, d.Time, d.Place
  from Candidates c 
  JOIN Candidates_Debates cd ON c.CandidateID = cd.CandidateID
  JOIN Debates d ON cd.DebateID=d.DebateID
  where FirstName=@FirstName;
 GO
 EXEC getCandidateInfo @FirstName='Ali'

 --users
CREATE LOGIN Candidate with password ='123';
CREATE USER Candidate for login Candidate;
GRANT SELECT ON Candidates TO Candidate;--view info
GRANT SELECT ON Candidates_Debates TO Candidate;--view debates
GRANT SELECT ON CandidateVoteCount TO Candidate;--view results


CREATE LOGIN Citizen with password ='123';
CREATE USER Citizen for login Citizen;
GRANT SELECT ON Candidates TO Citizen;--view candidates
GRANT SELECT ON CandidateVoteCount TO Citizen;--view results
GRANT SELECT ON Stations TO Citizen;--view stations
GRANT EXECUTE ON [dbo].[getCandidateInfo] TO Citizen;--view candidates info + debates


CREATE LOGIN Technician with password ='123';
CREATE USER Technician for login Technician;
GRANT SELECT, INSERT, UPDATE ON DATABASE::FinalProject TO Technician;
DROP USER Technician;

CREATE LOGIN Administrator with password ='123';
CREATE USER Administrator for login Administrator;
GRANT SELECT, INSERT, UPDATE, DELETE ON DATABASE::FinalProject TO Administrator WITH GRANT OPTION;
GRANT EXECUTE ON [dbo].[getCandidateInfo]TO Administrator ;
GRANT EXECUTE ON [dbo].[AddCitizen] TO Administrator ;
GRANT SELECT ON [dbo].[CandidateVoteCount] TO Administrator;
GRANT SELECT ON [dbo].[StationVoterCount]TO Administrator;

CREATE LOGIN StationAdministrator with password ='123';
CREATE USER StationAdministrator for login StationAdministrator;
GRANT SELECT ON [dbo].[StationVoterCount] TO StationAdministrator;
GRANT SELECT ON Citizens TO StationAdministrator;
GRANT SELECT ON Stations TO StationAdministrator;
GRANT INSERT, UPDATE ON Citizens TO StationAdministrator; 
GRANT UPDATE ON Stations TO StationAdministrator; 

--output validation
select * from Citizens;
select SSN, FirstName, LastName, StationID--where
from Citizens 
where StationID=101;

insert into Citizens values--insert 
(11122, 'Sahar', 'Jamal', '1994-11-05', 'Tataouine', 'Avenue de la Liberté', 6, 'F', 3, 101);

update Citizens --update
set SSN=11123
where SSN=1122;
select * from Citizens where SSN=11123;

delete from Citizens --delete
where SSN=11123;

select City, COUNT(City) NumberOfCitizens--group by
from Citizens
group by City;

