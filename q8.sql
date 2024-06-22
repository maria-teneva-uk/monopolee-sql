--Maria Teneva
--10748942

--Creating a trigger that simulates turn 8. Bill rolls a 6 then 5. Since he isn't in Jail, we count that as moving
-- 11 places on the Board. He passes GO(gets 200 pounds). Ends up on Com. Chest 1 and earns 100 pounds.
--On updating the round number for Bill in Audit Trail to 2, everything else gets updated automatically.

CREATE TRIGGER update_g8
AFTER UPDATE ON AuditTrail
WHEN NEW.RoundNum = 2 AND NEW.PlayerID = 2
BEGIN
  UPDATE Players
  SET Location = 7,
  BankBalance = BankBalance+200+100
  WHERE PlayerID = 2;
END;

UPDATE AuditTrail
SET RoundNum=2
WHERE PlayerID=2;

SELECT * FROM gameView

--END OF GAME