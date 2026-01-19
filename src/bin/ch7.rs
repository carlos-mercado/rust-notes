enum TableCell
{
    Int(i32),
    Float(f64),
    Text(String),
}

fn main()
{
    let mut my_vec = vec![10, 20, 30];

    da_multiplier(&mut my_vec);

    for i in my_vec
    {
        println!("{i}");
    }

    let row = vec![
        TableCell::Int(3),
        TableCell::Float(3.0),
        TableCell::Text(String::from("Mount Rushmore")),
    ];

    iterate_row(row);
}

fn da_multiplier(user_vec: &mut Vec<i32>)
{
    for i in user_vec
    {
        *i *= 3;
    }

}

fn iterate_row(user_vec: Vec<TableCell>)
{
    for i in user_vec
    {
        match i
        {
            TableCell::Text(user_string) => println!("Found a string {user_string}"),
            _ => (),
        }
    }
}
