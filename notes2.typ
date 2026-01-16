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

=== \ _4.2 References and Borrowing_ \

If we do something like this to avoid using an invalid variable later in the program after s1 losses ownership of the string obj.
`
fn main() {
    let s1 = String::from("hello");

    let (s2, len) = calculate_length(s1);

    println!("The length of '{s2}' is {len}.");
}

fn calculate_length(s: String) -> (String, usize) {
    let length = s.len(); // len() returns the length of a String

    (s, length)
}

`

There is an obvious problem here. We have to return the string to the main function so that we can still use string after the call to calculate_length.

Instead, we can give the function a _reference_ to the string object. Like so:

`
fn main() {
    let s1 = String::from("hello");

    let len = calculate_length(&s1);

    println!("The length of '{s1}' is {len}.");
}

fn calculate_length(s: &String) -> usize {
    s.len()

}
`

This is what is happening here:

- We create a variable `s1` we a assign it a string object. 
- We pass a reference to the `calculate_length()` function, which expects it.
- The function returns the length of s1.

This process is called *_borrowing_*.

Nice, but what if we try to modify the data inside of an object that we are referencing?

It won't work. Trying something like this:

`
fn main() {
    let s = String::from("hello");

    change(&s);
}

fn change(some_string: &String) {
    some_string.push_str(", world");
}
`
Will fail at compile time. Why? reference are *_IMMUTABLE_* by default.


\ _Mutable References_ \

We can modify borrowed values if we do this:

`
fn main() {
    let mut s = String::from("hello");

    change(&mut s);
}

fn change(some_string: &mut String) {
    some_string.push_str(", world");
}

`
All we have to do is pass a mutable reference to a function that expects it and we're good to go!

There is one restriction: If you have a can only have one mutable reference to a value/object at a time.

Actually, there's another one we can't have a mutable reference while we have an immutable one. Because if we did the reference to the immutable value could have it's value change from under it!

Multiple immutable references are allowed because, multiple readers does not no have the ability to affect anyone else's reading of the data.

A fun thing to note is that a references scope starts when it's introduced and it ends when it is last used so this works:

`
fn main() 
{
    let mut s = String::from("hello there my name is ");

    //whoa, two mutable references? how?

    let s2 = &mut s;
    println!("{s2}");
    extendo(&mut s);

    //because a references scope ends where it's last used. So there is
    //only one mutable reference to 's' one time in the scope of the program 
    //at a time.

}


fn extendo(input_string: &mut String)
{
    input_string.push_str("Carlos Mercado");

}

`

While this doesn't

`
fn main() 
{
    let mut s = String::from("hello there my name is ");

    //whoa, two mutable references? how?
    let s2 = &mut s;

    //because a references scope ends where it's last used. So there is
    //only one mutable reference to 's' one time in the scope of the program 
    //at a time.
    extendo(&mut s);

    println!("{s}, {s2}");

}


fn extendo(input_string: &mut String)
{
    input_string.push_str("Carlos Mercado");

}

`

\ _Dangling References_ \

Dangling Pointer: A pointer that references a location in memory that may have been given to someone else-by freeing some memory while preserving a pointer to that memory.  

Think of why this wouldn't work:

`
fn main() {
    let reference_to_nothing = dangle();
}

fn dangle() -> &String {
    let s = String::from("hello");

    &s
}

`

*REMEMBER* that memory is freed when the owner of the memory goes out of scope. So in this case, the underlying reference would be pointing to some invalid memory. Luckily, rust doesn't let us do this and this program does not compile.

To avoid this we can just transfer ownership by returning the actual string not just a reference to it. This process changes to transfers ownership to the variable reference_to_nothing which means that the underling data does not get freed at the end of the dangle() function scope. 


=== \ _4.3 The Slice Type_ \

Problem... if we have a function that tracks the first word in a string split up with spaces, and that function returns some ending index of that first word, once we change that string by clearing it or changing the length of the first word somehow that returned number from the function has become out of sync with the actual string.

\ _String Slices_ \

A string slice a contiguous sequence of elements of a string.

`
    let s = String::from("Hello world");

    let hello = &s[0..5];
    let world = &s[6..11];

`
A cool thing here is that these two variables are references to not whole strings, but part of them.

The string slice type is written as `str` so a reference to string slice would be `&str`.

