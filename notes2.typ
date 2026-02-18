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
var = 2;
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
Will fail at compile time. Why? References are *_IMMUTABLE_* by default.


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


#pagebreak()
== _Chapter 6: Defining an Enum_ 

`structs` give you a way of grouping together related fields and data. `enums` give you a way of saying a value is one of a possible set of values. 

For example, we can make an `enum` of a IP address types.

`
enum IpAddrKind {
  V4,
  V6,
}

`

`IpAddrKind` is now a custom data type that we can use elsewhere in the code.


=== \ _Enum Values_ \

This is how you create instances of each of the two variants defined in `IpAddrKind`.

`
let four = IpAddrKind::V4;
let six = IpAddrKind::V6;

`

Since these variants are of the same type, `IpAddrKind`, we can define a function that can take both variants. 

`fn route(ip_kind: IpAddrKind) {}`

Calling the function:

`route(IpAddrKind::V4);
route(IpAddrKind::V6);`

Right now the `IPAddrKind` enum has no way of storing an actual IPv4 or IPv6 address. We can change that by doing this:

`
enum IpAddr {
  V4(String),
  V6(String),
}
`

So now that means that we can do this:

`let home = IpAddr::V4(String::from("127.0.0.1"));
let loopback = IpAddr::V6(String::from("::1"));`

We are attaching data to each `enum` variant directly. So, there is no need for a `struct`. The name of each `enum` variant also becomes a function that constructs an instance of an enum. So `IpAddr::V4()` is a function that takes a string arg and returns an instance of the `IpAddr` type.

=== \ _The Option `enum`_ \

The Option type encodes a very common scenerio in which a value could be _something_ or _nothing_.

For example, want the first element in an array? If the array has a first element it should be returned, but if it doesn't nothing should be returned. This concept will help the compiler find errors that commonly pop up in other languages. 

`
enum Option<T> {
  None,
  Some(T),
}

`
`<T>` is just a generic type parameter. `<T>` means that the `Some` variant of the `Option` `enum` can hold one piece of data of any type, and that each concrete type that gets used in place of T makes the overall `Option<T>` type a different type.

So, `Option<i32> and Option<char>` are different _types_.

Try to guess what happens here:
`
    let x: i8 = 5;
    let y: Option<i8> = Some(5);

    let sum = x + y;

`
If you guessed an error, you would be correct. Notice that `x and y` are different types. How can you add a  `Option<i8>` and an `i8`? Convert the `Option<i8>` to an `i8` right? How is that done?


=== Questions

#align(center, block[
  *How do `enums` differ from `structs` in terms of relationship between their data fields?*

  `structs` group together named fields, and every instance of the `struct` contain all of those fields.

  `enums` define multiple variants, and each instance of the `enum` is one specific variant that contains only the data fields that  are associated with that variant.
])

#align(center, block[
  *Why does book refer to null as a "billion dollar mistake"?*

  Errors occur when trying to use a null value as a non-null value.
])

#align(center, block[
  *If you have a variable of type <i8> and another of type Option<i8>, why can't you add them together?*

  They are fundamentally different types so they cannot be added. If you want to add them you have to convert the Option<i8> to <i8> using the `match` expression or other methods.
])



#align(center, block[
  *When you define a variant that takes arguments like `V4(String)` what does that variant name essentially become in your code?*

  That variant becomes a function that _constructs_ an instance of the `enum`
])


=== \ _6.2 The `match` Control Flow Construct_ \

`match` allows you to compare a value against a series of patterns and then execute code based on which pattern matches; 

Example use:
`
let player = Position::ShootingGuard;

match player
{
    Position::PointGuard => println!("Point Guard Player"),
    Position::ShootingGuard => println!("Shooing Guard Player"),
    Position::SmallForward => println!("Small Forward Player"),
    Position::PowerForward => println!("Power Forward Player"),
    Position::Center => println!("Center Player"),
}

`
=== \ _Patterns That Bind to Values_ \

If your `enums` store some data you can use `match` extract that data and use it if you want.

`
let player =  Position::PointGuard(String::from("Carlos"));


match player
{
    Position::PointGuard(player_name) => println!("Point Guard name is: {player_name}"),
    Position::ShootingGuard => println!("all other positions"),
    Position::SmallForward => println!("all other positions"),
    Position::PowerForward => println!("all other positions"),
    Position::Center => println!("all other positions"),
}

`
=== \ _The Option<T> `match` Pattern_ \ 

`match` is a valid method to use when trying to use the inner `<T>` out of a `Option<T>`. Or handle an `Option<T>` altogether.

`
fn plus_one(x: Option<i32>) -> Option<i32>
{
    match x 
    {
        None => None,
        Some(i) => Some(i + 1),
    }
}

`

=== \ _Catch-All Patterns and the `_` Placeholder_ \ 

Let's say you want to use `match`, but you want some specific behavior for a couple of arms but default behavior for the rest.

`
let dice_roll = 9;
match dice_roll {
    3 => add_fancy_hat(),
    7 => remove_fancy_hat(),
    other => move_player(other),
}

fn add_fancy_hat() {}
fn remove_fancy_hat() {}
fn move_player(num_spaces: u8) {}

`

Note that the catch all pattern must come at the end because evaluation happens in order. So if you put the catch all at the beginning, the other arms would never run.

If you want to have a catch all, but don't want to use the value, you can use this special pattern.

`
let dice_roll = 9;

match dice_roll {
    3 => add_fancy_hat(),
    7 => remove_fancy_hat(),
    _ => reroll(),
}

fn add_fancy_hat() {}
fn remove_fancy_hat() {}
fn reroll() {}

`
If you don't want run any code in a specific `match` arm you can do this `_ => ()`.


=== Questions

#align(center, block[
  *Why is a `match` expression compared to a coin-sorting machine? How does the order of the "arms" affect the outcome?*

  Like a coin-sorting machine `match` will move the value into an arm that "fits" the variable. The order of arms is important because if you have a catch-all arm before the other arms, those other arms will never run.
])


#align(center, block[
  *What is the primary difference between the requirement for a condition in an `if` expression versus a `match` expression.*

  The expression in an if statement must evaluate to a boolean, in a `match`, it can be any type.
])

#align(center, block[
  *What happens if you define a `match` block for an `enum` but forget to include one of the variants? Why does Rust enforce this?*

  If you forget to include a variant, the program will not compile. Rust does this do avoid errors that happen when we assume we have a value, when we might have null 
])

=== \ _6.3 Concise Control Flow with `if let` and `let else`_ \

The `if let` syntax let you combine `if` and `let` into a less verbose way to handle values that match one pattern while ignoring the rest.

If you use `match` to do something with a `Option<u8>` like this:

`
let config_max = Some(3u8);

match config_max {
  Some(max) => println!("The max is {max}")
  _ => (),
}

`
You can rewrite it in a shorter way using `if let`.

`
let config_max = Some(3u8);

if let Some(max) = config_max
{
    println!("THe max is {max}");
}

`

Just like that you have saved yourself some keystrokes, but at the cost of the exhaustive checking that `match` enforces. It's a trade off so, do what's appropriate for your application.

You can include an else with an `if let`. If you want this kind of behavior with an `if let`:

`
let mut coin = Coin::Penny;

match coin
{
    Coin::Quarter(state) => println!("The state for this Quarter is {state}"),
    _ => print!("This coin is not a quarter"),
    
}

`

You can do this:

`
let coin = Coin::Penny;

if let Coin::Quarter(state)  = coin
{
    println!("The state for this Quarter is {state}");
}
else
{
    print!("This coin is not a quarter");
}
`

=== \ _Staying on the "Happy Path" with `let..else`_ \ 

Example usage:

`
fn inc_quarter_counts(coin: Coin, counts:  &mut u32)
{
    let Coin::Quarter(_) = coin else { return; };

    *counts = *counts + 1;
}

`

Notice that we are able to immediately return from the function if the pattern does not match that of the pattern that we expected.

Code inside of the else arm must return from the function.


=== Questions

#align(center, block[
  *What is the primary trade off when choosing `if let` over a `match` expression*

  A `match` expression is much more exhaustive, it makes sure all cases are accounted for. `if let` is more concise but it only accounts for pattern.
])


#align(center, block[
  *In a `let...else` statement, where is the variable bound in the pattern available for use? How does this differ from the variable binding in an `if let` block?*

  If the pattern does match the variable will be available to use in the outer scope of a let...else statement. In an `if let` statement the bound variable is only usable inside the block.

])

#align(center, block[
  *What is the strict requirement for the code inside the else block of a `let..else` statement?*

  The code inside the `else` must return from the function, or use some other method to not allow execution past the let..else statement.
])

