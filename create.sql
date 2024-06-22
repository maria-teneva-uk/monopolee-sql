--Maria Teneva
--10748942

--Creating table tokens first so TokenName can be added as FK in Players.

CREATE TABLE Tokens(
TokenName VARCHAR(10) PRIMARY KEY NOT NULL,
IsUsed BOOLEAN NOT NULL
);

--Bonuses and Properties come in second so they can be referenced in Board as FKs. We also 
--need separate tables as Bonuses and Properties have different attributes.

CREATE TABLE Bonuses(
BonusName VARCHAR(20) PRIMARY KEY NOT NULL,
Description VARCHAR(55) NOT NULL
);

CREATE TABLE Properties(
PropertyName VARCHAR(15) PRIMARY KEY NOT NULL,
Cost INT NOT NULL,
Colour VARCHAR(10),
OwnerID INT
);

--The Board table provides the structure of the game field. Tile ID is the unique location
-- from 1 to 16, and where the tile is property- the name will be displayed in PropertyName, 
-- And NULL for BonusName. Same goes for Bonuses. This is why there is no 'NOT NULL' restriction

CREATE TABLE Board(
TileID INT PRIMARY KEY NOT NULL,
PropertyName VARCHAR(15),
BonusName VARCHAR(20),
FOREIGN KEY(PropertyName) REFERENCES Properties(PropertyName),
FOREIGN KEY(BonusName) REFERENCES Bonuses(BonusName)
);

-- The Players table references Tokens and Board. We already have the location and  we can use
-- JOINS to get to the BonusDescription. Hence, there is no need to put it in the Players table.

CREATE TABLE Players(
PlayerID INT NOT NULL PRIMARY KEY,
PlayerName VARCHAR(20) NOT NULL,
TokenName VARCHAR(10) NOT NULL, 
Location INT NOT NULL,
BankBalance INT NOT NULL,
FOREIGN KEY(TokenName) REFERENCES Tokens(TokenName),
FOREIGN KEY(Location) REFERENCES Board(TileID)
);

-- There is no point to display location landed on and current bank balance in the Audit Trail,
-- since we already have that information in Players. We can easily get that information with a JOIN
-- and we can also display it in the gameView.

CREATE TABLE AuditTrail(
RoundNum INT NOT NULL,
PlayerID INT NOT NULL, 
FOREIGN KEY(PlayerID) REFERENCES Players(PlayerID),
PRIMARY KEY(RoundNum, PlayerID)
);

