use wetbat;

GO
DROP TABLE Quotes
GO
DROP TABLE VehicleRates
GO
DROP TABLE Trips
GO
GO
DROP TABLE TravellerGroups;
GO
DROP TABLE Groups;
GO
DROP TABLE Travellers
GO
DROP TABLE users;
GO
DROP TABLE Contacts;
GO
DROP Table PickupLocations;
GO
DROP Table Locations;
-- Create a new table called 'Contacts'
-- Drop the table if it already exists
IF OBJECT_ID('Contacts', 'U') IS NOT NULL
DROP TABLE Contacts
GO
-- Create the table in the specified schema
CREATE TABLE Contacts
(
    Id UNIQUEIDENTIFIER NOT NULL PRIMARY KEY, -- primary key column
    Address [NVARCHAR](100) NOT NULL,
    Phone [NVARCHAR](15) NOT NULL
);
GO

-- Insert rows into table 'Contact'
INSERT INTO Contacts
( -- columns to insert data into
 [Id], [Address], Phone
)
VALUES
( -- first row: values for the columns in the list above
 '8ebdf679-f2e7-4a26-a94f-69598792a687', '123 Kensington Dr, SE, Calgary, AB', '+14031131113'
),
( -- second row: values for the columns in the list above
 '907a2259-7236-47b5-83d2-e2ff4e46bce1', '456 5th Street, SE, Calgary, AB', '+14039998888'
)
-- add more rows here
GO

-- Select rows from a Table or View 'Contact' in schema '
SELECT * FROM Contacts;
GO

-- Create a new table called 'User' in schema 
-- Drop the table if it already exists
IF OBJECT_ID('Users', 'U') IS NOT NULL
DROP TABLE Users
GO
-- Create the table in the specified schema
CREATE TABLE Users
(
    Id UNIQUEIDENTIFIER NOT NULL PRIMARY KEY, -- primary key column
    FirstName [NVARCHAR](20) NOT NULL,
    LastName [NVARCHAR](20) NOT NULL,
    MiddleName [NVARCHAR](20) NULL,
    ContactId UNIQUEIDENTIFIER FOREIGN KEY REFERENCES Contacts(Id)
    -- specify more columns here
);
GO

-- Insert rows into table 'Users'
INSERT INTO Users
( -- columns to insert data into
 [Id], FirstName, [LastName], MiddleName, ContactId
)
VALUES
( -- first row: values for the columns in the list above
 'adde9769-37c4-4a04-9fcb-f38ff6194ed5', 'Ani', 'Hovsep', NULL, '8ebdf679-f2e7-4a26-a94f-69598792a687'
),
( -- second row: values for the columns in the list above
 'e628cd88-c54b-43e6-9a66-13a5171c461a', 'Vartan', 'Gohar', NULL, '8ebdf679-f2e7-4a26-a94f-69598792a687'
),
( -- second row: values for the columns in the list above
 '080bc4a6-0487-441a-8b41-c5ef3c5ad734', 'Vartouhi', 'Geghard', NULL, '907a2259-7236-47b5-83d2-e2ff4e46bce1'
),
( -- second row: values for the columns in the list above
 'a5552c00-e6e3-4420-b895-cbe45f786edf', 'Armen', 'Siranush', NULL, '907a2259-7236-47b5-83d2-e2ff4e46bce1'
)
-- add more rows here
GO

-- Select rows from a Table or View 'Users' in schema  
SELECT * FROM Users
GO

