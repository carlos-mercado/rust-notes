trait Summary 
{
    fn summarize(&self) -> String;
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
    
}

fn main() 
{


}

