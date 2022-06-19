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

delimiter ;
call yves.findFirstAuthorID(@A, @AA);
select @A 'First Author', @AA 'With mail' ;
call yves.findFirstReaderID(@B);
select @B 'First Reader';


