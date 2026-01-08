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

== \ _3.5 Control Flow_ \

\ _if Expressions_ \

`
  let number = 3;

  if number > 5
  {
      true
  }
  else
  {
      false
  }

`

_Using if in a_ `let` _statement_

`if` is an expression. That means we can use it to evaluate to some values. This is an example:

`
  let condition = true;
  let number = if condition { 5 } else { 6 };

`
This will output 5 when number is printed to console.

Note that each arm of the if statement must return a values of the same type. 

This is an example of a assignment that is not possible:


`
  let condition = true;
  let number = if condition { 5 } else { "six" };

`
_Repetition with loops_

- `loop`
- `while`
- `for`

_loop_
`
  fn main(){
    loop{
      //do something

    }
  }
`
_Returning values from loop_

`
  fn loop_until() -> u32
  {
      let mut counter = 0;

      let res = loop {
          counter += 1;
          if counter == 10 {
              break counter * 2;
          }
      };

      res
  }

`
_Disambiguating with Loop Labels_

If you've ever wanted to break out of a loop but not the innermost one. You could do that by first given the loop you want to break out of a label like so:

`'coutingup: loop {`

Now that loop is labeled "countingup". You can break out of that loop, even if you are is another loop somewhere below countingup using;

`break 'countingup;`

#pagebreak()
== _Chapter 4: Understanding Ownership_

\ _What is Ownership?_ \
*Ownership* : A set of rules that govern how a Rust program manages memory.

\ _Ownership Rules_ \
- Each value in Rust has an _owner_.
- There can only be one owner at a time.
- When the owner goes out of scope the value.

\ _Variable Scope_ \

*Scope*: The range within a program where a item is valid.

`let s = "hello"`

This variable would be valid as annotated here:

`
{ // s is not valid here, since it's not yet declared
  `let s = "hello"` // s is valid from this point onward

} // the scope is now over, and s is no longer valid.

`

\ _The String Type_ \

We cant mutate string literals like this:

`let s = "hi there!"`

with the string type we can:

`let mut s = String::from("hello");` \
`s.push_str(", world!");` \
`println!("{s}")` \

OK, but why can we mutate `String` but not string literal.

We know a string literal's contents at compile time, making them fast and efficient, but that is as the cost of immutability. 

With `String` type we need to be able to support a mutable, or growable piece of text, so we need to allocate some unknown-at-compile-time amount of memory on the heap to hold the text contents.

How does rust return memory to the allocator when we're done using our `String`?

The memory is automatically returned once the variable that owns it goes out of scope.


\ _Variables and Data Interacting with Move_ \

Try to guess what happens here:

`
let x = 5;
let y = x;

`
You would think that x would be bound to the value '5'  and y would act as a copy and would also bind to the value '5'. You would be correct. Since five is a known, fixed size, the two values are pushed onto the _stack_.

Another example, try to guess what would happen here, under the hood?

`
let s1 = String::from("hello");
let s2 = s1;

`
It's a little different here. `String` exists because you might want a string that can change, be `mutable`. So we can't push s1 to the _stack_, it is not of fixed size. s1 is a pointer to some space in the _heap_'s  memory, where the actual string data is stored. So, what happens when we do `let s2 = s1;`? We create a copy of the pointer s1 and assign it to s2 that pointer points to the same spot in the _heap_ that s1 does.

If you try running this code and try to print the value of s1 later you will get an error because rust _invalidates_ s1 after `let s2 = s1`. 

\ _Scope and Assignment_ \

If you do this:

`
let mut s = String::from("hello");
s = String::from("ahoy");

println!("{s}, world!")

`
A behavior similar to the one described previously will happen. The data in the heap that the variable references will be _invalidated_ when it is reassigned to "ahoy".

\ _Variables and Data Interacting with Clone_ \

Let's say you do want a DEEP COPY of a variable 

`
let s1 = String::from("hello");
//let s2 = *DEEP COPY of S1*;
//this behavior is achieved like so

let s2 = s1.clone();
`

So now s1 owns a string object which has a pointer to its own memory in the heap. While at same time, s2 also owns a different but identical string object, that contains a pointer that points to a different space in memory but with the same contents as s1. 

\ _Stack-Only Data: Copy_ \

Why is `x` in this code segment still valid at the end of the segment.

`
let x = 5;
let y = x;

println!("x = {x}, y = {y}");

`
It's because the integers have fixed size so they are placed on the stack at compile time, this making copies of the values quick to make. 

Types like Integers described here, have a special annotation called the `Copy` trait. If a type implements a `Copy` trait, variables that use it do not move rather they are trivially copied. So, they are still valid even after assignment to another variable.

\ _Ownership and Functions_ \

Passing a value to a function has a similar behavior to assigning a value to a variable as we have discussed.

`
fn main() {
    let s = String::from("hello");  // s comes into scope

    takes_ownership(s);             // s's value moves into the function...
                                    // ... and so is no longer valid here

    let x = 5;                      // x comes into scope

    makes_copy(x);                  // Because i32 implements the Copy trait,
                                    // x does NOT move into the function,
                                    // so it's okay to use x afterward.

} // Here, x goes out of scope, then s. However, because s's value was moved,
  // nothing special happens.

fn takes_ownership(some_string: String) { // some_string comes into scope
    println!("{some_string}");
} // Here, some_string goes out of scope and `drop` is called. The backing
  // memory is freed.

fn makes_copy(some_integer: i32) { // some_integer comes into scope
    println!("{some_integer}");
} // Here, some_integer goes out of scope. Nothing special happens.

`


