fn main()
{
    let y = -33;

    let result = add_one(y);

    println!("y is equal to {result}");
}

fn add_one(arg1: i32) -> i32 {
    arg1 + 1
}
