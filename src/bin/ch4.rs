fn main()
{

    let a = [1,2,3,4,5];

    let slice = &a[1..4];

    println!("{:?}", slice);

}
fn find_first(s: &str) -> &str 
{
    let bytes = s.as_bytes();

    for (i, &item) in bytes.iter().enumerate()
    {
        if item == b' '
        {
            return &s[0..i];
        }
    }


    return s;
}