-- Create a new table called 'Travellers' in schema 
-- Drop the table if it already exists
IF OBJECT_ID('Travellers', 'U') IS NOT NULL
DROP TABLE Travellers
GO
-- Create the table in the specified schema
CREATE TABLE Travellers
(
    Id UNIQUEIDENTIFIER NOT NULL PRIMARY KEY, -- primary key column
    UserId UNIQUEIDENTIFIER FOREIGN KEY REFERENCES Users(Id),
    IsResponsibleParty BIT NOT NULL
    -- specify more columns here
);
GO
-- Insert rows into table 'Travellers'
INSERT INTO Travellers
( -- columns to insert data into
 [Id], [UserId], [IsResponsibleParty]
)
VALUES
( -- first row: values for the columns in the list above
 '9a88d9ff-f175-4972-88b3-797bce9c8dcc', 'e628cd88-c54b-43e6-9a66-13a5171c461a', 1
),
( -- second row: values for the columns in the list above
 '19163971-32d3-4a81-99d1-a1f1cfec7917', 'adde9769-37c4-4a04-9fcb-f38ff6194ed5', 0
),
( -- first row: values for the columns in the list above
 'b8bd5032-d327-47b3-a7ff-5e2ebcd39848', '080bc4a6-0487-441a-8b41-c5ef3c5ad734', 1
),
( -- second row: values for the columns in the list above
 '555cad1a-fd22-4c91-abc8-77e4879b9f1a', 'a5552c00-e6e3-4420-b895-cbe45f786edf', 0
)
-- add more rows here
GO

-- Select rows from a Table or View 'Travellers' in schema  
SELECT * FROM Travellers
GO

GO

-- Create a new table called 'TravellerGroups' in schema '
-- Drop the table if it already exists
IF OBJECT_ID('Groups', 'U') IS NOT NULL
DROP TABLE Groups
GO
-- Create the table in the specified schema
CREATE TABLE Groups
(
    Id UNIQUEIDENTIFIER NOT NULL PRIMARY KEY, -- primary key column
    GroupDescription NVARCHAR(50) NULL,
    -- specify more columns here
);
GO
-- Insert rows into table 'Groups'
INSERT INTO Groups
( -- columns to insert data into
 [Id], GroupDescription
)
VALUES
( -- first row: values for the columns in the list above
 'a7f458a4-8414-4558-a01a-5c023a309a18', 'Group 1'
),
( -- second row: values for the columns in the list above
 '74d14ed7-95ea-414b-bea5-b01e60afb979', 'Group 2'
)
-- add more rows here
GO
GO

-- Create a new table called 'TravellerGroups' in schema 
-- Drop the table if it already exists
IF OBJECT_ID('TravellerGroups', 'U') IS NOT NULL
DROP TABLE TravellerGroups
GO
-- Create the table in the specified schema
CREATE TABLE TravellerGroups
(
    Id UNIQUEIDENTIFIER NOT NULL PRIMARY KEY, -- primary key column
    GroupId UNIQUEIDENTIFIER FOREIGN KEY REFERENCES Groups(Id),
    TravellerId UNIQUEIDENTIFIER FOREIGN KEY REFERENCES Travellers(Id),
    -- specify more columns here
);

GO 
-- Insert rows into table 'TravellerGroups'
INSERT INTO TravellerGroups
( -- columns to insert data into
 Id, GroupId, TravellerId
)
VALUES
( -- first row: values for the columns in the list above
 '63e84e93-3c98-4f84-aa4d-0fe43d9e1d16', 'a7f458a4-8414-4558-a01a-5c023a309a18', 'b8bd5032-d327-47b3-a7ff-5e2ebcd39848'
),
( -- second row: values for the columns in the list above
 'a8fc9451-5573-488f-857b-155aabac2bca', 'a7f458a4-8414-4558-a01a-5c023a309a18', '555cad1a-fd22-4c91-abc8-77e4879b9f1a'
),
( -- second row: values for the columns in the list above
 'cf1a71ac-321e-4b38-8dbb-172077fdec7b', '74d14ed7-95ea-414b-bea5-b01e60afb979', '9a88d9ff-f175-4972-88b3-797bce9c8dcc'
),
( -- second row: values for the columns in the list above
 '58dc6280-dab8-447e-a8bb-9726a7513ff6', '74d14ed7-95ea-414b-bea5-b01e60afb979', '19163971-32d3-4a81-99d1-a1f1cfec7917'
)
-- add more rows here
GO

SELECT * FROM TravellerGroups;

