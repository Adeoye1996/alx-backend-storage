-- Drop the procedure if it exists and create a new procedure
-- ComputeAverageWeightedScoreForUsers that calculates and stores
-- the average weighted score for all students.

DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUsers;
DELIMITER |
CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
BEGIN
    UPDATE users AS U,
        (SELECT U.id, SUM(score * weight) / SUM(weight) AS weighted_avg
         FROM users AS U
         JOIN corrections AS C ON U.id = C.user_id
         JOIN projects AS P ON C.project_id = P.id
         GROUP BY U.id) AS WA
    SET U.average_score = WA.weighted_avg
    WHERE U.id = WA.id;
END |
DELIMITER ;
