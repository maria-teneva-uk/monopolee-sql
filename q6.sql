--Maria Teneva
--10748942

--Creating a trigger that simulates turn 6. Norman rolls a 4, lands on Community Chest 1 and gets 100 pounds.
--On updating the round number for Norman in Audit Trail to 2, everything else gets updated automatically.

CREATE TRIGGER update_g6
AFTER UPDATE ON AuditTrail
WHEN NEW.RoundNum = 2 AND NEW.PlayerID = 4
BEGIN
  UPDATE Players
  SET Location = 7,
  BankBalance = BankBalance+100
  WHERE PlayerID = 4;
END;

UPDATE AuditTrail
SET RoundNum=2
WHERE PlayerID=4;

SELECT * FROM gameView