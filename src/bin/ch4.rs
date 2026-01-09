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