#align(center, block[
  *Describe a scenario where `if let` is considered "syntax sugar"? What does it look like when rewritten as a standard `match`?*


  `if let Coin::Dime = my_coin {} else {}`. 
  This would be considered "syntactic sugar", it is less verbose than the `match` alternative:

  `match my_coin { Coin::Dime => (), _ => (), }`

])

#pagebreak()
== _Chapter 7: Packages, Crates, and Modules_ 
=== \ _7.1 Packages and Crates_ \

_Crates_
- The smallest amount of code that the compiler considers at a time.
- Can contain modules, which may be defined in other files that get compiled with the crate.
- Two forms
- - Binary Crate
- - Library Crate

*_Binary Crates_*: Programs that you can compile to an executable that you can run. Each must have a function called `main` that defined what happens when the executable runs.

*_Library Crates_*: These crates don't have a `main` function. They define functionality that is to be shared with multiple projects.

*_Crate Root_*: A source file that the rust compiler starts from and makes up the root module of your crate.

*_Package_*: A set of one or more crates that provides a set of functionality

=== \ _7.2 Control Scope and Privacy with Modules_ \

/*I WILL FINISH THE NOTES FOR THIS CHAPTER LATER*/


#pagebreak()
== _Chapter 8: Common Collections_ 

There are a number of useful data structures in the Rust standard library called _*Collections*_. The data that these collections point to is stored on the heap, meaning that the amount of data does not need to be known at compile time, so it can grow or shrink as the program runs.

The Three Main Collections:
- Vector
- String
- Hash Map

=== \ _8.1 Storing Lists of Values with Vectors_ \

To create a new, empty vector, call the `Vec::new` function.

`let v: Vec<i32> = Vec::new();`

Make sure to add a type annotation, although the compiler knows that `v` is a vector it does not know what type of data the vector will store.

If you want to create `Vec<T>` with some initial values you can use the `vec!` macro.

`let v = vec![1,2,3];`

Here rust can infer that the type will be a vector of integers so the type would be `Vec<i32>` `i32` because that is the default integer type.

To push to a vector, use the `push` method.

`
let mut v: Vec<i32> = Vec::new();

v.push(1);
v.push(2);
v.push(3);

`

=== \ _Reading Elements of Vectors_ \

Two approaches:
- Indexing
- Using the `get` method.

The indexing approach:

`let third: &i32 : &v[2];`

The `get` approach:

`let third: Option<&i32> = v.get(2);`

What are the _differences_?

When trying to access an invalid / out-of-bounds index
- The indexing approach will cause the program to _panic_
- The get approach will return `None` without _panic_ 'n

Don't forget about those pesky borrowing rules! We can't hold an immutable reference to data while we also have a mutable reference to that same data!

`
let mut v = vec![1,2,3,4,5];

let first = &v[0];

v.push(6);

println!("The first elem: {first}");

`
This won't work, the `push()` method needs a mutable reference to `v` and we already have an immutable reference to `v` with `first`.

=== \ _Iterating Over the Values in a Vector_ \

Using a `for` loop to get immutable reference to each element in a vector:

`
let v = vec![1,2,3,4,5];

for i in &v
{
    println!("{i}");
}

`

Now using a `for` loop to get a _mutable_ reference to each element:

`
let mut v = vec![1,2,3,4,5];

for i in &mut v
{
    *i = *i + 1;
}

`

=== \ _Using an Enum to Store Multiple Types_ \

Vectors only store values that are of the same type, but with the help of `enums` we can functionally change that. Remember that all variants of a `enum` are defined under the same type.

`
enum SpreadsheetCell
{
    Int(i32),
    Float(f32),
    Text(String),
}
let row = vec![
    SpreadsheetCell::Int(3),
    SpreadsheetCell::Text(String::from("blue")),
    SpreadsheetCell::Float(10.12),
];

`

=== Questions

#align(center, block[
  *When using `Vec::new()` to create an empty vector without adding initial values, why is a type annotation required?*

  A type annotation is required, because the compiler must know what kind of data you intend to store in the vector. This is not required when using the `vec!` macro when creating a vector with initial values because the compiler can infer the data being stored from those initial values.
])

#align(center, block[
  *What is the fundamental difference in behavior between accessing a vector using indexing and using the `get` method?*

  The get method will return a `Option<T>` while directly indexing will return a `T`. When accessing a out of bound index `get()` will return `None` and when doing the same thing for direct-indexing, the program will panic.
])

#align(center, block[
  *Why does Rust prevent you from adding an element to a vector while you still hold an immutable reference to an existing element in that same vector*

  Rust does not allow you to hold an immutable reference to some data while you also have a mutable reference to that same data for security. To be more specific this, in this case, this is not allowed because if you try to append to the vec in memory and that vector no longer fits in it's allocated space, the whole vector will have to move to a larger space in memory. This means that the space in memory that that immutable reference pointed to is no longer valid. This could lead to unexpected behavior in the program.
])

#align(center, block[
  *What happens to the elements stored inside a vector when the vector variable goes out of scope*

  The memory is freed.
])


#align(center, block[
  *Since the vectors can only store values of the same type, how can you use an `enum` to technically store different data types in a single list?*

  Since all variants of an `enum` are technically of the same type, you can take advantage of that fact and make a vector of that `enum`
])

=== \ _8.1 Storing UTF-8 Encoded Text with Strings_ \


=== \ _Defining Strings_ \

Rust has only one string type in the core language `str` the string slice. String literals are also string slices.

The `String` type is a provided by the Rust standard library. A `String` is a growable, mutable, owned, UTF-8 encoded string type.

=== \ _Creating a String_ \

`let mut s = String::new();`

This line creates a new string called `s`.

To create a string with some initial data:

`let data = "initial contents";
let s = data.to_string;

//or do this
let s = "initial contents".to_string();

`

You can also use the `String::from()` method to create a `String` from a string literal.


=== \ _Updating a String_ \

_Appending with Push_

`
let mut s = String::from("foo");
s.push_str("bar");
`


_Concentrating with `+` or `format!`_

Want to combine two existing strings? Use the `+` operator.

`
let s1 = String::from("Hello, ");
let s2 = String::from("World!");
let s3 = s1 + &s2;

println!("{s3}")

`

Why did we use use a reference to `s2` and just just use regular `s1`? Let's look at  the `add()` method that the `+` operator uses.

`fn add(self, s: &str) -> String {`

`s1` will no longer be valid after the `s3` assignment, since there is no `&` in front of self.


If you need to concentrate multiple strings, using the `+` operator get unwieldy, so use the `format!` macro instead.

`
let s1 = String::from("tic");
let s2 = String::from("tac");
let s3 = String::from("toe");

let s = format!("{s1}-{s2}-{s3}");

`

This call uses references so that this call doesn't take ownership of any of it's parameters.

=== \ _Indexing into Strings_ \

You can do this in other Programming languages.

`
let s1 = String::from("hi");
let h = s1[0];

`

But not in Rust.

A `String` is a wrapper over a `Vec<u8>`. 

`let hello = String::from("Hola");` 

In this case, `len` will be 4, meaning that the vector storing the string "Hola" is four bytes long. But this is not always the case.

`let hello = String::from("Здравствуйте");`

How long would you way that this string is? 12? To Rust it's actually 24 because that is the amount of bytes that you need to encode that string in UTF-8. Therefore, an index to the string's bytes will not always correlate to a valid unicode scalar value.

=== \ _Indexing into Strings_ \

Rather than indexing using `[]` with a single number, you can use `[]` with a range to create a string slice containing particular bytes.:

`
let hello = String::from("Здравствуйте");
let s = &hello[0..4];

println!("{s}");

`

Here `s` would be a `&str` that contains the first 4 bytes of the string. Since each of these characters is two bytes, s would be "Зд".

=== \ _Iterating Over Strings_ \

To best operate on pieces of strings, be explicit about wanting characters or bytes. For individual Unicode scalar values, use the `chars` method. Calling `chars` on "Зд" sparates out and returns two values of type `char`, and you can iterate over the result to access each element:

`for c in "Зд".chars() { println!("{c}"); } `

if you want bytes

`for c in "Зд".bytes() { println!("{c}"); } `


=== Questions

#align(center, block[
  *What is the fundamental difference between the `String` type and the string slice type `&str`*

  Unlike the string slice type, the `String` type has a dynamic size, is owned, and is heap-allocated.
])


#align(center, block[
  *Why does Rust not allow you to access a character using a simple index like s[0]*

  Rust does not allow this behavior because you might need more than 1 byte to encode certain UTF-8 characters. If you try to index into a string with character size > 1byte, at s[0], what should the program return? The full char? But the char is greater than one byte is size!

])

