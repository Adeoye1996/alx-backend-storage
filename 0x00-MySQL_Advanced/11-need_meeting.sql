-- Create a view named need_meeting that lists all students
-- who have a score below 80 (strictly) and either have no last_meeting
-- or had their last_meeting more than 1 month ago.

CREATE VIEW need_meeting AS
SELECT name
FROM students
WHERE score < 80
  AND (last_meeting IS NULL OR last_meeting < CURDATE() - INTERVAL 1 MONTH);
