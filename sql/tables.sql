SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
-- -----------------------------------------------------
-- Schema yves
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `yves` DEFAULT CHARACTER SET utf8 ;
USE `yves` ;

-- -----------------------------------------------------
-- Table `yves`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS yves.users ;

CREATE TABLE IF NOT EXISTS yves.users (
      id INT NOT NULL AUTO_INCREMENT,
      email VARCHAR(128) NOT NULL,
      pwd VARCHAR(64) NOT NULL,
      pseudo VARCHAR(64) NOT NULL,
      userstatus VARCHAR(16) DEFAULT 'ACTIVE' check (userstatus in ( 'ACTIVE', 'SUSPENDED', 'DELETED')),
      userrole VARCHAR(16) DEFAULT 'READER' check (userrole in ( 'AUTHOR', 'READER')),
  PRIMARY KEY (id)
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `yves`.`billets`
-- -----------------------------------------------------
DROP TABLE IF EXISTS yves.billets;

CREATE TABLE IF NOT EXISTS yves.billets (
  id INT NOT NULL AUTO_INCREMENT,
  thetext TEXT NOT NULL,
  pub_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  user_id INT NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `yves`.`comments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS yves.comments;

CREATE TABLE IF NOT EXISTS yves.comments (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    billet_id INT NOT NULL,
    thetext TEXT NOT NULL,
    likeit TINYINT NOT NULL,
    dontlikeit TINYINT NOT NULL,
    pub_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Constraints
-- -----------------------------------------------------
alter table yves.billets add constraint fk_billets_to_users foreign KEY (user_id)
  references yves.users(id);
alter table yves.comments add constraint fk_comments_to_users foreign KEY (user_id)
  references yves.users(id);
alter table yves.comments add constraint fk_comments_to_billets foreign KEY (billet_id)
  references yves.billets(id);

-- -----------------------------------------------------
-- Table `yves`.`logs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS yves.logs ;

CREATE TABLE IF NOT EXISTS yves.logs (
    log_id INT NOT NULL AUTO_INCREMENT,
    log_date TIMESTAMP NOT NULL,
    log_message VARCHAR(128) NOT NULL,
    log_type VARCHAR(3) NOT NULL DEFAULT 'PRG' check (log_type in ( 'USR', 'PRG')),
  PRIMARY KEY (log_id))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
