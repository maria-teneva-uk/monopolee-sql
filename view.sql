--Maria Teneva
--10748942

--Use a left join to connect Board to Properties on PropertyName

CREATE VIEW PropertyView AS
SELECT Board.TileID, Board.BonusName, Board.PropertyName, Properties.OwnerID
FROM Board
LEFT JOIN Properties ON Properties.PropertyName=Board.PropertyName;

--Left Join PropertyView with Bonuses on BonusName. Now we have information
--about all of the locations and any bonuses a player has there.

CREATE VIEW BonusView AS
SELECT PropertyView.TileID, PropertyView.PropertyName, PropertyView.OwnerID, PropertyView.BonusName, Bonuses.Description
FROM PropertyView
LEFT JOIN Bonuses ON Bonuses.BonusName=PropertyView.BonusName;

--Players only have a TileID as location. By innner joining Players and BonusView
-- we get a more comprehensive and readable view of where each player is currently.

CREATE VIEW PlayersView AS
SELECT Players.PlayerID, Players.PlayerName, Players.TokenName, Players.BankBalance, Players.Location, BonusView.PropertyName,  BonusView.BonusName, BonusView.Description
FROM BonusView
INNER JOIN Players ON Players.Location=BonusView.TileID;

--Now we inner join PlayersView with AuditTrail to get information for the
--Game round.

CREATE VIEW RoundView AS
SELECT AuditTrail.RoundNum, PlayersView.PlayerID, PlayersView.PlayerName, PlayersView.TokenName, PlayersView.BankBalance, PlayersView.Location, PlayersView.PropertyName,  PlayersView.BonusName, PlayersView.Description
FROM PlayersView
INNER JOIN AuditTrail ON AuditTrail.PlayerID=PlayersView.PlayerID;

--Finally, we can summarise all of the information we need for our gameView
--Here we can change the column names to reflect the current state of BankBalance
-- and location. We also want OwnedProperties to be displayed in a single cell
-- for readability- hence, GROUP_CONCAT. We also rank players by current balance.

CREATE VIEW gameView AS
SELECT DISTINCT RoundView.RoundNum AS RoundNumber, RoundView.PlayerID, RoundView.PlayerName, RoundView.TokenName,
 RoundView.BankBalance AS CurrentBankBalance, RoundView.Location AS CurrentLocation, RoundView.PropertyName,  
 RoundView.BonusName, RoundView.Description AS BonusDescription,
 (SELECT GROUP_CONCAT(PropertyName) 
   FROM (SELECT PropertyName FROM Properties WHERE Properties.OwnerID=RoundView.PlayerID)) AS OwnedProperties
FROM RoundView
INNER JOIN Properties ON Properties.OwnerID=RoundView.PlayerID
ORDER BY RoundView.BankBalance DESC;

SELECT * FROM gameView