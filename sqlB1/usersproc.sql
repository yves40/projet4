-- ---------------------------------------------------------------------------
--  userproc.sql
--
--  2022 06 20  Initial
--  2022 06 21  Work on error handling
-- ---------------------------------------------------------------------------
use projet4;

delimiter //
-- ---------------------------------------------------------------------------
-- Define procedures
-- ---------------------------------------------------------------------------
drop procedure if exists projet4.findFirstAuthorID;
create procedure projet4.findFirstAuthorID(out authorid int, out authoremail varchar(128))
  begin
    select id, email into authorid, authoremail from projet4.users
      where userrole = 'AUTHOR' limit 1;    
  end//
-- ---------------------------------------------------------------------------
drop procedure if exists projet4.findFirstReaderID;
create procedure projet4.findFirstReaderID(out readerid int)
  begin
    select id into readerid from projet4.users 
      where userrole = 'READER' limit 1;
  end//
-- ---------------------------------------------------------------------------
drop procedure if exists projet4.addUser;
create procedure projet4.addUser(in email VARCHAR(128), in pwd VARCHAR(128), 
    in pseudo VARCHAR(128), out result VARCHAR(128))
  begin
    DECLARE EXIT HANDLER FOR 1062
        begin
            SET result = concat_ws(' ', email, 'Already registerd user'); 
        end;
    INSERT INTO projet4.users(email, pwd, pseudo) 
      VALUES (email, pwd, pseudo);
      SET result = concat_ws(' ', email, 'The user has been registered');
  end//
-- ---------------------------------------------------------------------------
drop procedure if exists projet4.dropUserById;
create procedure projet4.dropUserById(in userId INT, out result VARCHAR(128))
  begin
    DECLARE code CHAR(5) DEFAULT '00000';
    declare errno int;
    DECLARE msg TEXT;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    begin
        get diagnostics condition 1
            code = returned_sqlstate, msg = message_text, errno = mysql_errno;
    end;
    DELETE from projet4.users where idd = userId;
    if code = '00000' THEN
        set result = 'done';
    else
        set result = concat_ws(' : ', "Unable to delete user with ID", userId, 'SQLSTATE', code, 'MESS: ', msg, "ERRNO", errno);
    end if;
  end//

-- ---------------------------------------------------------------------------
-- Define functions
-- ---------------------------------------------------------------------------
drop function if exists projet4.ffAuthorID;
create function projet4.ffAuthorID() returns INT
  begin
      declare authorid INT;
      select id into authorid from projet4.users
        where userrole = 'AUTHOR' limit 1;
      return authorid;    
  end//
-- ---------------------------------------------------------------------------
drop function if exists projet4.findUserByPseudo;
create function projet4.findUserByPseudo(userpseudo VARCHAR(128)) returns INT
  begin
    declare userId INT;
    DECLARE EXIT HANDLER FOR NOT FOUND
        begin
            return 9999;
        end;
    select id into userId from projet4.users
      where pseudo = userpseudo;
    return userId;
  end//


delimiter ;


