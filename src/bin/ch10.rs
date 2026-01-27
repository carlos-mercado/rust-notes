fn main() 
{
    let s: &'static str = "I have a static lifetime.";

    let not_this_string = String::from("a");

    let response;
    {
        let smaller = String::from("xyz");
        response = longest(not_this_string.as_str(), smaller.as_str());
        println!("The longest string is : {response}");
    }

}

fn longest<'a>(a: &'a str, b: &'a str) -> &'a str
{
    if a.len() > b.len() { a } else { b }
}

fn longest_string(a: &String, b: &String) -> &String
{
    if a.len() > b.len() { a } else { b }
}
