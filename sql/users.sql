use yves;

set transaction read write;

delete from yves.users;
insert into yves.users (email, pwd, pseudo, userstatus, userrole)
  values( 'y@free.fr', 'manager112','y77', 'ACTIVE', 'READER');
insert into yves.users (email, pwd, pseudo, userstatus, userrole)
  values( 'isa@free.fr', 'manager112','isa77', 'ACTIVE', 'READER');
insert into yves.users (email, pwd, pseudo, userstatus, userrole)
  values( 'bintoul@free.fr', 'manager112','bin77', 'ACTIVE', 'READER');
insert into yves.users (email, pwd, pseudo, userstatus, userrole)
  values( 'ratoon@free.fr', 'manager112','rat77', 'ACTIVE', 'READER');
insert into yves.users (email, pwd, pseudo, userstatus, userrole)
  values( 'barbul@free.fr', 'manager112','barbul77', 'ACTIVE', 'READER');
insert into yves.users (email, pwd, pseudo, userstatus, userrole)
  values( 'tono@free.fr', 'manager112','tono77', 'ACTIVE', 'AUTHOR');

commit;
--
--
--
select * from yves.users order by id;
