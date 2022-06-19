use yves;
delete from yves.comments;
insert into yves.comments (thetext, user_id, billet_id, pub_date, likeit, dontlikeit)
  values( 'The chapter 1 is real bullshit !', 1,57,
    STR_TO_DATE('Jun 19 2022 12:00:00','%M %d %Y %H:%i:%s'),
    0, 0);
insert into yves.comments (thetext, user_id, billet_id, pub_date, likeit, dontlikeit)
  values( 'Le chapitre 1 est fantastique', 2,57,
    STR_TO_DATE('Jun 19 2022 12:01:00','%M %d %Y %H:%i:%s'),
    0, 0);
insert into yves.comments (thetext, user_id, billet_id, pub_date, likeit, dontlikeit)
  values( 'Dont agree ! Chapter 1 is really nice, love it !!!', 3,57,
    STR_TO_DATE('Jun 19 2022 12:04:00','%M %d %Y %H:%i:%s'),
    0, 0);
insert into yves.comments (thetext, user_id, billet_id, pub_date, likeit, dontlikeit)
  values( 'FY all ! Chapter 1 a non event, just written to make money !!!', 4,57,
    STR_TO_DATE('Jun 19 2022 12:06:00','%M %d %Y %H:%i:%s'),
    0, 0);
insert into yves.comments (thetext, user_id, billet_id, pub_date, likeit, dontlikeit)
  values( 'Restez corrects quelque soit votre opinion!!!', 5,57,
    STR_TO_DATE('Jun 19 2022 12:08:00','%M %d %Y %H:%i:%s'),
    0, 0);
insert into yves.comments (thetext, user_id, billet_id, pub_date, likeit, dontlikeit)
  values( 'Le chapitre 2 est tout aussi nul, j''arrête les frais!!!', 4,58,
    STR_TO_DATE('Jun 19 2022 12:10:00','%M %d %Y %H:%i:%s'),
    0, 0);
insert into yves.comments (thetext, user_id, billet_id, pub_date, likeit, dontlikeit)
  values( 'pas lu le 2, mais le chapitre 3 ext extra...', 5,58,
    STR_TO_DATE('Jun 19 2022 12:15:00','%M %d %Y %H:%i:%s'),
    0, 0);

--
--  Some check queries
--
select  billets.thetext 'Chapter Title',
        comments.thetext 'Comment',
        users.pseudo 'Pseudo',
        date_format(comments.pub_date, '%M %d %Y --- %H:%i:%s') 'Commented'
  from yves.billets, yves.comments, yves.users where comments.billet_id = billets.id
      and comments.user_id = users.id
      order by 4 desc;