#align(center, block[
  *A string is described as a wrapper over which specific collection type*

  `Vec<u8>`
])

#align(center, block[
  *When you use the `+` operator to concentrate two strings, what happens to the ownership of the first argument?*

  The ownership of the first argument is transferred to the add function.
])

=== \ _8.3 Storing Keys with Associated Values in Hash Maps_ \

The type `HashMap<K, V>` stores a mapping of keys of type `K` to values of type `V` using a hashing function.

\ _Creating a New Hash Map_ \

Using `new`:

`let mut scores = HashMap::new(); `

\ _Accessing Values in a Hash Map_ \

Use the `get()` method, to access values in a `HashMap`.

`
let team_name = String::from("Blue");
let score = scores.get(&team_name).copied().unwrap_or(0); 

`
What is happening:
- The `get()` method will return an `Option<&V>`. If there is value for that key, `get()` returns None. 
- The program calls `copied()` to handle the option data, to get a `Option<i32>` rather than an `Option<&i32>`.
- The program then calls `unwrap_or()` to set the `score` to zero if scores doesn't have an entry for the key,.

\ _Iterating over a `HashMap`_ \

`
for (key, value) in &scores
{
    println!("{key}: {value}");
}

`

This will print each pair in an arbitrary order.

\ _Managing Ownership in Hash Maps_ \

Types that implement the `Copy` trait like `i32`, the values are copied into the hash map. For owned values like String, the values will be moved and the hash map will  be the owner of those values.

If we instead move reference to values in the hash map, the values won't be moved. The values that the references point to must be valid for at least as long as the hash map is valid.

\ _Updating a Hash Map_ \

\ Overwriting:
`
scores.insert(String::from("Blue"), 10);
scores.insert(String::from("Blue"), 50);

`

Adding a key and value only if a key isn't present:

`
scores.insert(String::from("Blue"), 10);
scores.insert(String::from("Yellow"), 50);

scores.entry(String::from("Blue")).or_insert(50);
scores.entry(String::from("Green")).or_insert(25);

`

- If a key does not exist (the `entry` method find that out), `or_insert()` will insert the parameter as the value for the key.

- If the key does exists, will return a mutable reference to the value for the corresponding key given to `entry`.

Updating a value based on the Old Value:

`
let mut map = HashMap::new();
let text = "hello world wonderful world";

for word in text.split_whitespace()
{
    let count : &mut i32 = map.entry(word).or_insert(0);
    *count += 1;
}

`

=== Questions

#align(center, block[
  *When you insert a `String` value into a `HashMap`, what happens to the ownership of those variables? How does this differ from types like `i32`.*

  When inserting a `String` into a `HashMap` the ownership will transfer to the `HashMap`. This differs from types like `i32`, that implement the `Copy` trait, where the data is just copied instead.
])

#align(center, block[
  *Explain the purpose of the `entry()` method. How does combining it with `or_insert()` allow you to update a value only if a key does not already exist?*

  The purpose of the `entry()` determine if a given key has an associated value. Using that information, `or_insert()` will either return a mutable reference to the value associated with that key, OR insert the parameter as the value for the key given to `entry()`.
])

#align(center, block[
  *The `get()` method returns an `Option<&V>`. Why doesn't it return the value directly, and what is a common way to handle the case where a key might be missing?*

  An `Option<&V>` is returned because a value might not exists for a given key. If a key is missing for a given value, use `unwrap_or` which will evaluate to the parameter if there is no associated value for a given key.
])

#pagebreak()
== _Chapter 9: Error Handling_ 
=== \ _9.1 Unrecoverable Errors with `panic!`_ \

\ Explicitly calling `panic()`

`fn main()
{
    panic!("crash and burn");
}

`

Calling `panic()` by trying to accessing an invalid index.

`fn main()
{
    let v = vec![1,2,3];
    v[99];
}
` 
This is a part of the output: 

`index out of bounds the len is 3 but the index is 99
note: run with 'RUST_BACKTRACE = 1' environment variable to display a backtrace. `

The note is good to know. We can set the RUST_BACKTRACE environment variable to get a backtrace of what exactly happened to cause the error. 

The _backtrace_ is a list of functions that have been called to get to that point.

Setting `RUST_BACKTRACE` to 1 on the same program:

`RUST_BACKTRACE=1 cargo run`

=== \ _9.2 Recoverable Errors with `Result`_ \

The `Result enum` definition:

`
enum Result(T, E)
{
  Ok(T),
  Err(E),
}

`
`T` and `E` are generic type parameters.
- T represents the type of the value that will be returned within the `Ok` variant if all is good.
- E represents the type of error that will be returned within the `Error` variant.

Calling a function that returns a `Result`

`
let greeting_file_result = File::open("hello.txt");

let f = match greeting_file_result {
    Ok(file) => file,
    Err(error) => panic!("Problemo opening file: {error:?}"),
};

`

\ _Matching on Different Errors_ \

Most times you are gonna want to approach different errors in different ways. For example if a file doesn't exist, why don't we create it? If we can't open a file because we don't have read permissions, we can `panic()` like before.

`
let greeting_file_result = File::open("hello.txt");

let greeting_file = match greeting_file_result {
    Ok(file) => file,
    Err(error) => match error.kind() {
        ErrorKind::NotFound => match File::create("hello.txt") {
            Ok(fc) => fc,
            Err(e) => panic!("Problem creating the file: {e:?}"),
        },
        _ => {
            panic!("Problem opening the file: {error:?}");
        }
    },
};
`
\ _Shortcuts for Panic on Error_ \

The `unrwap` method will behave exactly like the code segment, two segments ago. On `Ok` the method will return the value inside the `Ok`, and on error it will call the `panic!` macro for us.

`let greeting_file_result = File::open("hello.txt").unwrap();`

We can also achieve the same behavior AND choose the error message that appears on `Err` by using the expect method.

`
let greeting_file_result = File::open("hello.txt")
    .expect("Make sure hello.txt is in your project directory");
`

\ _Propagating Errors_ \

When writing a function that has some code that might fail, instead of handling the error within the function itself, pass it off to the user. This is called _Propagating_ the error.

Example: 

`
fn read_username_from_file() -> Result<String, io::Error> 
{
    let username_file_result : Result<File, std::io::Error> = File::open("username.txt");

    let mut username_file : File = match username_file_result  {
        Ok(file) => file,
        Err(e) => return Err(e),
    };

    let mut username : String = String::new();

    match username_file.read_to_string(&mut username) {
        Ok(_) => Ok(username),
        Err(e)  => Err(e),
    }
}

`

\ _The `?` Operator Shortcut_ \

We can make the previous implementation easier using the `?` operator by:

`
fn read_username_from_file2() -> Result<String, io::Error> 

{
    let mut username_file = File::open("username.txt")?;
    let mut username = String::new();
    username_file.read_to_string(&mut username)?;

    Ok(username)
}


`

How `?` works here:
- If the value of the `Result` is an `Ok`, the value inside will be returned.
- If the value of the `Result` is an `Err`, the `Err` will be returned from the WHOLE function.


=== \ _9.3 To `panic!` or Not to `panic!`_ \

When should you call `panic!`? When should you return `Result`?

_Examples, Prototype Code, and Tests_

When using example to illustrate some concepts, including robust error-handling can make the thing that you are trying to illustrate seem overwhelming, so you might throw in an `unwrap` or a `expect`. These methods are also very helpful when prototyping, and not ready to make decisions on how to handle errors. These methods can act as markers that can tell you where to make the implementation more robust when you are ready to do so.

_When You Have More Information Than the Compiler_

If you know that some expression will always return an `Ok` because of your implementation. It would be a good idea to call `expect()`.

`
let home: IpAddr = "127.0.0.1"
    .parse()
    .expect("Hardcoded IP address should be valid");

`

We know that "127.0.0.1" is definitely a valid IPv4 address, but the compiler doesn't, so a `Result` will still be returned. That's why we call `expect` to get the value always, and we can put the reason why we expect that expression to always evaluate to an `Ok` variant as the argument to the method.


_Guidelines for Error Handling_

We should `panic` when code is or could end up in a _bad state_. 

_*Bad State*_: When some assumption, guarantee, contract, or invariant has been broken such as when invalid values, contradictory values, or missing values are passed to your code-plus one or more of the following:
- The bad state is something that is unexpected.
- Code after this point needs to rely on not being in this bad state.
- There is not a good way to encode this information in types that you use.

_Custom Types for Validation_

What if could implement a type that MUST be valid, so we can use it freely, without having to worry about a bad value putting a program in a bad state.

Consider this module implementation:

