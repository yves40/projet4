use yves;
delimiter //

drop procedure if exists yves.findFirstAuthorID;
create procedure yves.findFirstAuthorID(out authorid int, out authoremail varchar(128))
  begin
    select id, email into authorid, authoremail from yves.users
      where userrole = 'AUTHOR' limit 1;    
  end//

drop procedure if exists yves.findFirstReaderID;
create procedure yves.findFirstReaderID(out readerid int)
  begin
    select id into readerid from yves.users 
      where userrole = 'READER' limit 1;
  end//

drop procedure if exists yves.log;
create procedure yves.log(in mess varchar(128), in payload varchar(128))
  begin
    select concat_ws(':','LOG', mess, payload) '';
  end//
delimiter ;


call yves.findFirstAuthorID(@A, @AA);
call yves.log('First Author ID is', @A);
call yves.findFirstReaderID(@B);
call yves.log('First Reader ID is', @B);


