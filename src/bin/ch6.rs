#[derive(Debug)]
enum Coin { Penny, Nickel, Dime, Quarter(String) }

fn main()
{
    let x: i8 = 10;
    let y: Option<i8> = Some(5);
    let mut result: i8 = 0;

    match y
    {
        Some(val) => result = x * val,
        None => (),
    }

    println!("{result}");

    let c = Coin::Quarter(String::from("California"));
    let state = c;

    println!("{state:?}")
}
