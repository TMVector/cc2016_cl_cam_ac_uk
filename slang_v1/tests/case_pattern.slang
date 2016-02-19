let a:int+(bool*bool) = inl bool*bool 1 in
let b:int+(bool*bool) = inr int (true, true) in
let f(x:int+(bool*bool)):int =
  if case x of
      inl (i:int)               -> i = 1
    | inr (b1:bool, b2:bool)    -> b1 && b2
  then
    1
  else
    0
in
2*(f a) + f b