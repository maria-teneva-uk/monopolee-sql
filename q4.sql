--Maria Teneva
--10748942

--Creating a trigger that simulates turn 4. Bill rolls a 2, lands on AMBS(no owner) and needs to buy it.
--On updating the round number for Bill in Audit Trail to 1, everything else gets updated automatically.
CREATE TRIGGER update_g4
AFTER UPDATE ON AuditTrail
WHEN NEW.RoundNum = 1 AND NEW.PlayerID = 2
BEGIN
  UPDATE Players
  SET Location = 14,
  BankBalance = BankBalance-400
  WHERE PlayerID = 2;
  UPDATE Properties
  SET OwnerID=2
  WHERE PropertyName="AMBS";
END;

UPDATE AuditTrail 
SET RoundNum=1
WHERE PlayerID=2;

SELECT * FROM gameView

--END of Round 1