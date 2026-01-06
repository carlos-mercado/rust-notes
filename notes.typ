= Rust Book Notes (Carlos Mercado)
\
== _Chapter 3: Common Programming Concepts_

=== \ _3.1 Variables and Immutability_

\ _Variables_
- Mutable: Can be changed.
- Immutable: Cannot be changed.

Rust variables are immutable by default. For example:

#align(left, block[ `let var = 3;` ])

In this code segment, var is an immutable variable if you tried to reassign it like:

#align(left, block[ 
  #set align(left)
`
let var = 3;
var = 3;
  `
])

You would get an error message regarding telling you not to assign a immutable variable twice. 

\ _Declaring Constants_ \

Constants
- Are always immutable
- The type must be explicitly annotated.

\ You can declare a constant like so:
#align(center, block[ 
  #set align(left)
  ` const THREE_HOURS_IN_SECONDS: u32 = 60 * 60 * 3; `
])

\ _Shadowing_ \

When you declare a variable like so:

#align(left, block[ 
  `let x = 5;`
])

And you decide to declare a varaible with the same name later like so:

#align(left, block[ 
`
let x = 5;
let x = x + 1;
`
])

We say the first variable is being _*shadowed*_ by the second.

=== \ _3.2 Data Types_

Annotate types like this in Rust:
#align(left, block[`let x: u32 = 5;` ])

The type in this case in an unsigned 32bit integer.

\ _Scalar Types_ \

A scalar types represents a single values. There are four primary scalar types: integers, floating point numbers, booleans, and characters.

\ _Integer Types_ \

#table(
  columns: (auto, auto, auto),
  inset: 10pt,
  align: horizon,
  table.header(
    [*Length*], [*Signed*], [*Unsigneed*],
  ),
  [8-bit], [i8], [u8],
  [16-bit], [i16], [u16],
  [32-bit], [i32], [u32],
  [64-bit], [i64], [u64],
  [128-bit], [i128], [u128],
  [Architecture-dependent], [isize], [usize],
)

\ _Integer Overflow_ \

If there is an integer overflow error in you program and you compile in debug mode, rust checks for integer overflow, and if it happens the program will panic at runtime.

If you are compiling in release mode with the --release flag, the program will instead two's compliment wrap around. For example lets say you have a u8 int (0-255). The int 256 would be wrapped back to 0 and the int 257 would wrap back around to 1 and so on..

\ _Floating-Point Types_ \

Two primitives types in rust:
- f32
- f64

All floating point types are signed.

\ _Boolean Type_ \

True or false

#align(left, block[`let x: bool = false;` ])

\ _Character Type_ \

4 bytes in size (32 bits). It can represent a lot more than just ASCII.

#align(left, block[`let salute_emoji : char = '🫡';` ])

\ _Compound Types_ \

These are types that can combine multiple values into one type. 

There are two primitive compound types:
- Tuples
- Arrays

\ _The Tuple Type_ \

Tuples have a fixed length, they cannot grow or shrink in size. 

`let tup : (i32, f64, u8) = (500, 6.4, 1);` \

You can use pattern matching to destructure tuples like this:
#align(left, block[`let tup : (i32, f64, u8) = (500, 6.4, 1); 
let (x, y, z) = tup;
`
])

You can also index into a tuple like this:
#align(left, block[
`let tup : (i32, f64, u8) = (500, 6.4, 1); 
let five_hundred = x.0;
let six_point_four = x.1;
let one = x.2;
`
])


\ _The Array Type_ \

Creating an array

#align(left, block[`let months_that_matter = ["October", "November", "December", "January"]` ])

Creating an array with an explicit item type and explicit size

#align(left, block[`let a: [i32; 5] = [1,2,3,4,5];` ])

Creating an array of with an explicit size and initialized value.

#align(left, block[`let a: [3; 5];` ])

This will create the array `[3,3,3,3,3]`


=== \ _3.3 Functions_ \

Rust uses snake casing for function AND variable names. 

#align(left, block[
`
fn main() {
  another_function();
}

fn another_function() {
  println!("Another function!")
}
` 
])

#pagebreak() //---------------------------------------------

\ _Parameters_ \

Giving a function some parameters:

`
fn another_function(x: i32) {
  println!("Another function!")
}

`
Calling the function:

`
another_function(5);
`
\ _Statements and Expressions_ \ 

*Statements*: Instructions that perform some action that do not return a value. \
*Expressions*: Evaluate to a resultant value.

`let y = 6;` is a _statement_.

You can't do

`let y = (let x = 6);` \

This is because `let x = 6` is an expression there is nothing for y to bind to.

You *CAN* bind variables to expression like so

`
let y = {
  let x = 3;
  x + 1
};

`
The expression in those lines is

`
{
  let x = 3;
  x + 1
};

`
In this case it evaluates to four. Notice that `x + 1` does not end with a semicolon. This is because if you did add a semicolon it would turn into a statement. Right now it returns x + 1 (so four).



\ _Functions with Return Values_ \

Functions can return values to the code that calls them. The return value of a function is the same as the value of the final expression in the block of the body function.

`
fn add_one(arg1: i32) -> i32 {
    arg1 + 1
}

fn five() -> i32 {
    5
}
`

Notice, no ';'.
