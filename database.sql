use wetbat;
GO

IF OBJECT_ID( 'Quotes', 'U') IS NOT NULL
DROP TABLE Quotes
GO

IF OBJECT_ID( 'TravellerGroups', 'U') IS NOT NULL
DROP TABLE TravellerGroups
GO

IF OBJECT_ID('Travellers', 'U') IS NOT NULL
DROP TABLE Travellers
GO

IF OBJECT_ID('Users', 'U') IS NOT NULL
DROP TABLE Users
GO

IF OBJECT_ID('Contacts', 'U') IS NOT NULL
DROP TABLE Contacts
GO

IF OBJECT_ID('Groups', 'U') IS NOT NULL
DROP TABLE Groups
GO

IF OBJECT_ID('VehicleRates', 'U') IS NOT NULL
DROP TABLE VehicleRates
GO

IF OBJECT_ID('Trips', 'U') IS NOT NULL
DROP TABLE Trips
GO

IF OBJECT_ID('PickupLocations', 'U') IS NOT NULL
DROP TABLE PickupLocations
GO

IF OBJECT_ID('Locations', 'U') IS NOT NULL
DROP TABLE Locations
GO

CREATE TABLE Contacts
(
    Id UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
    Address [NVARCHAR](100) NOT NULL,
    Phone [NVARCHAR](15) NOT NULL
);
GO

INSERT INTO Contacts
( 
 [Id], [Address], Phone
)
VALUES
(
 '8ebdf679-f2e7-4a26-a94f-69598792a687', '123 Kensington Dr, SE, Calgary, AB', '+14031131113'
),
( 
 '907a2259-7236-47b5-83d2-e2ff4e46bce1', '456 5th Street, SE, Calgary, AB', '+14039998888'
)

GO

SELECT * FROM Contacts;
GO

CREATE TABLE Users
(
    Id UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
    FirstName [NVARCHAR](20) NOT NULL,
    LastName [NVARCHAR](20) NOT NULL,
    MiddleName [NVARCHAR](20) NULL,
    ContactId UNIQUEIDENTIFIER FOREIGN KEY REFERENCES Contacts(Id)
    
);
GO

INSERT INTO Users
( 
 [Id], FirstName, [LastName], MiddleName, ContactId
)
VALUES
(
 'adde9769-37c4-4a04-9fcb-f38ff6194ed5', 'Ani', 'Hovsep', NULL, '8ebdf679-f2e7-4a26-a94f-69598792a687'
),
( 
 'e628cd88-c54b-43e6-9a66-13a5171c461a', 'Vartan', 'Gohar', NULL, '8ebdf679-f2e7-4a26-a94f-69598792a687'
),
( 
 '080bc4a6-0487-441a-8b41-c5ef3c5ad734', 'Vartouhi', 'Geghard', NULL, '907a2259-7236-47b5-83d2-e2ff4e46bce1'
),
( 
 'a5552c00-e6e3-4420-b895-cbe45f786edf', 'Armen', 'Siranush', NULL, '907a2259-7236-47b5-83d2-e2ff4e46bce1'
)

GO

SELECT * FROM Users
GO

IF OBJECT_ID('Travellers', 'U') IS NOT NULL
DROP TABLE Travellers
GO

CREATE TABLE Travellers
(
    Id UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
    UserId UNIQUEIDENTIFIER FOREIGN KEY REFERENCES Users(Id),
    IsResponsibleParty BIT NOT NULL
    
);
GO
INSERT INTO Travellers
( 
 [Id], [UserId], [IsResponsibleParty]
)
VALUES
(
 '9a88d9ff-f175-4972-88b3-797bce9c8dcc', 'e628cd88-c54b-43e6-9a66-13a5171c461a', 1
),
( 
 '19163971-32d3-4a81-99d1-a1f1cfec7917', 'adde9769-37c4-4a04-9fcb-f38ff6194ed5', 0
),
(
 'b8bd5032-d327-47b3-a7ff-5e2ebcd39848', '080bc4a6-0487-441a-8b41-c5ef3c5ad734', 1
),
( 
 '555cad1a-fd22-4c91-abc8-77e4879b9f1a', 'a5552c00-e6e3-4420-b895-cbe45f786edf', 0
)

