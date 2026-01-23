//use std::net::IpAddr;

struct ValidGuess
{
    value: i32,
}

impl ValidGuess
{
    fn new(val: i32) -> ValidGuess
    {
        if val < 1 || val > 100
        {
            panic!("Guess must be between 1 and 100, got {val}");
        }

        ValidGuess { value: val }
    }

    fn change_val(&mut self, val: i32)
    {
        if val < 1 || val > 100
        {
            panic!("Guess must be between 1 and 100, got {val}");
        }

        self.value = val;
    }

}



fn main() 
{

    let mut my_guess = ValidGuess::new(5);

    let ValidGuess { value: my_val } = my_guess;

    println!("{my_val}");

    my_guess.change_val(67);

    let ValidGuess { value: my_val } = my_guess;

    println!("{my_val}");
}