Going back to the problem previously discussed. Imagine if we had a function that instead of tracking the first index of a space string to denote the first word, returns a slice of a string. Now, after using the function and assigning the result slice reference to some variable, we use `.clear()` on the original string object. What happens when this program compiles? The program does not compile!

Why? Remember we can't have an immutable reference to some variable and a mutable value to the same one. We don't want the immutable reference's value to change from under it! This is what happens when `.clear()` is used since clear need a mutable reference to the data.

\ _String Literals as Slices_ \

String literals are actually stored in the binary since their size is known at compile time. So fun fact,

`let s = "Hello world";`

the variable 's' here is actually a string slice reference or `&str`.


=== Questions

#align(center, block[
  *What is a slice?*

  A slice is a reference to a specific section of `String` or array. A slice references a specific, contiguous set of memory not the whole thing. Although they can be functionally the same, like `&s` and `&s[..]`
])

#align(center, block[
  *Does a slice own the data it points to? What happens to the underlying data when the slice goes out of scope?*

  A slice does not own the data it points to. It is a reference at the end of the day that means that ownership is never transferred. Just like normal references the when the reference to the slice goes out of scope, nothing happens to the underlying data until the owner of the data goes out of scope which is when the data will be dropped.
])

#align(center, block[
  *Why is returning a `usize` index (as shown in Listing 4-7) considered "brittle" or prone to bugs compared to returning a string slide?*

  The index is only meaningful when it is used with the exact same, unedited string or collection. If the string is changed in any way that changes the first word. The index returned loses all meaning, this can result in errors later on in the program if this value is used after the change.
])

#align(center, block[
  *What's the actual data type of a string literal like `let s = "Hello";` and why are they always immutable*

  The actual data type of 's' is &str or a string slice reference. String literals are always immutable because of their fixed size, which means that they store in the binaries read-only section. We cannot make changes to the binary at runtime.
])


#align(center, block[
  *If you have `let s = String::from("Hello");` what are the different ways to write a slice that includes the entire string*

  `
    let way = &s[..];
    let way = &s[0..s.len()];
    let way = &s[..s.len()];
    let way = &s[0..];
  `
])

#align(center, block[
  *What two specific pieces of data does a slice store internally?*

  It stores a pointer to the start of the data and the length of the slice.
])


#align(center, block[
  *Why is it more idiomatic to define a function signature as `fn first_word(s: &str) -> &str` instead of using &String*

  It's better to use &str because if the user want to pass a string slice reference that is covered, if they want to pass a string reference, you pass the string reference it still works.
])


#align(center, block[
  *If you have an active immutable slice of a String, why does the compiler prevent you from calling clear() on that same string*

  This is the case because you can't have an active immutable reference and an active mutable reference to the same string (which clear() needs because it has to change the underlying data). The compiler stop this action from happening so that the data isn't changed up from under the immutable reference's feet. (prevent race condition and ensure safety).
])


#align(center, block[
  *Given the array: `let a = [10, 20, 30, 40, 50]`, how would you create a slice containing the elements `[20, 30, 40]` and what would it's type be.*

  `let slice = &a[1..4]`
])


#pagebreak()
== _Chapter 5: Using `structs` to Structure Related Data_ 

\ defining a `struct`.

`
struct User {
  active: bool,
  username: String,
  email: String,
  sign_in_count: u64,
}
`

Want to use the `struct` that you have defined? This is how you create an instance.

`
let user1 = User {
  active: true,
  username: String::from("username_for_user1"),
  email: String::from("someone@example.com"),
  sign_in_count: 1,
};

`

Want to access some value from the `struct` use dot notation

`let uname = user1.username;`

If you want to change some variable in a `struct` instance the variable must be set to `mut`.


=== \ _Field Init Shorthand_ \


`
fn build_user(email: String, username: String) -> User
{
    User
    {
        active: false,
        username,
        email,
        sign_in_count: 1,
    }
}

`

Notice. we don't have to do `username: username` or `email: email`. Why? Notice that the parameter names of the function and the `struct` field names are the exact same. This fact let's us take advantage of the _Field Init Shorthand_ syntax.

=== \ _Creating Instances with Struct Update Syntax_ \

Sometimes it's easier to use create a instance of a `struct` that is almost identical to another instance, because we can reuse the parameters like this:

`
let user2 = User {
  active: user1.active,
  username: user1.username,
  email: String::from("another@example.com"),
  sign_in_count: user1.sign_in_count,
};

`