GO
-- Create a new table called 'Locations' in schema 
-- Drop the table if it already exists
IF OBJECT_ID('Locations', 'U') IS NOT NULL
DROP TABLE Locations
GO
-- Create the table in the specified schema
CREATE TABLE Locations
(
    Id UNIQUEIDENTIFIER NOT NULL PRIMARY KEY, -- primary key column
    CityName [NVARCHAR](50) NOT NULL,
    Country [NVARCHAR](50) NOT NULL,
    Currency INT NOT NULL,
    -- specify more columns here
);
GO

-- Insert rows into table 'Locations'
INSERT INTO Locations
( -- columns to insert data into
 Id, CityName, Country, Currency
)
VALUES
( -- first row: values for the columns in the list above
 'db313663-36d7-455b-917f-75b55672ca07', 'Calgary', 'Canada', 1
),
( -- second row: values for the columns in the list above
 'e2a7c9a1-d4f3-4d2e-95b7-9b2544a7568f', 'Vancouver', 'Canada', 1
),
( -- second row: values for the columns in the list above
 '2ae5c84a-1601-4a93-ace2-6559da48d5c3', 'Los Angeles', 'US', 0
),
( -- second row: values for the columns in the list above
 '4355178d-6f44-4583-8576-6f08b83a1853', 'New York', 'US', 0
),
( -- second row: values for the columns in the list above
 '543cc091-9870-42e8-8df9-a7fb008b817c', 'Cancun', 'Mexico', 2
),
( -- second row: values for the columns in the list above
 'e4c11c37-ed85-41dd-815a-addc988fe535', 'Paris', 'France', 3
),
( -- second row: values for the columns in the list above
 '0f944f30-fb92-451b-beab-4f7955ecdfc5', 'Barcelona', 'Spain', 3
)
-- add more rows here
GO

-- Select rows from a Table or View 'Locations' in schema  
SELECT * FROM Locations
GO

-- Create a new table called 'PickupLocations' in schema 
-- Drop the table if it already exists
IF OBJECT_ID('PickupLocations', 'U') IS NOT NULL
DROP TABLE PickupLocations
GO
-- Create the table in the specified schema
CREATE TABLE PickupLocations
(
    Id UNIQUEIDENTIFIER NOT NULL PRIMARY KEY, -- primary key column
    Name [NVARCHAR](100) NOT NULL,
    Code [NVARCHAR](3) NOT NULL,
    LocationId UNIQUEIDENTIFIER FOREIGN KEY REFERENCES Locations(Id) ,
    -- specify more columns here
);
GO

-- Insert rows into table 'PickupLocations'
INSERT INTO PickupLocations
( -- columns to insert data into
 Id, Name, Code, LocationId
)
VALUES
( -- first row: values for the columns in the list above
 'dc749cbb-3bdc-42f3-8fb7-122a27fe597f', 'Calgary International Airport', 'YYC', 'db313663-36d7-455b-917f-75b55672ca07'
),
( -- second row: values for the columns in the list above
 '431d6d6f-34da-45d5-b135-144f812fd70f', 'Vancouver', 'YVR', 'e2a7c9a1-d4f3-4d2e-95b7-9b2544a7568f'
),
( -- second row: values for the columns in the list above
 'fed3a443-a58e-4f50-839b-076180f6d037', 'Los Angeles', 'LAX', '2ae5c84a-1601-4a93-ace2-6559da48d5c3'
),
( -- second row: values for the columns in the list above
 'f20cc9de-2af7-42c6-9506-83640b61f194', 'New York', 'JFK', '4355178d-6f44-4583-8576-6f08b83a1853'
),
( -- second row: values for the columns in the list above
 'fce4a66c-1e0d-484a-a601-da2d551102d5', 'Cancun', 'CUN', '543cc091-9870-42e8-8df9-a7fb008b817c'
),
( -- second row: values for the columns in the list above
 '57045d04-8eb9-451e-892b-e01303dabcf1', 'Paris', 'CDG', 'e4c11c37-ed85-41dd-815a-addc988fe535'
),
( -- second row: values for the columns in the list above
 '1b010590-2c5c-4b44-966b-7b2f047ea285', 'Barcelona', 'BCN', '0f944f30-fb92-451b-beab-4f7955ecdfc5'
)
-- add more rows here
GO

-- Select rows from a Table or View 'PickupLocations' in schema  
SELECT * FROM PickupLocations
GO

