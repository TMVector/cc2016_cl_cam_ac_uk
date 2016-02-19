(* test alpha conversion *) 

let y : int = 7
in
  let x : int = 1 
  in let x : int = 2 + x
     in let x : int = 3 + x  
        in let g(x : int, y : int) : int*int = (x + y, y + x)
           in let h(x : int, y : int) : int*int = (x + fst g(x, y), y + fst g(y, x))
              in fst g( h( g(x, y) ) )
