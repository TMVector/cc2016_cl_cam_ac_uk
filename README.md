# Compilers Course 2016, Cambridge CL
## My improvements

- Fixed the `while` loop implementations in slang_v2 for compilers 2 through 4.  
The value from the body (always `()`) was being left on the stack, unneccesarily using space.
In most of the interpreters, this also meant a crash when it exited the loop and tried to
apply the remaining code to a stack of `()`s

- Changed `(*…*)` comments to work over new lines.  
Previously they could be opened and closed on the same line, but new-lines would also close them,
so they were effectively single-line comments 

- Added pattern matching for the arguments of functions and lambdas, including allowing
`let f() = ...` which wasn't possible before. Patterns can be nested, so deconstructing nested pairs works too.

- Added pattern matching to `let` expressions to allow the deconstruction of pairs

- Added pattern matching to `case` expressions to allow deconstruction of pairs within unions

- Removed the need for the `end` keyword after `if` expressions, `while` loops, lambdas,
`let … in` expressions, and `case` expressions 