GO

SELECT * FROM Travellers
GO

GO

IF OBJECT_ID('Groups', 'U') IS NOT NULL
DROP TABLE Groups
GO

CREATE TABLE Groups
(
    Id UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
    GroupDescription NVARCHAR(50) NULL,
    
);
GO
INSERT INTO Groups
( 
 [Id], GroupDescription
)
VALUES
(
 'a7f458a4-8414-4558-a01a-5c023a309a18', 'Group 1'
),
( 
 '74d14ed7-95ea-414b-bea5-b01e60afb979', 'Group 2'
)

GO


IF OBJECT_ID('TravellerGroups', 'U') IS NOT NULL
DROP TABLE TravellerGroups
GO

CREATE TABLE TravellerGroups
(
    Id UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
    GroupId UNIQUEIDENTIFIER FOREIGN KEY REFERENCES Groups(Id),
    TravellerId UNIQUEIDENTIFIER FOREIGN KEY REFERENCES Travellers(Id),
    
);

GO 
INSERT INTO TravellerGroups
( 
 Id, GroupId, TravellerId
)
VALUES
(
 '63e84e93-3c98-4f84-aa4d-0fe43d9e1d16', 'a7f458a4-8414-4558-a01a-5c023a309a18', 'b8bd5032-d327-47b3-a7ff-5e2ebcd39848'
),
( 
 'a8fc9451-5573-488f-857b-155aabac2bca', 'a7f458a4-8414-4558-a01a-5c023a309a18', '555cad1a-fd22-4c91-abc8-77e4879b9f1a'
),
( 
 'cf1a71ac-321e-4b38-8dbb-172077fdec7b', '74d14ed7-95ea-414b-bea5-b01e60afb979', '9a88d9ff-f175-4972-88b3-797bce9c8dcc'
),
( 
 '58dc6280-dab8-447e-a8bb-9726a7513ff6', '74d14ed7-95ea-414b-bea5-b01e60afb979', '19163971-32d3-4a81-99d1-a1f1cfec7917'
)

GO

SELECT * FROM TravellerGroups;

GO

IF OBJECT_ID('Locations', 'U') IS NOT NULL
DROP TABLE Locations
GO

CREATE TABLE Locations
(
    Id UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
    CityName [NVARCHAR](50) NOT NULL,
    Country [NVARCHAR](50) NOT NULL,
    Currency INT NOT NULL,
    
);
GO

INSERT INTO Locations
( 
 Id, CityName, Country, Currency
)
VALUES
(
 'db313663-36d7-455b-917f-75b55672ca07', 'Calgary', 'Canada', 1
),
( 
 'e2a7c9a1-d4f3-4d2e-95b7-9b2544a7568f', 'Vancouver', 'Canada', 1
),
( 
 '2ae5c84a-1601-4a93-ace2-6559da48d5c3', 'Los Angeles', 'US', 0
),
( 
 '4355178d-6f44-4583-8576-6f08b83a1853', 'New York', 'US', 0
),
( 
 '543cc091-9870-42e8-8df9-a7fb008b817c', 'Cancun', 'Mexico', 2
),
( 
 'e4c11c37-ed85-41dd-815a-addc988fe535', 'Paris', 'France', 3
),
( 
 '0f944f30-fb92-451b-beab-4f7955ecdfc5', 'Barcelona', 'Spain', 3
)

GO

SELECT * FROM Locations
GO

IF OBJECT_ID('PickupLocations', 'U') IS NOT NULL
DROP TABLE PickupLocations
GO

CREATE TABLE PickupLocations
(
    Id UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
    Name [NVARCHAR](100) NOT NULL,
    Code [NVARCHAR](3) NOT NULL,
    LocationId UNIQUEIDENTIFIER FOREIGN KEY REFERENCES Locations(Id) ,
    
);
GO

