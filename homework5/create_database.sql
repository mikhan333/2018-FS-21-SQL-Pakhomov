use track_roads;

-- -----------------------------------------------------
-- Table `mydb`.`users`
-- -----------------------------------------------------
CREATE TABLE `users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(255) NOT NULL,
  `first_name` VARCHAR(255),
  `last_name` VARCHAR(255),
  `reg_dttm` TIMESTAMP,
  `email` VARCHAR(255),
  `password` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`user_id`)
);

-- -----------------------------------------------------
-- Table `mydb`.`sessions`
-- -----------------------------------------------------
CREATE TABLE `sessions` (
  `session_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `begin_dttm` TIMESTAMP,
  `end_dttm` TIMESTAMP,
  PRIMARY KEY (`session_id`),
  FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
);

-- -----------------------------------------------------
-- Table `mydb`.`models`
-- -----------------------------------------------------
CREATE TABLE `models` (
  `model_id` INT NOT NULL AUTO_INCREMENT,
  `modelname` VARCHAR(255),
  `type` VARCHAR(45),
  PRIMARY KEY (`model_id`)
);


-- -----------------------------------------------------
-- Table `mydb`.`cars`
-- -----------------------------------------------------
CREATE TABLE `cars` (
  `car_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `model_id` INT NOT NULL,
  `number` VARCHAR(255),
  `car_reg_dttm` TIMESTAMP,
  PRIMARY KEY (`car_id`),
  FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  FOREIGN KEY (`model_id`) REFERENCES `models` (`model_id`)
);


-- -----------------------------------------------------
-- Table `mydb`.`tracks`
-- -----------------------------------------------------
CREATE TABLE `tracks` (
  `track_id` INT NOT NULL AUTO_INCREMENT,
  `tracksname` VARCHAR(255) NULL,
  `location` VARCHAR(255) NULL,
  PRIMARY KEY (`track_id`)
);


-- -----------------------------------------------------
-- Table `mydb`.`sections`
-- -----------------------------------------------------
CREATE TABLE `sections` (
  `section_id` INT NOT NULL AUTO_INCREMENT,
  `track_id` INT NOT NULL,
  `location` VARCHAR(255),
  `number_lanes` INT,
  `begin_km` INT,
  `end_km` INT,
  PRIMARY KEY (`section_id`),
  FOREIGN KEY (`track_id`) REFERENCES `tracks` (`track_id`)
);


-- -----------------------------------------------------
-- Table `mydb`.`sections_price`
-- -----------------------------------------------------
CREATE TABLE `sections_price` (
  `sections_price_id` INT NOT NULL AUTO_INCREMENT,
  `section_id` INT NOT NULL,
  `begin_dttm` TIME NOT NULL,
  `end_dttm` TIME NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `price` DOUBLE,
  PRIMARY KEY (`sections_price_id`, `section_id`, `begin_dttm`, `end_dttm`, `type`),
  FOREIGN KEY (`section_id`) REFERENCES `sections` (`section_id`)
);


-- -----------------------------------------------------
-- Table `mydb`.`driveways`
-- -----------------------------------------------------
CREATE TABLE `driveways` (
  `driveways_id` INT NOT NULL AUTO_INCREMENT,
  `car_id` INT NOT NULL,
  `section_id` INT NOT NULL,
  `begin_dttm` TIMESTAMP,
  `end_dttm` TIMESTAMP,
  `payment_dttm` TIMESTAMP,
  PRIMARY KEY (`driveways_id`),
  FOREIGN KEY (`car_id`) REFERENCES `cars` (`car_id`),
  FOREIGN KEY (`section_id`) REFERENCES `sections` (`section_id`)
);