`pub struct Guess {
    value: i32,
}

impl Guess {
    pub fn new(value: i32) -> Guess {
        if value < 1 || value > 100 {
            panic!("Guess value must be between 1 and 100, got {value}.");
        }

        Guess { value }
    }

    pub fn value(&self) -> i32 {
        self.value
    }
}

`

Notice that to make a guess, the user must pass a value through the `new()` associated function. This means that the user must pass the test in `new` to get an instance of `Guess`. Therefore ensuring that the Guess value will lie between 1-100.

#pagebreak()
== _Chapter 10: Generic Types, Traits, and Lifetimes_ 

Function can take parameters of some generic type, they are not limited to concrete types like `i32, String`. We have already seen them with `Option<T>`, `Vec<T>`.

=== _10.1 Generic Data Types_ 

\ _In Function Definitions_ \

Consider this code segment where two functions find the largest value in a slice.

`
fn largest_i32(list: &[i32]) -> &i32 {
    let mut largest = &list[0];

    for item in list {
        if item > largest {
            largest = item;
        }
    }

    largest
}

fn largest_char(list: &[char]) -> &char {
    let mut largest = &list[0];

    for item in list {
        if item > largest {
            largest = item;
        }
    }

    largest
}

fn main() {
    let number_list = vec![34, 50, 25, 100, 65];

    let result = largest_i32(&number_list);
    println!("The largest number is {result}");

    let char_list = vec!['y', 'm', 'a', 'q'];

    let result = largest_char(&char_list);
    println!("The largest char is {result}");
}

`
There is code duplication here, let's take advantage of generic types by introducing them here.

It would look like this: `fn largest<T>(list: &[T]) -> &T {`

This function can be read as: "The function target is generic over some type T".


\ _In `struct` Definitions_ \

You can also use generic types for the field types in `structs`.

`
struct Point<T>
{
    x: T,
    y: T,
}

`
Note that here the types of `x and y` have to match they are both of the same generic type.


\ _In `Enum` Definitions_ \

The same principle applies for `enums`.

`
enum Option<T>
{
    Some(T),
    None,
}

enum Result<T, E>
{
    Ok(T),
    Err(E),
}
`
\ _In Method Definitions_ \

`struct Point<T> {
    x: T,
    y: T,
}

impl<T> Point<T> {
    fn x(&self) -> &T {
        &self.x
    }
}

fn main() {
    let p = Point { x: 5, y: 10 };

    println!("p.x = {}", p.x());
}

`

You can also specify constraints on generic types when defining methods by doing this:


`
impl Point<f32> {
    fn distance_from_origin(&self) -> f32 {
        (self.x.powi(2) + self.y.powi(2)).sqrt()
    }
}

`

This means the type `Point<f32>` will have a special function `distance_from_origin()` that other types `Point<T>` will not have.

`
struct Point<X1, Y1> {
    x: X1,
    y: Y1,
}

impl<X1, Y1> Point<X1, Y1> {
    fn mixup<X2, Y2>(self, other: Point<X2, Y2>) -> Point<X1, Y2> {
        Point {
            x: self.x,
            y: other.y,
        }
    }
}

fn main() {
    let p1 = Point { x: 5, y: 10.4 };
    let p2 = Point { x: "Hello", y: 'c' };

    let p3 = p1.mixup(p2);

    println!("p3.x = {}, p3.y = {}", p3.x, p3.y);
}
`

Consider this code segment. Here the `mixup` method is generic over an additional two types this means that the "self" point and other point can have different types.




=== Questions

#align(center, block[
  *Where exactly must you declare a generic type parameter in a function signature so the compiler can recognize it?*

Immediately after the function name so `fn function_name<T>...`
])

#align(center, block[
  *Why did the first version of the generic `largest<T>` function fail to compile?*

  It failed to compile because the function would not work for all types.
])

#align(center, block[
  *What is the standard convention for naming generic type parameters in Rust?*

  Usually one uppercase letter, like 'T' which stands for Type.
])

#align(center, block[
  *You define `struct Point<T> { x: T, y: T }`. Why does the compiler throw an error if you try to create a point with an integer `x` and a float `y`?*

Because integer and float are two fundamentally different types. The point `struct` definition states that x and y can be any generic type, but they must be the SAME generic type together.

])

#align(center, block[
  *How would you rewrite the `Point` struct to allow x and y to be different types from one another*

  `struct Point<T, U> { x: Y, y: U }`

])

#align(center, block[
  *Explain how the `Option<T>` and `Result<T,E> enums` use generics to handle optional values and potential errors across different data types.*

  `Option` has `Some<T>` which wraps around a value of some generic type, and `Result` has `Ok(T)` and `Err(E)` each wrapping distinct types.

])

#align(center, block[
  *Explain how the `Option<T>` and `Result<T,E> enums` use generics to handle optional values and potential errors across different data types.*

  `Option` has `Some<T>` which wraps around a value of some generic type, and `Result` has `Ok(T)` and `Err(E)` each wrapping distinct types.

])

#align(center, block[
  *Imagine you are writing a library for a 2D game. You want a Vector2D<T> struct. How would you define this struct so that both coordinates must be the same type?*
])

  `
struct Vector2D<T>
{
    x: T,
    y: T,
}

`
#align(center, block[
  *How would you implement a method as_floats that only works if a vector is already made of f64 floats?*
])
`
impl Vector2D<f64>
{
    fn as_floats(&self) { }


}`

=== _10.2 Defining Shred Behavior with Traits_ 

\ *_Trait_*: Defines functionality that a particular type has and can share with other types.
\ *_Trait Bounds_*: Used to specify that a generic type can be any type that has certain behavior.

_Defining a Trait_

`trait Summary 
{
    fn summarize(&self) -> String;
}

`

Note you will probably be putting this in `src/lib.rs` not `main.rs` so pop a `pub` in front of trait so all crates depending on this crate can use it.

Declaring a trait `Summary`. Inside the `{}` we declare the method signatures that describe the behaviors of types that implement this trait. In this case `summarize()`.

Note that there is no implementation here. That is the job of each type that aims to implement this trait. Each type must provide their own custom behavior.

\ _Implementing a Trait on a Type_ \

`pub struct NewsArticle {
    pub headline: String,
    pub location: String,
    pub author: String,
    pub content: String,
}

impl Summary for NewsArticle {
    fn summarize(&self) -> String {
        format!("{}, by {} ({})", self.headline, self.author, self.location)
    }
}

pub struct SocialPost {
    pub username: String,
    pub content: String,
    pub reply: bool,
    pub repost: bool,
}

impl Summary for SocialPost {
    fn summarize(&self) -> String {
        format!("{}: {}", self.username, self.content)
    }
}

`

A restriction:

We can implement a trait on a type on if either the trait, the type, or both, are local to our crate.

WE CAN:
- implement a trait like `Display`, from the std, on a custom type like `SocialPost` as part of our crate functionality because the type `SocialPost` is local to our crate.

- implement `Summary` on `Vec<T>` in our crate because the trait `Summary`   is local to our aggregator crate.


WE CAN'T:
- The `Display` trait on a `Vec<T>` within out crate. Both `Display` and `Vec<T>` are defined in the standard library, aka not in our local crate. 

Rust does this to make sure that other people's code can't break your code and vice-versa. Without that rules, there could be two different implementations of a trait for the same type, and Rust would not know which to use.


\ _Using Default Implementations_ \

Want some default behavior for the methods of your traits?

`trait Summary 
{
    fn summarize(&self) -> String {
      String::from("(Read more...)")
    }
}

`

- You can still override this behavior by defining the method for the trait like we have done before.
- Default implementations can call other methods from the same trait, even those that don't have a default implementation;
- It's not possible to call the default implementation from an overriding implementation of that same method

\ _Using Traits as Parameters_ \

`
pub fn notify(item: &impl Summary) {
    println!("Breaking news! {}", item.summarize());
}
`
Instead of a concrete type for the `item` parameter, we specify the `impl` keyword and the trait name. Now this function accepts any type that implements the specified trait.


\ _Trait Bound Syntax_ \

`
pub fn notify<T: Summary>(item: &T) {
    println!("Breaking news! {}", item.summarize());
}
`

\ _Multiple Trait Bounds with the `+` Syntax_ \
`
pub fn notify(item: &(impl Summary + Display)) {

OR

pub fn notify<T: Summary + Display>(item: &T) {

`
\ _Clearer Trait Bounds with `where` Clauses_ \

`
fn some_function<T: Display + Clone, U: Clone + Debug>(t: &T, u: &U) -> i32 {

TURNS INTO

fn some_function<T, U>(t: &T, u: &U) -> i32
where
    T: Display + Clone,
    U: Clone + Debug,
{

`

\ _Returning Types that Implement Traits_ \

