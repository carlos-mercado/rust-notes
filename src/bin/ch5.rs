
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

struct Rectangle 
{
    width: u32,
    height: u32,
}

fn main()
{
    let r1 = Rectangle{ width: 10, height: 20, };

    let area = rectagle_area(&r1);

    println!("area: {area}");

}

fn rectagle_area(r1: &Rectangle) -> u32 { r1.height * r1.width }


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