INSERT INTO PickupLocations
( 
 Id, Name, Code, LocationId
)
VALUES
(
 'dc749cbb-3bdc-42f3-8fb7-122a27fe597f', 'Calgary International Airport', 'YYC', 'db313663-36d7-455b-917f-75b55672ca07'
),
( 
 '431d6d6f-34da-45d5-b135-144f812fd70f', 'Vancouver', 'YVR', 'e2a7c9a1-d4f3-4d2e-95b7-9b2544a7568f'
),
( 
 'fed3a443-a58e-4f50-839b-076180f6d037', 'Los Angeles', 'LAX', '2ae5c84a-1601-4a93-ace2-6559da48d5c3'
),
( 
 'f20cc9de-2af7-42c6-9506-83640b61f194', 'New York', 'JFK', '4355178d-6f44-4583-8576-6f08b83a1853'
),
( 
 'fce4a66c-1e0d-484a-a601-da2d551102d5', 'Cancun', 'CUN', '543cc091-9870-42e8-8df9-a7fb008b817c'
),
( 
 '57045d04-8eb9-451e-892b-e01303dabcf1', 'Paris', 'CDG', 'e4c11c37-ed85-41dd-815a-addc988fe535'
),
( 
 '1b010590-2c5c-4b44-966b-7b2f047ea285', 'Barcelona', 'BCN', '0f944f30-fb92-451b-beab-4f7955ecdfc5'
)

GO

SELECT * FROM PickupLocations
GO

IF OBJECT_ID('Trips', 'U') IS NOT NULL
DROP TABLE Trips
GO

CREATE TABLE Trips
(
    Id UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
    Departure UNIQUEIDENTIFIER FOREIGN KEY REFERENCES PickupLocations(Id),
    Destination UNIQUEIDENTIFIER FOREIGN KEY REFERENCES PickupLocations(Id),
    StartDate DATETIME NOT NULL,
    ToDate DATETIME NOT NULL
    
);
GO

INSERT INTO Trips
( 
 Id, Departure, Destination, StartDate, ToDate
)
VALUES
(
 'b8d9a978-35f2-40b7-b77f-064d46e48f3c', '1b010590-2c5c-4b44-966b-7b2f047ea285', 'f20cc9de-2af7-42c6-9506-83640b61f194', '2020-06-29', '2020-07-29'
),
( 
 '9f593545-8081-495a-8cdf-b196b8ec1c3b', 'fce4a66c-1e0d-484a-a601-da2d551102d5', '57045d04-8eb9-451e-892b-e01303dabcf1', '2020-07-29', '2020-08-15'
),
( 
 '97909ac2-b102-4241-8336-e373bf46543b', 'fed3a443-a58e-4f50-839b-076180f6d037', 'dc749cbb-3bdc-42f3-8fb7-122a27fe597f', '2020-07-12', '2020-08-01'
),
( 
 'a520af9e-df64-48d8-b255-ee65a6ab8f7d', '431d6d6f-34da-45d5-b135-144f812fd70f', '1b010590-2c5c-4b44-966b-7b2f047ea285', '2020-08-25', '2020-09-15'
),
( 
 '92e62d17-930c-4f3e-9ed9-f425ece677bb', '1b010590-2c5c-4b44-966b-7b2f047ea285', 'fce4a66c-1e0d-484a-a601-da2d551102d5', '2020-10-01', '2020-10-15'
),
( 
 '08f5cf52-b0b1-452e-b2d0-f78c1b9ad4c2', 'fce4a66c-1e0d-484a-a601-da2d551102d5', '57045d04-8eb9-451e-892b-e01303dabcf1', '2020-08-25', '2020-09-05'
),
( 
 'f4426c91-6205-4947-ada5-fc4772243ff1', 'fed3a443-a58e-4f50-839b-076180f6d037', 'fed3a443-a58e-4f50-839b-076180f6d037', '2020-11-26', '2020-12-15'
)