`
fn returns_summarizable() -> impl Summary {
    SocialPost {
        username: String::from("horse_ebooks"),
        content: String::from(
            "of course, as you probably already know, people",
        ),
        reply: false,
        repost: false,
    }
}

`
Here the return type is set to `impl Summary` that means that the type that we return from this function will implement the trait `Summary`.


\ _Using Trait Bounds to Conditionally Implement Methods_ \

`
use std::fmt::Display;

struct Pair<T> {
    x: T,
    y: T,
}

impl<T> Pair<T> {
    fn new(x: T, y: T) -> Self {
        Self { x, y }
    }
}

impl<T: Display + PartialOrd> Pair<T> {
    fn cmp_display(&self) {
        if self.x >= self.y {
            println!("The largest member is x = {}", self.x);
        } else {
            println!("The largest member is y = {}", self.y);
        }
    }
}

`
=== Questions

#align(center, block[
  *Explain the orphan rule regarding trait implementations*

  We can implement a trait on a type, only if either the type or trait are local to the crate. This is called the orphan rule because there must be some parent (a type or trait local to your crate).
])


#align(center, block[
  *How can a trait provide a default implementation that calls other methods within the same trait, even if those other methods don't have a default themselves?*

  A trait with default implementation can call other methods within the same trait because the type implementing the trait MUST define all methods that do not have a default implemenation.
])


#align(center, block[
  *What is the functional difference between using the `impl Trait` syntax and the generic trait bound syntax?*

  The `impl Trait` syntax is just a more concise way of doing the same thing.
])

#align(center, block[
  *What is the functional difference between using the `impl Trait` syntax and the generic trait bound syntax?*

  The `impl Trait` syntax is just a more concise way of doing the same thing, but the trait bound syntax is able to define behaviors with more complexity.

  This function that uses `impl Trait` here the arguments can be of different types as long as they implement the trait `Summary`
  `pub fn notify(item1: &impl Summary, item2: &impl Summary)`
  This function that uses trait bound syntax, it makes sure that both arguments are of the SAME type
  `pub fn notify<T: Summary>(item1: &T, item2: &T)`

])

#align(center, block[
  *What is a "blanket implementation"?*

  A blanket implementation is a implementation of a trait on a type that satisfies the trait bounds. 
])

=== _10.3 Validating References with Lifetimes_ 

\ *_Lifetime_*: The scope for which a reference is valid.
- Lifetimes can be explicit OR inferred.
- Annotation is only required when  the lifetimes of references could be related in a few different ways.

_Dangling References_

Lifetimes aim to prevent dangling references. A _dangling reference_ is a pointer or reference that points to a memory location that has been deallocated, freed, or gone out of scope.

Consider:

`
let r;

{
    let x = 5;
    r = &x;

}
println!("r: {r}");

`

This code will not compile. Why? The value that r is referencing has gone out of scope before we get to use it. 

Rust knows that this code is invalid because of the borrow checker.

_The Borrow Checker_

The Rust compiler makes use of a "tool" called the borrow checker that compares scopes to determine whether all borrows are valid.

`
fn main() {
    let r;                // ---------+-- 'a
                          //          |
    {                     //          |
        let x = 5;        // -+-- 'b  |
        r = &x;           //  |       |
    }                     // -+       |
                          //          |
    println!("r: {r}");   //          |
}                         // ---------+

`

Here we can see that the lifetime of `x`, annotated as `'b` is shorter that that of `r`. The program is rejected because 'b is shorter than 'a. The subject of the reference does not live as long as the reference

Now consider the updated version:

`fn main() {
    let x = 5;            // ----------+-- 'b
                          //           |
    let r = &x;           // --+-- 'a  |
                          //   |       |
    println!("r: {r}");   //   |       |
                          // --+       |
}                         // ----------+

`
Here `x` has a longer lifetime than r which means that r can reference x because rust knows that the reference r will always be valid while x is valid.


_Generic Lifetimes in Functions_

Creating a function that return the longest of two string slices (taken as input):

`
fn longest(a: &str, b: &str) -> &str
{
    if a.len() > b.len() { a } else { b }


`

Problem! This function does not work! Why?

The compiler does not know if the reference being returned refers to `a` or `b`. We don't know either it depends on which string slice is bigger! We will add generic lifetime parameter to give the compiler more info to do its job.

_Lifetime Annotation Syntax_

Lifetime annotations don't change how long any of the references live. Instead they describe the relationships of the lifetimes of multiple references to each other without affecting the lifetimes. 

Functions can accept any reference with any lifetime by specifying a generic lifetime parameter.

Syntax: `
&i32        // a reference
&'a i32     // a reference with an explicit lifetime
&'a mut i32 // a mutable reference with an explicit lifetime
`

One lifetime annotation does not have much meaning by itself, the annotations are meant to tell rust how generic lifetime parameters of multiple references relate to each other.

\ _In Function Signatures_ \

`
fn longest<'a>(a: &'a str, b: &'a str) -> &'a str
{
    if a.len() > b.len() { a } else { b }
}
`

This function signature tells rust that for some lifetime `'a`, the function takes to string slice parameters that live at least as long as the lifetime `'a`.

This means that the lifetime of the reference returned by the `longest()` function is the same as the smaller of the lifetimes of the values referred to by the function arguments.

_Relationships_

If we wanted to change `longest()` to always return the first parameter rather than the longest string slice, we wouldn't need a to specify a lifetime on the `b` parameter

`
fn longest<'a>(a: &'a str, b: &str) -> &'a str
{
    if a.len() > b.len() { a } else { b }
}`

When returning a reference from a function, the lifetime parameter for the return type needs to match the lifetime parameter for one of the parameters.

\ _In Struct Definitions_ \

The `structs` that we have made so far have only been those that are composed of owned fields. That does not have to be the case though. You can make `structs` with reference fields, but we have to add a lifetime annotation to every reference in the `structs` definition.

`
struct ImportantExcerpt<'a> {
    part: &'a str,
}

fn main() {
    let novel = String::from("Call me Ishmael. Some years ago...");
    let first_sentence = novel.split('.').next().unwrap();
    let i = ImportantExcerpt {
        part: first_sentence,
    };
}

`

The single field in `ImportantExcept`, `part` hold a string slice, which is a reference.


\ _Lifetime Elision_ \

There are cases or situations where you will not have to write the lifetimes of your references. The compiler has some patterns built in that will infer them, called the *_lifetime elision rules_*. 

*Input lifetimes*: Lifetimes on a function or method parameters.
*Output lifetimes*: Lifetimes on return values.

There three rules that the compiler uses to figure out the lifetimes of the references when there aren't explicit annotations. If the compiler is not able to provide a lifetime to all input and output lifetimes, it will result in an error.

- Rule One: The compiler assigns a lifetime parameter to each parameter that's a reference.
- Rule Two: If there is exactly one input lifetime parameter, that lifetime is assigned to all output life parameters
- Rule Three: If there are multiple lifetime parameters, but one if them is &self or &mut self because this is a method, the lifetime of self is assigned to all output lifetime parameters.


\ _In Method Definitions_ \

Consider: `
impl<'a> ImportantExcerpt<'a> {
    fn level(&self) -> i32 {
        3
    }
}

`

Here the first rule applies in the method `level()` so we don't have to add the lifetime to `self`.

`
impl<'a> ImportantExcerpt<'a> {
    fn announce_and_return_part(&self, announcement: &str) -> &str {
        println!("Attention please: {announcement}");
        self.part
    }
}

`
Here the first rule applies, both `self` and `announcement` are given distinct lifetimes. Then, since `&self` is one of the arguments, rule three applies, so the lifetime of the output will match that of the lifetime of the `self`.

\ _The Static Lifetime_ \

This is a special lifetime that can live for the entire duration of the program. All string literals have the `'static` lifetime

`let s: &'static str = "I have a static lifetime."; `


\ _Generic Type Parameters, Trait Bounds, and Lifetimes_ \

Generic type params, trait bounds, and lifetimes all in one function

`use std::fmt::Display;

fn longest_with_an_announcement<'a, T>(
    x: &'a str,
    y: &'a str,
    ann: T,
) -> &'a str
where
    T: Display,
{
    println!("Announcement! {ann}");
    if x.len() > y.len() { x } else { y }
}

`

My attempt at putting this function into words: The function `longest_with_an_announcement()` is generic over the type T, with the restriction that T must implement the trait `Display`. `longest_with_an_announcement()` specifies that all references in the signatures have the same lifetime `'a`. Takes three inputs. `x` a string slice, which is a reference, with lifetime `'a`, `y` which is also a string slice, with lifetime `'a`. Finally, the parameter `ann` has the generic type `T`.  This function returns a string slice with the lifetime `'a`.



