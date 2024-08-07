-- Drops the table users if it exists and then creates a new one.
-- The table includes:
-- id: an integer that is not null, auto-incremented, and serves as the primary key
-- email: a string with a maximum length of 255 characters that is not null and must be unique
-- name: a string with a maximum length of 255 characters
-- country: an enumeration that includes the values 'US', 'CO', and 'TN', with a default value of 'US'

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(255) NOT NULL UNIQUE,
    `name` VARCHAR(255),
    `country` ENUM('US', 'CO', 'TN') NOT NULL DEFAULT 'US',
    PRIMARY KEY (`id`)
);
