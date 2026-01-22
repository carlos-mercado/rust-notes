use std::fs::{File, FileTimes};
use std::io::{self, Read};


fn main() 
{
    let mut s = String::from("test");
    s.pop();

}

fn read_username_from_file() -> Result<String, io::Error> 
{
    let username_file_result : Result<File, std::io::Error> = File::open("username.txt");

    let mut username_file : File = match username_file_result  {
        Ok(file) => file,
        Err(e) => return Err(e),
    };

    let mut username : String = String::new();

    match username_file.read_to_string(&mut username) {
        Ok(_) => Ok(username),
        Err(e)  => Err(e),
    }
}

fn read_username_from_file2() -> Result<String, io::Error> 
{
    let mut username_file = File::open("username.txt")?;
    let mut username = String::new();
    username_file.read_to_string(&mut username)?;

    Ok(username)
}