#pagebreak()
== _Chapter 11: Writing Automated Tests_ 


=== _11.1 How to Write Tests_ 

_*Tests*_: Rust functions that verify that the non-test code is functioning in the expected manner.

Tests preform these three main actions:
- Set up any needed data or state.
- Run the code you want to test.
- Asset that the results are what you expect.

_Structuring Test Functions_

The simplest way that you can define tests in rust, is simply any function that's annotated with the `test` attribute.

_*Attributes*_: Metadata about pieces of rust code.

To change a function to a test function simply add `#[test]` on the line before `fn`.

You can run your tests with the `cargo test` command. 


_Checking Results with `assert!`_

`assert!` is a macro that takes an argument that evaluates to a boolean.
- If the value is true, nothing happens and the test passes.
- If the value is false, the macro calls `panic!`, causing the test to fail.


_Testing Equality with `assert_eq!` and `assert_ne!`_

These macros compare to arguments for equality or inequality.

_Adding Custom Failure Messages_

`assert!`, `assert_eq!` and `assert_ne!` can be passed a failure message as part of an optional argument.

`
let result = greeting("Carol");
assert!(
    result.contains("Carol"),
    "Greeting did not contain name, value was `{result}`"

);
`

Now you will get an informative message on error.

_Checking for Panics with `should_panic`_

Add the attribute `should_panic` to the test function. Note that it should go after the `test` attribute and before the function.



`pub struct Guess {
    value: i32,
}

impl Guess {
    pub fn new(value: i32) -> Guess {
        if value < 1 || value > 100 {
            panic!("Guess value must be between 1 and 100, got {value}.");
        }

        Guess { value }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    #[should_panic]
    fn greater_than_100() {
        Guess::new(200);
    }
}
`

_Using `Result<T,E> in Tests`_

`#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_works() -> Result<(), String> {
        let result = add(2, 2);

        if result == 4 {
            Ok(())
        } else {
            Err(String::from("two plus two does not equal four"))
        }
    }
}

`

=== _11.2 Controlling How Tests Are Run_ 

`cargo run` => Compiles your code and then runs the resultant binary.
`cargo test` => Compiles your code (in test mode) and then runs the resultant _test_ binary.


\ _Running Tests in Parallel or Consecutively_ \

When running multiple tests, they are ran in parallel using threads, for faster results. Therefore, make sure that the tests don't depend on each other or some shared state.

If it is the case that you are testing a function that must have this behavior, you can use this option `--test-threads` flag.

Example: `cargo test -- --test-threads=1`

Only one thread means on parallelism.

\ _Showing Function Output_ \

If a test passes, and the function being tested prints to the standard output, the test will capture it, meaning that nothing will pre printed.

If it fails we are able to see the printed output.

You can change this behavior with:

Example: `cargo test -- --show-output`


\ _Running a Subset of Tests by Name_ \

Consider:

`
pub fn add_two(a: u64) -> u64 {
    a + 2
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn add_two_and_two() {
        let result = add_two(2);
        assert_eq!(result, 4);
    }

    #[test]
    fn add_three_and_two() {
        let result = add_two(3);
        assert_eq!(result, 5);
    }

    #[test]
    fn one_hundred() {
        let result = add_two(100);
        assert_eq!(result, 102);
    }
}

`

Running one test: `cargo test one_hundred`
- This runs the test with the name `one_hundred`

Filtering to run multiple tests: `cargo test add`
- This runs all tests with `add` in the name.


\ _Ignoring Tests Unless Specifically Requested_ \

You can annotate test functions with `#[ignore]` if you have a function that you don't want to test unless you really really want to. This is useful if a test takes a long time and you don't want to test that scenario every time.


=== _11.3 Test Organization_ 

The 2 Categories of Testing:
- _Unit tests_: Small are more focused. Testing one module in isolation at a time, and can test private interfaces.
- _Integration Tests_: Entirely external to you library and use your code the same way any other external code would.


\ _Uni Tests_ \

Goal: Test each unit of code in isolation from the rest of the code to quickly poinpoint wher cod e is and isn't working as expected. 

These tests will go in the `src` directory in each file with the code that they're testing. Create a module named tests in each file to contain the test functions and annotate the module with `cfg(test)`.

\ _The `tests Module and #[cfg(test)]`_ \

The `#cfg(test)]` annotation on the tests module tells rust compile and run the test only when running `cargo test`, not when running `cargo build`.

\ _Private Function Tests_ \

You can test private functions if you really want to, rust will not stop you.


\ _Integration Test_ \

These test are entirely external to your library. The tests will use your library in the same way any other code would. These tests make sure that all of the parts that make up your program fit together and work together. Parts of code that work fine in isolation might not do so when integrated with different parts of a program.

\ _The tests Directory_ \

`
adder
├── Cargo.lock
├── Cargo.toml
├── src
│   └── lib.rs
└── tests
    └── integration_test.rs

`

*Example `integration_test.rs`*

`
use adder::add_two;


#[test]
fn it_adds_two() {
    let result = add_two(2);
    assert_eq!(result, 4);
}
`

*output:*

`
$ cargo test
   Compiling adder v0.1.0 (file:///projects/adder)
    Finished `test` profile [unoptimized + debuginfo] target(s) in 1.31s
     Running unittests src/lib.rs (target/debug/deps/adder-1082c4b063a8fbe6)

running 1 test
test tests::internal ... ok

test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s

     Running tests/integration_test.rs (target/debug/deps/integration_test-1082c4b063a8fbe6)

running 1 test
test it_adds_two ... ok

test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s

   Doc-tests adder

running 0 tests

test result: ok. 0 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s


`

The first section is for unit tests.

The integration tests section starts with the line `Running tests/integration_tests.rs`

Then the Doc-tests adder section starts


\ _Integration Tests for Binary Crates_ \

If the project only contains a `src/main.rs` file and doesn't have a `src/lib.rs` file, we can't create integration tests in the tests directory and bring functions defined in the main.rs file into scope with a `use` statement.

#pagebreak()
== _Chapter 13: Functional Language Features: Iterators and Closures_

=== _13.1 Closures_

\ *_Closures_*: Anonymous functions that you can save in a variable or pass as arguments to other functions.

\ _Capturing the Environment_ \

Consider this function from the text:
`fn giveaway(&self, user_preference: Option<ShirtColor>) -> ShirtColor
{
    user_preference.unwrap_or_else(|| self.most_stocked());
}`

The `unwrap_or_else` method takes in one argument: a closure without any arguments, that returns a value T (It should match the same type stored in the Some(T) variant of option.), in this case `ShirtColor`.
- If `Option<T>` is the `Some` variant. the method will return the value within the `Some`.
- If `None` the method will call the closure and return the value returned by the closure.

In the function we specify the closure expression`|| self.most_stocked()` as the argument to the method. This is a closure with no `params`. (Note that closures with args will have them between those two vertical bars). In the body of the closure we see that it calls `self.most_stocked`.

_Important Note_. The closure captures an immutable reference to the `self Inventory` instance and passes it with the code we specify to the `unwrap_or_else` method.

\ _Inferring and Annotating Closure Types_ \

Closures don't require you to annotate the types of the parameters or the return value like functions do.

Note that you can't do this:

`
let example_closure = |x| x;
let result = example_closure(1);
let result2 = example_closure(2);
`

You can't do this since the type of the closure could be inferred multiple ways. It is basically like saying:

`
let mut test_vec = Vec::new();
test_vec.push(1);
test_vec.push(String::from("testing"));
test_vec.push(3); ;`


\ _Capturing References or Moving Ownership_ \

Closures can capture values from their environment in three ways:
- Borrowing immutably
- Borrowing mutably
- Taking ownership

Capturing an immutable reference:

`fn main() {
    let list = vec![1, 2, 3];
    println!("Before defining closure: {list:?}");

    let only_borrows = || println!("From closure: {list:?}");

    println!("Before calling closure: {list:?}");
    only_borrows();
    println!("After calling closure: {list:?}");
}

`

Capturing an immutable reference:


`fn main() {
    let mut list = vec![1, 2, 3];
    println!("Before defining closure: {list:?}");

    let mut borrows_mutably = || list.push(7);

    borrows_mutably();
    println!("After calling closure: {list:?}");
}

`

Remember we can't have multiple mutable references to data at the same time so we can't add another mutable reference to `list` after defining the closure and before calling the closure.

To force the transfer of ownership _to_ a closure, use the `move` keyword.

`use std::thread;

fn main() {
    let list = vec![1, 2, 3];
    println!("Before defining closure: {list:?}");

    thread::spawn(move || println!("From thread: {list:?}"))
        .join()
        .unwrap();
}

`

