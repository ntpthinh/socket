

-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `email` VARCHAR(45) NOT NULL UNIQUE,
  `password` VARCHAR(45),
  `dob` TIMESTAMP,
  `avatar` TEXT);

-- -----------------------------------------------------
-- Table `mydb`.`blog`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `userId` VARCHAR(45) NOT NULL,
  `title` TEXT NULL DEFAULT NULL,
  `content` TEXT NULL DEFAULT NULL,
  `createdDate` TIMESTAMP NULL DEFAULT NULL,
  CONSTRAINT `fk_userIdBlog`
    FOREIGN KEY (id)
    REFERENCES user(id));



-- -----------------------------------------------------
-- Table `mydb`.`conversation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `conversation` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `fromUserId` INT(11) NOT NULL,
  `toUserId` INT(11) NULL DEFAULT NULL,
  `content` VARCHAR(45) NULL DEFAULT NULL,
  `createdTime` TIMESTAMP NULL DEFAULT NULL,
  CONSTRAINT `fk_fromUserId`
    FOREIGN KEY (`id`)
    REFERENCES `user`(`id`),
  CONSTRAINT `fk_toUserId`
    FOREIGN KEY (`id`)
    REFERENCES `user`(`id`));


-- -----------------------------------------------------
-- Table `mydb`.`relationship`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `relationship` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `userId1` INT(11) NOT NULL,
  `userId2` INT(11) NOT NULL,
  CONSTRAINT `fk_userId1`
    FOREIGN KEY (`userId1`)
    REFERENCES `user`(`id`),
  CONSTRAINT `fk_userId2`
    FOREIGN KEY (`userId2`)
    REFERENCES `user`(`id`));


insert into user (email, password, dob, avatar) values ('abc@gmail.com', '123456', '1997-01-20 00:00:00', '');
insert into user (email, password, dob, avatar) values ('edf@gmail.com', '123456', '1997-01-20 00:00:00', '');
insert into relationship (userId1,userId2) values (1,2);
