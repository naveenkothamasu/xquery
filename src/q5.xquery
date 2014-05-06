SELECT XMLQuery(
'for $reviewer in fn:distinct-values(ora:view("review")//Reviewer)
let $ratings := ora:view("review")//Review[Reviewer=$reviewer]
return <R>{<R1>{avg($ratings/Rating)}</R1>,<R2>{count($ratings/Rating)}</R2>,<R3>{$reviewer}</R3>}</R>' RETURNING CONTENT )
FROM dual;