Here's what's happening in the code:
- We spawn a new thread, giving the thread a closure to run as an argument.
- The closure body prints out the list.

In the definition of the closure, we put the `move` at the beginning to transfer ownership of the data in list.


\ _Moving Captured Values Out of Closures_ \

A closure body can do:
- Move a captured value out of the closure.
- Mutate the captured value.
- Neither move nor mutate the value.
- Capture nothing from the environment.

Closures will automatically implement one, two, or all three of these `Fn` traits in a n additive fashion, depending on how the closure's body handles the values:

- `FnOnce`: All closures that can be called once. (All closures implement this one)
- `FnMut`: All closures that don't move captured values out of their body but might mutate the captured values.
- `Fn`: All closures that don't move captured values out of their body and don't mutate the captured values, as well as closures that capture nothing form their environment.

=== Questions

#align(center, block[
  *What determines how a closure captures a value from it's environment?*

  The usage of the captured value determines how it is captured from the environment. If the value is mutated it is captured as mutable, if the value is just printed, it is captured as immutable. However if the `move` keyword is put at the beginning of the closure definition, the values ownership is transferred to the closure.
])

#align(center, block[
  *When would you need to use the `move` keyword before a closure's parameter list?*

  A scenario when you might use the `move` keyword would be to transfer ownership of a list to a closure that is running on a new thread. If you do not include the `move` keyword and the main thread finishes (and drops the data) before the new thread, the data in the new thread will be invalid
])

#align(center, block[
  *What is the main difference between a closure that implements `FnMut` and one that only implements `FnOnce`?*

- FnMut closures can mutate variables they capture from their environment, but they do not necessarily move (take ownership of) those variables, they borrow them mutably.
- FnOnce closures can only be called once because they may move (take ownership of) captured variables, consuming them.
- The main difference: FnMut allows multiple calls and mutable borrowing, while FnOnce allows only one call and may move captured values.
])

=== _13.2 Processing a Series of Items with Iterators_

Want to perform some task on a sequence of items in a turn? Use an iterator.

Iterators have no effect until you call methods that consume the iterator to use it up.

Consider: 

`
let v1 = vec![1,2,3];
let it = v1.iter();
`

This code creates an iterator over the items in the vector v1, by calling the iter method defined on `Vec<T>`. But since there is no method called on the iterator to consume it, nothing useful happens.

Using an iterator in a `for` loop.

`
let v1 = vec![1, 2, 3];

let v1_iter = v1.iter();

for val in v1_iter {
    println!("Got: {val}");
}

`

\ _The `Iterator` Trait and the `next` Method_ \

All iterators implement the trait `Iterator` that is defined in the `std`.

This is the definition:

`
pub trait Iterator {
    type Item;

    fn next(&mut self) -> Option<Self::Item>;

    // methods with default implementations elided
}
`

Note that `type Item;` is defining an associated type `Item` (more on associated types later). Basically code is saying that to implement the `Iterator` you must define an `Item` type, and this type is used in the return type of the next method. I.e. The `Item` type will be returned from the iterator.

Implementors of the `Iterator` trait must implement the `next()` method. This method returns on item of the iterator at a time, wrapped in `Some`, and when the iteration is over, returns None.


`
#[test]
fn iterator_demonstration() {
    let v1 = vec![1, 2, 3];

    let mut v1_iter = v1.iter();

    assert_eq!(v1_iter.next(), Some(&1));
    assert_eq!(v1_iter.next(), Some(&2));
    assert_eq!(v1_iter.next(), Some(&3));
    assert_eq!(v1_iter.next(), None);
}

`

The values that we get from calls to `next` are immutable references to the values in the vector. The `iter` method produces an iterator over immutable references, but if you want to create an iterator that takes ownership of v1 and returns owned values, call `into_iter` instead of `iter`. If you want to iterate over mutable references, call `iter_mut`.


\ _Methods That Consume the Iterator_ \

_Consuming Adapters_: Methods that call `next`.

Example the `sum` method:

`
#[test]
fn iterator_sum() {
    let v1 = vec![1, 2, 3];

    let v1_iter = v1.iter();

    let total: i32 = v1_iter.sum();

    assert_eq!(total, 6);
}

`
After the call to `sum` we can't use `v1_iter` because sum takes ownership of the iterator that it is called on.

\ _Methods that Produce Other Iterators_ \

_Iterator Adapters_: Methods that don't consume the iterator.

Example, the `map` method.

`
let v1: Vec<i32> = vec![1, 2, 3];

let res : Vec<_> = v1.iter().map(|x| x + 1).collect();

`

Note that if you were to remove the call to `collect()`, the program would not work. The compiler reminds us that iterators are lazy, we must consume the iterator to do anything, and that is what `collect()` does.


\ _Closures That Capture Their Environment_ \

A lot of iterator adapters will take closures as arguments, and a lot of those times the closures will capture their environment. 

Example
`#[derive(PartialEq, Debug)]
struct Shoe {
    size: u32,
    style: String,
}

fn shoes_in_size(shoes: Vec<Shoe>, shoe_size: u32) -> Vec<Shoe> {
    shoes.into_iter().filter(|s| s.size == shoe_size).collect()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn filters_by_size() {
        let shoes = vec![
            Shoe {
                size: 10,
                style: String::from("sneaker"),
            },
            Shoe {
                size: 13,
                style: String::from("sandal"),
            },
            Shoe {
                size: 10,
                style: String::from("boot"),
            },
        ];

        let in_my_size = shoes_in_size(shoes, 10);

        assert_eq!(
            in_my_size,
            vec![
                Shoe {
                    size: 10,
                    style: String::from("sneaker")
                },
                Shoe {
                    size: 10,
                    style: String::from("boot")
                },
            ]
        );
    }
}

`


=== Questions
#align(center, block[
  *What happens when trying to run this code segment `v1.iter().map(|x| x + 1);` without any further function calls*

  The closure is never called, iterators are lazy they don't do anything unless they are consumed.
])

#align(center, block[
  *Consuming vs. Adapting. Which type is sum(), which type is filter()*

  The `sum()` method is consuming, it does not return a iterator after it is done, and it calls next repeatedly until it returns `None`. 

The `filter()` method is adapting, it returns an iterator, and does not consume the iterator.


They both take ownership of the iterator but only consuming adapters, consume the iterator.
])

#align(center, block[
  *When calling `.next()` manually on an iterator, why must the iterator variable be declared as `mut`?*

Because the underlying sate of the iterator changes on the `.next()` call.

  Why don't we have to do this when using a `for` loop?

The loop takes ownership of the iterator and makes it mutable behind the scenes.

])

#align(center, block[
*Choosing the Right Iterator*
`.iter()`: Produces a iterator over an immutable references.
`.into_iter()`: Produces a iterator over owned values.
`.inter_mut()`: Produces a iterator over owned values.
])

#pagebreak()
== _Chapter 15: Smart Pointers_

\ _Using `Box<T>` to Point to Data on the Heap_ \

_Boxes_ allow us to store data on the heap, rather than the stack. What remains on the stack is a pointer to the heap data.

_Boxes_ do not have a performance overhead.

_Boxes will likely be used in these situations_:
- When you have a type who's size is not known at compile time.
- When you have alot of data, and you want to transfer ownership of that data, without copying the data.
- When you want to own a value, and don't care that it's a specific type and only care that it implements a certain trait.

\ _Storing Data on the Heap_ \

Using a `Box<T>` to store an i32 value.

`
fn main()
{
    let b = Box::new(5);
    println!("b = {b}");
}
`

The value `5` will be allocated on the heap, and the program will print the "b = 5".

\ _Enabling Recursive Types with Boxes_ \

A value of a _recursive type_ can have another value of the same type as part of itself. The problem is that rust need to know at compile how much space a type takes up, but nesting types in this way can, produce a nest that could continue infinitely. 

\ _Understanding the Cons List_ \

A _cons list_ is a data structure that is a nested list of pairs:

`(1, (2, (3, nil)))`

Each item in a cons list contains two elements, the current value, and the next item. The last item in the list contains only a value called `Nil` without a next item.

\ _Implementing a Cons List_ \

`
enum List 
{
    Cons(i32, Box<List>),
    Nil,
}
`

#align(center, block[
*Where is the data stored when using Box<T>? Where does the actual data `T` actually reside*
  The heap.
])

#align(center, block[
*What is indirection?*
  Indirection is accessing data through a pointer, reference or other intermediary. 
])


