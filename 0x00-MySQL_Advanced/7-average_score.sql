-- Create a stored procedure named ComputeAverageScoreForUser
-- that calculates and stores the average score
-- for a student. Note: The average score can be
-- a decimal value.
-- The procedure ComputeAverageScoreForUser takes one input:
-- user_id, which is a value from users.id (you can assume
-- user_id corresponds to an existing user).

DELIMITER |
CREATE PROCEDURE ComputeAverageScoreForUser(IN `user_id` INT)
BEGIN
    UPDATE users
    SET average_score = (SELECT AVG(score)
                         FROM corrections
                         WHERE corrections.user_id = user_id)
    WHERE id = user_id;
END |
DELIMITER ;
