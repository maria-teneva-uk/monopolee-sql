--Maria Teneva
--10748942

-- START of Round 2
--Creating a trigger that simulates turn 5. Jane rolls a 5, lands on Victoria and needs to pay Bill 75 pounds.
--On updating the round number for Jane in Audit Trail to 2, everything else gets updated automatically.

CREATE TRIGGER update_g5
AFTER UPDATE ON AuditTrail
WHEN NEW.RoundNum = 2 AND NEW.PlayerID = 3
BEGIN
  UPDATE Players
  SET Location = 6,
  BankBalance = BankBalance-75
  WHERE PlayerID = 3;
  UPDATE Players
  SET BankBalance = BankBalance+75
  WHERE PlayerID=2;
END;

UPDATE AuditTrail
SET RoundNum=2
WHERE PlayerID=3;

SELECT * FROM gameView