#align(center, block[
*Why does Rust require types to be of known size at compile time? Why do recursive types like a `Cons list` fail this requirement without a pointer?*

  If we don't know the size of a type when compiling a program, how will the compiler know how much memory to allocate when making a instance of a type? Recursive types fail at this since they are self-referencing in that, to know the size of a rec type we add up the sizes of the non-recurive fields, but we are eventually gonna have to find the size of recursize-type which depends on the size of the reqcusive type which depends on the size of the recusive type and so on. This is like asking someone for the definition of a word, in response they give you a response that has the word in the definition, it does not make it any clearer
])


#align(center, block[
*Which two traits make `Box<T>` a smart pointer rather than just a raw pointer, and which functionality does each provide.*
  `Deref`: Allows and instance of the smart pointer to behave like a reference so that you can write your code to work with either references or smart pointers.
  `Drop`: Allows you to customize the code that's run when an instance of the smart pointer goes out of scope.
])

#align(center, block[
*In the example of the `List` enum, why does changing `Cons(i32, List)` to `Cons(i32, Box<List>` allow the code to compile?*
    Because a `Box<T>` is of known size, specifically `usize`, I believe. This makes the `List` type break out of the previous recursion.
])

#align(center, block[
*What happens when a heap data when a `Box` variable goes out of scope?*
  The data is dropped.
])

=== \ _15.2 Treating Smart Pointers Like Regular References_ \

If you implement the `Deref` trait you can customize the behavior of the `*` (dereference) operator. We can implement `Deref` in such a way that a smart pointer can be treated like a regular reference, and write code that operates on references that can also accept smart pointers too.

\ _Following the Reference to the Value_ \

A regular reference is a type of pointer, we can think of a pointer as a arrow to avalue stored somewhere else.


`
  let x = 5;
  let y = &x;

  assert_eq!(5, x);
  assert_eq!(5, y);
`

Why wouldn't this work? Because in this case both x and y are of fundamentally different types. `x` is your run of the mill `i32` but `y` is a reference to an `i32`, so it's not actually an `i32` it is a "arrow" to an `i32`.


`
  let x = 5;
  let y = &x;

  assert_eq!(5, x);
  assert_eq!(5, *y);
`

This is the correct comparison.


\ _Using `Box<T>` Like a Reference_ \

`
  let x = 5;
  let y = Box::new(x);

  assert_eq!(5, x);
  assert_eq!(5, *y);

`
We can use boxes to achieve similar behavior to that of references. Note that the behavior might seem identical remember that `Box::new(T)` creates data on the heap, so the value of `x` here is copied onto the heap, and the pointer will point to that location in the heap.

\ _Defining Our Own Smart Pointer_ \

`
  struct MyBox<T>(T);

  impl<T> MyBox<T>
  {
      fn new(x: T) -> MyBox<T>
      {
          MyBox(x)
      }
  }

`

Now if we try to use it:

`
  let inner = 5;

  let b = MyBox::new(inner);

  assert_eq!(5, inner);
  assert_eq!(5, *b);

`

But, this doesn't work. Why? We have not implemented that functionality yet to do so, we must implement the `Deref` trait.

\ _Implementing the `Deref` Trait_ \


`
  use std::ops::Deref;
  impl<T> Deref for MyBox<T> {
      type Target = T;

      fn deref(&self) -> &Self::Target
      {
          &self.0
      }
  }

`


\ _Using Deref Coercion in Functions and Methods_ \

_Defer Coercion_: Converting a reference to a type that implements the `Deref` into a referece to another type.

So, an example would be converting &String -> &str because String implements the `Deref` trait such that it returns `&String`

Say we have a function
`
fn hello(name: &str)
{
    println!("Hello, {name}!");
}

`

Sure we can call this function with a string slice, but since our `Box<T>` specifically `&Box<String>` type can turn into a `&String` type by calling `deref()` and `&String` can be turned into `&str` by calling `deref`, we can pass a `&Box<String>` to the function.

=== \ _15.3 Running Code on Cleanup with the `Drop` Trait_ \

Implementing the `Drop` trait let's you customize what happens when a value goes out of scope.

Defining the behavior of a smart pointer's data when it goes out of scope.

`
struct CustomSmartPointer
{
    data: String,
}

impl Drop for CustomSmartPointer {
    fn drop(&mut self)
    {
        println!("Dropping CustomSmartPointer with data: {}!", self.data)
    }
}

fn main()
{

    let a = CustomSmartPointer{ data: String::from("one") };
    let b = CustomSmartPointer{ data: String::from("two") };

    println!("CustomSmartPointers created!");
}


`

We defined the `Drop` trait to print the data of the pointer when it is dropped. This is the output:


`CustomSmartPointers created!
Dropping CustomSmartPointer with data: two!
Dropping CustomSmartPointer with data: one!

`

We can't call the destructor explicitly. Doing `a.drop()` won't work. If yyou want to fore a value to be cleaned up early call `std::mem::drop` 


=== Questions

#align(center, block[
  *Why the drop trait?*

  Other languages force you to drop the data from memory manually, but this can cause issues because it is not uncommon to forget to free the data, this can cause the unfreed memory to pile up and eventually crash the program. Rust's approach is to do this automatically, not even giving the user the ability to forget to free the data. 
])


#align(center, block[
  *If you create two variables, a and then b, in the same scope, and both implement the `Drop` trait, in what order will their drop methods be called when they go out of scope? Why is this specific order significant?*

`b` will be dropped first, then `a`. This is because Rust drops variables in the reverse order of their declaration within a scope. This order is significant as it helps prevent resource dependency issues during cleanup.
])

=== \ _15.4 `Rc<T>`, the Reference Counted Smart Pointer_ \

In most cases, know exactly which variable own a given value. But there are cases where this is not the case. For example, in a graph data structure, multiple edges might point to the same node, and that node is conceptually owned by all edges that point to it. The data that makes up that node should only be freed when it doesn't have any edges pointing to it.

To enable multiple ownership use the rust type `Rc<T>`, and abbreviation for _reference counting_. The type keeps track of the number of references to a value to determine whether or not the value is still in use.

Use the type when you want to allocate some data on the heap for multiple parts of the program to read and we can't determine at compile time which part will finish using the data last.

`Rc<T>` is only for use in single-threaded scenerios.

\ _Using `Rc<T>` to Share Data_ \

This doesn't work. Why?
`
enum List 
{
    Cons(i32, Box<List>),
    Nil,
}

use crate::List::{Cons, Nil};

fn main()
{
    let a = Cons(5, Box::new(Cons(10, Box::new(Nil))));
    let b = Cons(3, Box::new(a));
    let c = Cons(3, Box::new(a));

}

`
The `Cons` variants own the data that they hold, so when we create the `b` list, `a` is moved into `b` and `b` owns `a`. Then, we try to use `a` again when creating `c`, which me can't do since `a` has been moved to `b`.

We could change the `Cons` def to hold references instead, but then we would need to specify lifetime parameters. Meaning every element in the list would need to live as long as the entire list, this might work for the previous example, but it would not always be the case.

The `Rc<T>` approach:

`
use std::rc::Rc;

enum List 
{
    Cons(i32, Rc<List>),
    Nil,
}

use crate::List::{Cons, Nil};

fn main()
{
    let a = Rc::new(Cons(5, Rc::new(Cons(10, Rc::new(Nil)))));

    let b = Cons(3, Rc::clone(&a));
    let c = Cons(4, Rc::clone(&a));

}


`

What's happening:
- Creating a list holding 5 and 10,  and storing it in a new `Rc<List>` named a.
- Creating list `b`, and calling the `Rc::clone` associated function and passing it a reference to the `a`.

It is very important to note that although using `a.clone()` would work, it does something different. Most of the implementations of `.clone()` make deep copies of the data, this means that there would be completely new data created, we don't want that (probably), so we use `Rc::clone` which only increments the reference count.

=== \ _15.5 `RefCell<T>` and the interior Mutability Pattern_ \

_Interior mutability_: A design pattern that allows you to mutate data even when there are immutable references to that data. Is is usually a no-no. The pattern uses `unsafe` code inside a data structure to bend the rules so that we can get control over mutation and borrowing.

We use types that have this pattern only when we can ensure that the borrowing rules will be followed at runtime.


=== Questions

#align(center, block[
  *Why does `RefCell<T>` allow you to mutate data even if the `RefCell` itself is stored in an immutable variable, whereas a `Box<T>` would not.*

  `RefCell` uses "interior mutability", meaning that it moves the enforcement of borrowing rules from compile-time to runtime.
])

#align(center, block[
  *What happens when executing this code?*
`
let data = RefCell::new(vec![1,2,3]);
let mut borrow_1 = data.borrow_mut();
let borrow_2 = data.borrow();
borrow_1.push(4);
`

This code will compile, but will panic at run time when borrow_2 is called.
Can't have an immutable and mutable reference at the same time.
])