-- Create a new table called 'Trips' in schema  
-- Drop the table if it already exists
IF OBJECT_ID('Trips', 'U') IS NOT NULL
DROP TABLE Trips
GO
-- Create the table in the specified schema
CREATE TABLE Trips
(
    Id UNIQUEIDENTIFIER NOT NULL PRIMARY KEY, -- primary key column
    Departure UNIQUEIDENTIFIER FOREIGN KEY REFERENCES PickupLocations(Id),
    Destination UNIQUEIDENTIFIER FOREIGN KEY REFERENCES PickupLocations(Id),
    StartDate DATETIME NOT NULL,
    ToDate DATETIME NOT NULL
    -- specify more columns here
);
GO

-- Insert rows into table 'Trips'
INSERT INTO Trips
( -- columns to insert data into
 Id, Departure, Destination, StartDate, ToDate
)
VALUES
( -- first row: values for the columns in the list above
 'b8d9a978-35f2-40b7-b77f-064d46e48f3c', '1b010590-2c5c-4b44-966b-7b2f047ea285', 'f20cc9de-2af7-42c6-9506-83640b61f194', '2020-06-29', '2020-07-29'
),
( -- second row: values for the columns in the list above
 '9f593545-8081-495a-8cdf-b196b8ec1c3b', 'fce4a66c-1e0d-484a-a601-da2d551102d5', '57045d04-8eb9-451e-892b-e01303dabcf1', '2020-07-29', '2020-08-15'
),
( -- second row: values for the columns in the list above
 '97909ac2-b102-4241-8336-e373bf46543b', 'fed3a443-a58e-4f50-839b-076180f6d037', 'dc749cbb-3bdc-42f3-8fb7-122a27fe597f', '2020-07-12', '2020-08-01'
),
( -- second row: values for the columns in the list above
 'a520af9e-df64-48d8-b255-ee65a6ab8f7d', '431d6d6f-34da-45d5-b135-144f812fd70f', '1b010590-2c5c-4b44-966b-7b2f047ea285', '2020-08-25', '2020-09-15'
),
( -- second row: values for the columns in the list above
 '92e62d17-930c-4f3e-9ed9-f425ece677bb', '1b010590-2c5c-4b44-966b-7b2f047ea285', 'fce4a66c-1e0d-484a-a601-da2d551102d5', '2020-10-01', '2020-10-15'
),
( -- second row: values for the columns in the list above
 '08f5cf52-b0b1-452e-b2d0-f78c1b9ad4c2', 'fce4a66c-1e0d-484a-a601-da2d551102d5', '57045d04-8eb9-451e-892b-e01303dabcf1', '2020-08-25', '2020-09-05'
),
( -- second row: values for the columns in the list above
 'f4426c91-6205-4947-ada5-fc4772243ff1', 'fed3a443-a58e-4f50-839b-076180f6d037', 'fed3a443-a58e-4f50-839b-076180f6d037', '2020-11-26', '2020-12-15'
)
-- add more rows here
GO

SELECT * FROM Trips

GO

-- Create a new table called 'VehicleRates' in schema  
-- Drop the table if it already exists
IF OBJECT_ID( 'VehicleRates', 'U') IS NOT NULL
DROP TABLE VehicleRates
GO
-- Create the table in the specified schema
CREATE TABLE VehicleRates
(
    Id UNIQUEIDENTIFIER NOT NULL PRIMARY KEY, -- primary key column
    Vehicle INT NOT NULL,
    Currency INT NOT NULL,
    Amount DECIMAL NOT NULL
    -- specify more columns here
);
GO

