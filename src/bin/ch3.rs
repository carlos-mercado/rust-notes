fn main()
{

    for i in 0..10
    {
        let fib_response = fib(i);
        println!("{fib_response}");

    }
}

fn f_to_c(temp: f32)-> f32 { (temp - 32.0) * 5.0 / 9.0 }
fn c_to_f(temp: f32)-> f32 { temp * 9.0 / 5.0 + 32.0 }

//get the nth fib number
fn fib(n: u32) -> u32
{
    let mut left = 0;
    let mut right = 1;

    if n == 0
    {
        return left;
    }
    else if n == 1
    {
        return right;
    }


    for _ in 1..n
    {
        let new = left + right;

        left = right;
        right = new;
    }

    right
}
