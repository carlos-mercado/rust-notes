//#[derive(Debug)]
enum Coin { Penny, Nickel, Dime, Quarter }
//enum Position { PointGuard, ShootingGuard, SmallForward, PowerForward, Center }
enum Position { PointGuard(String), ShootingGuard, SmallForward, PowerForward, Center }


fn main()
{
    /*
    let y: Option<i8> = Some(5);
    let result = match y
    {
        Some(val) => 10 * val,
        None => 0,
    };

    println!("{result}");
    */

    //println!("{value}");



    let five = Some(5);
    let six = plus_one(five);
    let none = plus_one(None);

}

fn value_in_cents(coin: Coin) -> u8 
{
    match coin
    {
        Coin::Penny => 1,
        Coin::Nickel => 5,
        Coin::Dime => 10,
        Coin::Quarter => 25,
    }
}

fn plus_one(x: Option<i32>) -> Option<i32>
{
    match x 
    {
        None => None,
    }
}


