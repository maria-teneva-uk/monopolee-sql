--Maria Teneva
--10748942

--Creating a trigger that simulates turn 1. Jane rolls a 3, lands on 'GO' and gets 200 pounds. 
--On updating the round number for Jane in Audit Trail to 1, everything else gets updated automatically.

CREATE TRIGGER update_g1
AFTER UPDATE ON AuditTrail
WHEN NEW.RoundNum = 1 AND NEW.PlayerID = 3
BEGIN
  UPDATE Players
  SET Location = 1,
      BankBalance = BankBalance + 200
  WHERE PlayerID = 3;
END;

UPDATE AuditTrail
SET RoundNum = 1
WHERE PlayerID = 3; 

SELECT * FROM gameView