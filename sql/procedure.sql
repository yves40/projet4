use yves;
drop procedure if exists yves.generateBillets;

delimiter //
create procedure yves.generateBillets(in thecount int)
  begin
    select email from yves.users order by email;
  end//

delimiter ;
call yves.generateBillets(12);

