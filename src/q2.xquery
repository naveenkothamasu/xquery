SELECT XMLQuery(
'for $title in fn:distinct-values(ora:view("review")//Review[year-from-date(Review_Date) = 2014]/Book_Title)
for $book in ora:view("book")//BOOK
where $book/Title = $title
return $book/ID' RETURNING CONTENT )
FROM dual;
