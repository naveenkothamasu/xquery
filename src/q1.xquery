SELECT XMLQuery(
'for $review in ora:view("review")//Review
for $book in ora:view("book")//BOOK
where $book/Price >= 25 and month-from-date($book/Publish_Date) > 8
and $review/Book_Title = $book/Title
return $review/Reviewer' 
RETURNING CONTENT)
FROM dual;