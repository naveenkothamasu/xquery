SELECT XMLQuery(
'for $book in fn:distinct-values(ora:view("review")//Review/Book_Title)
let $reviews := ora:view("review")//Review[Book_Title=$book]
order by avg($reviews/Rating) descending
return <R>{<R1>{data($book)}</R1>,<R2>{avg($reviews/Rating)}</R2>}</R>' RETURNING CONTENT )
FROM dual;
