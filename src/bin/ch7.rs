fn main()
{
    let hello = String::from("Здравствуйте");
    for c in hello.chars()
    {
        println!("{c}");
    }

    println!("{hello}");
}

