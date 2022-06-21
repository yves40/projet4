-- ---------------------------------------------------------------------------
--  testusersproc.sql
--
--  2022 06 21  Initial
-- ---------------------------------------------------------------------------
use projet4;

select * from projet4.users;
select * from projet4.billets;
select * from projet4.comments;

call projet4.findFirstAuthorID(@A, @AA);
call projet4.log('First Author ID is', @A);
call projet4.findFirstReaderID(@B);
call projet4.log('First Reader ID is', @B);

call projet4.addUser('yves@free.fr','9876', 'yves77', @result);
select @result;

call projet4.dropUserById(14, @result);
select @result;

-- select email 'Author email is', pseudo 'and pseudo is' from projet4.users where id = projet4.ffAuthorID();
select email '', pseudo '' from projet4.users where id = projet4.ffAuthorID();
select * from projet4.users where id = projet4.findUserByPseudo('Toto98');