-- Insert rows into table 'VehicleRates'
INSERT INTO VehicleRates
( -- columns to insert data into
 Id, [Vehicle], [Currency], Amount
)
VALUES
( -- first row: values for the columns in the list above
 '3cee77ba-8c80-4d8d-871f-1793418eb707', 1, 1, 20.0
),
( -- second row: values for the columns in the list above
 'e46a2971-085d-4ef2-895f-32e5d88ce6b4', 1, 2, 15.0
),
( -- second row: values for the columns in the list above
 '4e09b257-c1bb-485b-83bb-5b498629548d', 2, 1, 18.0
),
( -- second row: values for the columns in the list above
 '1d4bae5d-5277-4aa7-8872-0fc8ccd20153', 2, 2, 13.0
),
( -- second row: values for the columns in the list above
 'adcae085-e4bf-45ab-82f0-79a9639ef89b', 3, 1, 123.0
),
( -- second row: values for the columns in the list above
 '13b3adbb-c590-49bb-bb7b-b501d7f10db4', 3, 2, 31.0
),
( -- second row: values for the columns in the list above
 '0cae78f2-67cd-4e75-a4f5-c3bfbd4b480e', 4, 1, 15.0
),
( -- second row: values for the columns in the list above
 '61cb61d0-2bd4-4714-9ce8-cce1a1760a8b', 4, 2, 13.0
)
-- add more rows here

SELECT * FROM VehicleRates;


GO

-- Create a new table called 'Quotes' in schema  
-- Drop the table if it already exists
IF OBJECT_ID( 'Quotes', 'U') IS NOT NULL
DROP TABLE Quotes
GO
-- Create the table in the specified schema
CREATE TABLE Quotes
(
    Id UNIQUEIDENTIFIER NOT NULL PRIMARY KEY, -- primary key column
    TripId UNIQUEIDENTIFIER FOREIGN KEY REFERENCES Trips(Id),
    VehicleRateId UNIQUEIDENTIFIER FOREIGN KEY REFERENCES VehicleRates(Id),
    TravellerGroupId UNIQUEIDENTIFIER FOREIGN KEY REFERENCES TravellerGroups(Id),
    Amount DECIMAL NOT NULL,
    Status INT NOT NULL
    -- specify more columns here
);
GO

-- Insert rows into table 'Quotes'
INSERT INTO Quotes
( -- columns to insert data into
 Id, [TripId], [VehicleRateId], TravellerGroupId, Amount, [Status]
)
VALUES
( -- first row: values for the columns in the list above
 NEWID(), 'b8d9a978-35f2-40b7-b77f-064d46e48f3c', '3cee77ba-8c80-4d8d-871f-1793418eb707', '63e84e93-3c98-4f84-aa4d-0fe43d9e1d16', 1250, 0
),
( -- first row: values for the columns in the list above
 NEWID(), '9f593545-8081-495a-8cdf-b196b8ec1c3b', 'e46a2971-085d-4ef2-895f-32e5d88ce6b4', '63e84e93-3c98-4f84-aa4d-0fe43d9e1d16', 6658, 1
),
( -- first row: values for the columns in the list above
 NEWID(), '97909ac2-b102-4241-8336-e373bf46543b', '4e09b257-c1bb-485b-83bb-5b498629548d', 'a8fc9451-5573-488f-857b-155aabac2bca', 4126, 2
),
( -- first row: values for the columns in the list above
 NEWID(), 'a520af9e-df64-48d8-b255-ee65a6ab8f7d', 'adcae085-e4bf-45ab-82f0-79a9639ef89b', 'cf1a71ac-321e-4b38-8dbb-172077fdec7b', 2225, 1
),
( -- first row: values for the columns in the list above
 NEWID(), '92e62d17-930c-4f3e-9ed9-f425ece677bb', '13b3adbb-c590-49bb-bb7b-b501d7f10db4', '58dc6280-dab8-447e-a8bb-9726a7513ff6', 4752, 2
),
( -- first row: values for the columns in the list above
 NEWID(), '08f5cf52-b0b1-452e-b2d0-f78c1b9ad4c2', '0cae78f2-67cd-4e75-a4f5-c3bfbd4b480e', '58dc6280-dab8-447e-a8bb-9726a7513ff6', 1470, 0
),
( -- first row: values for the columns in the list above
 NEWID(), 'f4426c91-6205-4947-ada5-fc4772243ff1', '61cb61d0-2bd4-4714-9ce8-cce1a1760a8b', '58dc6280-dab8-447e-a8bb-9726a7513ff6', 3000, 2
)
-- add more rows here
GO