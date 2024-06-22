--Maria Teneva
--10748942

--Creating a trigger that simulates turn 7. Mary rolls a 6 which gets her our of Jail.
--The 6 counts only towards that and not towards her movement on the board (assumption).
--Then she rolls a 5 and lands on Oak House. She needs to pay Norman 200 
--pounds(twice the value of Oak House) because Bill owns two orange properties.
--On updating the round number for Norman in Audit Trail to 2, everything else gets updated automatically.


CREATE TRIGGER update_g7
AFTER UPDATE ON AuditTrail
WHEN NEW.RoundNum = 2 AND NEW.PlayerID = 1
BEGIN
  UPDATE Players
  SET Location = 10,
  BankBalance = BankBalance-(2*100)
  WHERE PlayerID = 1;
  UPDATE Players
  SET BankBalance = BankBalance+(2*100)
  WHERE PlayerID=4;
END;

UPDATE AuditTrail
SET RoundNum=2
WHERE PlayerID=1;

SELECT * FROM gameView