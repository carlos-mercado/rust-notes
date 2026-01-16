
/*
struct User
{
    active: bool,
    username: String,
    email: String,
    sign_in_count: u64,
}
struct Point(i32, i32, i32);
*/

use std::{f32::RADIX, fs::ReadDir, str::RMatchIndices};


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

struct Circle { radius: f32, }

impl Circle
{
    fn diameter(&self) -> f32
    {
        self.radius * 2.0
    }

    fn new(radius: f32) -> Self
    {
        Self {
            radius,
        }
    }

}


fn main()
{
    let c1 = Circle{ radius : 3.0 };

    let d = c1.diameter();

    let c2 = Circle::new(12.0);

    let d2 = c2.diameter();



    println!("diameter: {d}");
    println!("diameter2: {d2}");

}

//fn rectagle_area(r1: &Rectangle) -> u32 { r1.height * r1.width }


/*
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
*/
