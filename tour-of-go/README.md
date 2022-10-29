# Tour of Go

## Interesting things to remember

Packages, variables, and functions:

- a name is exported from a package only if it begins with a capital letter (e.g. math.Pi)
- declaration syntax
    - type declarations come after the name
    - it was [designed](https://go.dev/blog/declaration-syntax) to read easily from left to right, particularly helpful for complex declarations
- function syntax
    - function return types come after the params
    - you can shorten params from "x int, y int" to "x, y int"
    - you can return multiple results "func swap(x, y string) (string, string) {...}"
    - you can name return values then make assignments to them in the function
- variables
    - you can use `var` to declare variables, and `:=` to declare and initialize
    - uninitialized vars will get `0`, `false`, or `""` as defaults
    - when there is no explicit type declared for a variable, it will be inferred upon initialization
    - as with `import` statements, you can factor `var` statements
- types
    - [list of go types](https://pkg.go.dev/go/types#pkg-variables)
    - in formatted prints, use "%T" to print type, and "%v" to print value

Flow control statements:

- `for` loops (the only type of loop)
    - you can ommit the init, conditional, and post statements, effectively making it a while loop
    - both `for` and `if` statements can start with a short statement to execute before the condition
- Switch without a condition is the same as `switch true`. This construct can be a clean way to write long if-then-else chains.
- A `defer` statement defers the execution of a function until the surrounding function returns. Deferred functions are pushed onto a stack.

