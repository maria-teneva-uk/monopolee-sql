--Maria Teneva
--10748942

--Creating a trigger that simulates turn 3. Mary rolls a 4, and has to go to Jail.
--On updating the round number for Jane in Audit Trail to 1, everything else gets updated automatically.

CREATE TRIGGER update_g3
AFTER UPDATE ON AuditTrail
WHEN NEW.RoundNum = 1 AND NEW.PlayerID = 1
BEGIN
  UPDATE Players
  SET Location = 5
  WHERE PlayerID = 1;
END;

UPDATE AuditTrail 
SET RoundNum=1
WHERE PlayerID=1;


SELECT * FROM gameView