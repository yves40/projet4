use yves;

set transaction read write;
delete from yves.billets;

insert into yves.billets (thetext, user_id, pub_date)
  values( 'Chapter 1, Who killed jessica harper ?', 6,
    STR_TO_DATE('Jun 11 2022 20:37:00','%M %d %Y %H:%i:%s'));
insert into yves.billets (thetext, user_id, pub_date)
  values( 'Chapter 2, Political Science', 6,
    STR_TO_DATE('Jun 15 2022 19:37:00','%M %d %Y %H:%i:%s'));
insert into yves.billets (thetext, user_id, pub_date)
  values( 'Chapter 3, Is Macron a liberal ?', 6,
    STR_TO_DATE('Jun 18 2022 3:37:00','%M %d %Y %H:%i:%s'));
insert into yves.billets (thetext, user_id, pub_date)
  values( 'Chapter 4, Melanchon is the best !', 6,
    STR_TO_DATE('Jun 19 2022 10:55:00','%M %d %Y %H:%i:%s'));
insert into yves.billets (thetext, user_id, pub_date)
  values( 'Chapter 5, Why did you sell highways to private companies !', 6,
    STR_TO_DATE('Jun 19 2022 11:15:00','%M %d %Y %H:%i:%s'));

commit;
--
--  Some check queries
--
select billets.id, thetext 'Title', 
      date_format(pub_date, '%M %d %Y --- %H:%i:%s') 'Published',
      pseudo 'Pseudo',
      email 'mail'
  from yves.billets, yves.users where users.id = user_id
      order by 2 desc;