We can achieve the same result in a more concise manner with the _struct update_ syntax:

`
let user2 = user {
  email: string::from("another@example.com"),
  ..user1
};

`
*VERY IMPORTANT NOTE* _struct update syntax_ uses `=` like assignment. This means that the data for `username` is *MOVED* not copied making user1 not valid after the move. If had done this would user1 be valid?

`
let user2 = user {
  email: string::from("another@example.com"),
  username: string::from("user2"),
  ..user1
};

`
Yes! Remember that u64 and bool implement Copy so those values will be copied instead of moved and the varable `user1` will still be valid.


=== \ _Creating Different Types with Tuple Structs_ \

_Tuple Structs_ give you the added meaning that the struct name provied but they don't have the names associated with each field. Rather just the types of the fields. 

`
struct Point(i32, i32, i32);
struct Color(i32, i32, i32);

fn main()
{
  let black = Color(0,0,0);
  let origin = Color(0,0,0);
}
`

If you are worried that black and origin will be interpreted as the same types, don't worry they won't be because they are instances of different tuple `structs`.

You can destructure an instance like this: `let Point(x,y,z) = origin;` 

=== \ _Defining Unit-Like `structs`_ \

Want to define `structs` that don't have fields?

`struct AlwaysEqual;`

=== Questions

#align(center, block[
  *What is the primary difference between a Tuple and Struct?*

  In a struct, each field is named. This makes the code more clear for a reader.
])

#align(center, block[
  *Can you mutate a single field of a `struct` instance?*

  No. To make a field of a `struct` instance mutable, the whole instance has to be mutable.
])

#align(center, block[
  *What is a unit-like `struct` and when would you use one?*

  A unit like `struct` is a `struct` with no fields. They are useful when you need to implement a trait on some type but don't have any data that you want to store in the type itself.
])

#align(center, block[
  *How does ownership work when using the `struct` update syntax (..)*

  If an instance of a `struct` only contains variables that implement the `Copy` trait, the data is not moved just copied and there is no ownership change, the previous variable will still be valid. Now, if there is a field that does not implement `Copy` the `struct` instance, the data is moved and the previous owner of the data will no longer be valid.
])

=== \ _5.3 Methods_ \

`
#[derive(Debug)]
struct Rectangle 
{
    width: u32,
    height: u32,
}

impl Rectangle
{
    fn area(&self) -> u32
    {
        self.width * self.height
    }
}

fn main()
{
    let r1 = Rectangle{ width: 10, height: 20, };

    let area = r1.area();

    println!("area: {area}");

}
`

To define a method for a class, start an `impl` block for a given `struct`. `self` is actually short for `self: &Self` and `Self` is an alias for the type that the `impl` block is for. Methods must have a parameter named self of type Self for their first parameter. 

Example method with more than one paramter:

`
impl Rectangle
{
    fn area(&self) -> u32
    {
        self.width * self.height
    }

    fn can_fit(&self, other: &Rectangle) -> bool
    {
        self.width > other.width && self.height > other.height
    }
}

`

=== \ _Associated Functions_ \

Associated Functions are functions that are not methods, so no `self` parameter, but are part of the `impl` block.

example:

`
impl Rectangle
{
    fn square(size: u32) -> Self
    {
      Self {
        width: size,
        height: size,
      }
    }
}
`
Remember that the `self` keyword is an alias for the class name that appears after the `impl`. So this this function `square()` returns a instance of the class `Rectangle`.

To call this associated function do `let sq = Rectangle::square(3);`


=== Questions

#align(center, block[
  *What is the fundamental difference between a function and a method in Rust?*

  Methods in rust are defined in an `impl` block. Methods also must have the self keyword as their first parameter.
])

#align(center, block[
  *What does the `Self` keyword represent withing an `impl` block*

  The `Self` keyboard is an alias for the type that `impl` associates with.
])

#align(center, block[
  *When would you choose to use `self` (taking ownership) instead of `&self` (borrowing) as a method parameter*

  You would pass self by reference if you did not want the variable associate with the underlying structure to be invalidated after it is passed. 
])

#align(center, block[
  *What is an associated function, and how do you call one compared to a method?*

  An associated function is a function defined in an `impl` block that does not have `self` as the first parameter. You can call these functions like `Rectangle::square(2)`.
])


