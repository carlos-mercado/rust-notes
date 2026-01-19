//#[derive(Debug)]
//enum Coin { Penny, Nickel, Dime, Quarter(String) }
//enum Position { PointGuard(String), ShootingGuard, SmallForward, PowerForward, Center }

enum Role { Admin(String), Editor, Viewer }

fn main()
{


    let admin = Role::Admin(String::from("carlos"));
    check_access(admin);
    check_access(Role::Editor);
    check_access(Role::Viewer);
}

fn process_nested_option(outer: Option<Option<i32>>)
{
    let Some(Some(val)) = outer else { return; };

    println!("The value is {val}");
}

fn check_access(role : Role)
{
    if let Role::Admin(name) = role
    {
        println!("Access Granted. Welcome {name}.")
    }
    else
    {
        println!("Access Denied.")
    }
}