GO

SELECT * FROM Trips

GO

IF OBJECT_ID( 'VehicleRates', 'U') IS NOT NULL
DROP TABLE VehicleRates
GO

CREATE TABLE VehicleRates
(
    Id UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
    Vehicle INT NOT NULL,
    Currency INT NOT NULL,
    Amount DECIMAL NOT NULL
    
);
GO

INSERT INTO VehicleRates
( 
 Id, [Vehicle], [Currency], Amount
)
VALUES
(
 '3cee77ba-8c80-4d8d-871f-1793418eb707', 1, 1, 20.0
),
( 
 'e46a2971-085d-4ef2-895f-32e5d88ce6b4', 1, 2, 15.0
),
( 
 '4e09b257-c1bb-485b-83bb-5b498629548d', 2, 1, 18.0
),
( 
 '1d4bae5d-5277-4aa7-8872-0fc8ccd20153', 2, 2, 13.0
),
( 
 'adcae085-e4bf-45ab-82f0-79a9639ef89b', 3, 1, 123.0
),
( 
 '13b3adbb-c590-49bb-bb7b-b501d7f10db4', 3, 2, 31.0
),
( 
 '0cae78f2-67cd-4e75-a4f5-c3bfbd4b480e', 4, 1, 15.0
),
( 
 '61cb61d0-2bd4-4714-9ce8-cce1a1760a8b', 4, 2, 13.0
)


SELECT * FROM VehicleRates;


GO

CREATE TABLE Quotes
(
    Id UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
    TripId UNIQUEIDENTIFIER NOT NULL FOREIGN KEY REFERENCES Trips(Id),
    VehicleRateId UNIQUEIDENTIFIER FOREIGN KEY REFERENCES VehicleRates(Id),
    GroupId UNIQUEIDENTIFIER NOT NULL FOREIGN KEY REFERENCES Groups(Id),
    Amount DECIMAL NOT NULL,
    Status INT NOT NULL
    
);
GO

INSERT INTO Quotes
( 
 Id, [TripId], [VehicleRateId], GroupId, Amount, [Status]
)
VALUES
(
 NEWID(), 'b8d9a978-35f2-40b7-b77f-064d46e48f3c', '3cee77ba-8c80-4d8d-871f-1793418eb707', 'a7f458a4-8414-4558-a01a-5c023a309a18', 1250, 0
),
(
 NEWID(), '9f593545-8081-495a-8cdf-b196b8ec1c3b', 'e46a2971-085d-4ef2-895f-32e5d88ce6b4', '74d14ed7-95ea-414b-bea5-b01e60afb979', 6658, 1
),
(
 NEWID(), '97909ac2-b102-4241-8336-e373bf46543b', '4e09b257-c1bb-485b-83bb-5b498629548d', 'a7f458a4-8414-4558-a01a-5c023a309a18', 4126, 2
),
(
 NEWID(), 'a520af9e-df64-48d8-b255-ee65a6ab8f7d', 'adcae085-e4bf-45ab-82f0-79a9639ef89b', '74d14ed7-95ea-414b-bea5-b01e60afb979', 2225, 1
),
(
 NEWID(), '92e62d17-930c-4f3e-9ed9-f425ece677bb', '13b3adbb-c590-49bb-bb7b-b501d7f10db4', 'a7f458a4-8414-4558-a01a-5c023a309a18', 4752, 2
),
(
 NEWID(), '08f5cf52-b0b1-452e-b2d0-f78c1b9ad4c2', '0cae78f2-67cd-4e75-a4f5-c3bfbd4b480e', '74d14ed7-95ea-414b-bea5-b01e60afb979', 1470, 0
),
(
 NEWID(), 'f4426c91-6205-4947-ada5-fc4772243ff1', '61cb61d0-2bd4-4714-9ce8-cce1a1760a8b', 'a7f458a4-8414-4558-a01a-5c023a309a18', 3000, 2
)

GO