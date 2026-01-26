trait Summary 
{
    fn summarize_author(&self) -> String;

    fn summarize(&self) -> String
    {
        format!("read more from {}...", self.summarize_author())

    }
}

pub struct SocialPost
{
    username: String,
    content: String,
    reply: bool,
    repost: bool,
}

impl Summary for SocialPost {
    fn summarize(&self) -> String {
        format!("{}: {}", self.username, self.content)
    }

    fn summarize_author(&self) -> String {
        String::from("Hi there")
    }
    
}

fn main() 
{


}

