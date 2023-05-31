CREATE DATABASE DrugstoreApp;

USE DrugstoreApp;

CREATE TABLE Owners (
  Id INT IDENTITY(1,1) PRIMARY KEY,
  Name NVARCHAR(50) NOT NULL,
  Surname NVARCHAR(50) NOT NULL
);

INSERT INTO Owners (Name, Surname)
VALUES ('some', 'owner');

CREATE TABLE Drugstores (
  Id INT IDENTITY(1,1) PRIMARY KEY,
  Name NVARCHAR(50) NOT NULL,
  Address NVARCHAR(255) NOT NULL,
  ContactNumber DECIMAL(20,2),
  CreationDate DATE DEFAULT GETDATE(),
  OwnerId INT FOREIGN KEY REFERENCES Owners(Id)
);

INSERT INTO Drugstores (Name, Address, ContactNumber)
VALUES ('Pharmacy', 'some street', '234234234');

CREATE TABLE Druggists (
  Id INT IDENTITY(1,1) PRIMARY KEY,
  Name NVARCHAR(50) NOT NULL,
  Surname NVARCHAR(50) NOT NULL,
  Age INT,
  Experience INT,
  DrugstoreId INT FOREIGN KEY REFERENCES Drugstores(Id)
);

INSERT INTO Druggists (Name, Surname, Age, Experience)
VALUES ('some', 'druggist', 30, 1);

CREATE TABLE Drugs (
  Id INT IDENTITY(1,1) PRIMARY KEY,
  Name NVARCHAR(255) NOT NULL,
  Price FLOAT,
  Count INT,
  DrugstoreId INT FOREIGN KEY REFERENCES Drugstores(Id)
);

INSERT INTO Drugs (Name, Price, Count)
VALUES ('drug', 4.99, 101);

SELECT * FROM Owners;

SELECT * FROM Drugstores;

SELECT * FROM Druggists;

SELECT * FROM Drugs;