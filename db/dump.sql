CREATE DATABASE tournament CHARACTER SET utf8 COLLATE utf8_unicode_ci;

USE tournament;

CREATE TABLE `tournaments` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `description` varchar(100) NOT NULL,
  `image` varchar(60) NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


CREATE TABLE `teams` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `image` varchar(60) NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;



CREATE TABLE `calendars` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `tournament_id` int(6) NOT NULL ,
  `date_number` int(3) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`tournament_id`) REFERENCES `tournaments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


CREATE TABLE `matches` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `calendar_id` int(6) NOT NULL ,
  `match_date` datetime NOT NULL,
  `local_team_id` int(6) NOT NULL,
  `local_points` int(3) NULL,
  `visitor_team_id` int(6) NOT NULL,
  `visitor_points` int(3) NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`calendar_id`) REFERENCES `calendars` (`id`),
  FOREIGN KEY (`local_team_id`) REFERENCES `teams` (`id`),
  FOREIGN KEY (`visitor_team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


CREATE TABLE `positions` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `calendar_id` int(6) NOT NULL,
  `team_id` int(6) NOT NULL,
  `points` int(3) NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
