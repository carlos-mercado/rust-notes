struct Grade
{
    value: i32,
}

impl Grade
{
    fn new(value: i32) -> Result<Grade, String>
    {
        if value < 0 || value > 100
        {
            return Err(String::from("Grade must be between 0 and 100, got {value}"));
        }

        Ok(Grade { value })
    }

    fn value(&self) -> i32 { self.value }
}


fn main() 
{

    
}


