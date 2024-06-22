--Maria Teneva
--10748942

INSERT INTO Tokens VALUES('Battleship', 1),
                         ('Tophat', 0),
						 ('Thimble', 1),
						 ('Boot', 0),
						 ('Dog', 1), 
						 ('Car', 1);

INSERT INTO Bonuses VALUES('GO', 'Collect £200'),
('Chance 1', 'Pay each of the other players £50'),
('Jail', 'You are in jail. You must roll a 6 to get out.'),
('Community Chest 1', 'For winning a Beauty Contest, you win £100'),
('Free Parking',  'No action'),
('Chance 2', 'Move forward 3 spaces'),
('Go to Jail', 'Go to Jail, do not pass GO, do not collect £200'),
('Community Chest 2' , 'Your library books are overdue. Pay a fine of £30');



INSERT INTO Properties VALUES('Kilburn', 120, 'Yellow', NULL),
                             ('Uni Place', 100, 'Yellow', 1),
							 ('Victoria', 75, 'Green', 2),
							 ('Picadilly', 35, 'Green', NULL),
							 ('Oak House', 100, 'Orange', 4),
							 ('Owens Park', 30, 'Orange', 4),
							 ('AMBS', 400, 'Blue', NULL),
							 ('Co-op', 30, 'Blue', 3);

INSERT INTO Board VALUES(1, NULL, 'GO'),
                        (2, 'Kilburn', NULL),
                        (3, NULL, 'Chance 1'),
                        (4, 'Uni Place', NULL),
                        (5, NULL, 'Jail'),
                        (6, 'Victoria', NULL),
                        (7, NULL, 'Community Chest 1'),
                        (8, 'Picadilly', NULL),
                        (9, NULL, 'Free Parking'),
                        (10, 'Oak House', NULL),
                        (11, NULL, 'Chance 2'),
                        (12, 'Owens Park', NULL),
                        (13, NULL, 'Go to Jail'),
                        (14, 'AMBS', NULL),
                        (15, NULL, 'Community Chest 2'),
                        (16, 'Co-op', NULL);

INSERT INTO Players VALUES(1, 'Mary', 'Battleship', 9, 190),
                          (2, 'Bill', 'Dog', 12, 500),
                          (3, 'Jane', 'Car', 14, 150),
                          (4, 'Norman', 'Thimble', 2, 250);
                        
--The zeroes in AuditTrail refer to the initial state of the game.
--Once we start applying the rules to the gameplay it will be updated to
-- 1 or 2.

INSERT INTO AuditTrail Values(0, 1),
                             (0, 2),
                             (0, 3),
                             (0, 4);

                             