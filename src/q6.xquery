SELECT XMLQuery(
'for $goodRating in (ora:view("review")//Review[Rating>3])
for $book in ora:view("book")//BOOK
let $review := ora:view("review")//Review[Review_ID=$goodRating/Review_ID]
where $book/Title = $review/Book_Title
order by $book/Publish_Date ascending, $review/Review_Date descending
return  <R>
          {
            <R1>{data($review/Reviewer)}</R1>,
            <R2>{data($review/Rating)}</R2>,
            <R3>{data($book/Publish_Date)}</R3>,
            <R4>{data($review/Review_Date)}</R4>
          }
        </R>' RETURNING CONTENT )
FROM dual;