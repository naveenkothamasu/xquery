SELECT XMLQuery(
'for $review in (ora:view("review")//Review)
for $book in (ora:view("book")//BOOK)
where $review/Book_Title = $book/Title
order by $review/Reviewer,  $review/Book_Title
return <R>{<R1>{data($review/Reviewer)}</R1>,<R2>{data($review/Book_Title)}</R2>}</R>'
 RETURNING CONTENT )
FROM dual;
