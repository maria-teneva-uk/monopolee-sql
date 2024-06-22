--Maria Teneva
--10748942

--Creating a trigger that simulates turn 2. Norman rolls a 1, lands on Chance 1 and needs to pay everyone 50 pounds. 
--On updating the round number for Norman in Audit Trail to 1, everything else gets updated automatically.
CREATE TRIGGER update_g2
AFTER UPDATE ON AuditTrail
WHEN NEW.RoundNum = 1 AND NEW.PlayerID = 4
BEGIN
  UPDATE Players
  SET Location = 3,
      BankBalance = BankBalance - (3*50)
  WHERE PlayerID = 4;
  UPDATE Players
  SET BankBalance = BankBalance + 50
  WHERE PlayerID=1
    OR PlayerID=2
    OR PlayerID=3;
END;

UPDATE AuditTrail 
SET RoundNum=1
WHERE PlayerID=4;

SELECT * FROM gameView