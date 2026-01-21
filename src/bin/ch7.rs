use std::collections::{HashMap};


fn main()
{
    /*
    let in_vec = vec![100, 10, 12, 13, 13, 13, 15, 15, 16, 16, 18, 22, 23, 24, 24, 25];
    let mean = find_mean(&in_vec).unwrap();
    let median = find_median(&in_vec).unwrap();
    let mode = find_mode(&in_vec).unwrap();
    //println!("Mean: {mean} \nMedian: {median}\nMode: {mode}")
    */

    //let pig = string_to_pig_latin(String::from("apple")).unwrap();
    //println!("{pig}");

    let mut my_vec : HashMap<String, Vec<String>> = HashMap::new(); //Department => {name1, name2, ...}

    add_name_to_department(String::from("Carlos"), String::from("IT"), &mut my_vec);
    add_name_to_department(String::from("Steve"), String::from("IT"), &mut my_vec);
    add_name_to_department(String::from("Will"), String::from("IT"), &mut my_vec);
    add_name_to_department(String::from("Stack"), String::from("IT"), &mut my_vec);

    print_department_names(String::from("IT"), &mut my_vec);


}

fn find_mean(user_vec: &Vec<i32>) -> Option<f32>
{
    if user_vec.is_empty() { return None; }

    let mut sum: i32 = 0;
    for i in user_vec { sum += i; }

    Some(sum as f32 / user_vec.len() as f32)
}

fn find_median(user_vec: &Vec<i32>) -> Option<i32>
{
    if user_vec.is_empty() { return None; }

    let mut vec_clone = user_vec.clone();
    vec_clone.sort();

    let midpoint : usize = vec_clone.len() / 2;

    Some(vec_clone[midpoint])
}

fn find_mode(user_vec: &Vec<i32>) -> Option<i32>
{
    if user_vec.is_empty() { return None; }

    let mut map = HashMap::new();

    for i in user_vec
    {
        let count = map.entry(i).or_insert(0);
        *count += 1;
    }

    let mut max_key : i32 = 0;
    let mut max_val = 0;

    for (key, val) in map
    {
        if val > max_val
        {
            max_val = val;
            max_key = *key;
        }
    }

    Some(max_key)
}

fn string_to_pig_latin(user_string: String) -> Option<String>
{
    if user_string.is_empty() { return None; }

    let first_c : char = user_string.chars().next().unwrap();


    if "aeiou".contains(first_c)
    {
        Some(format!("{}hay", user_string))
    }
    else
    {
        let rest = user_string.chars().skip(1).collect::<String>();
        Some(format!("{}{}ay", rest, first_c))
    }
}

fn add_name_to_department(name: String, department: String, data: &mut HashMap<String, Vec<String>>)
{
    let names : &mut Vec<String> = data.entry(department).or_insert(Vec::new());
    names.push(name);
}

fn print_department_names(department: String, data: &HashMap<String, Vec<String>>)
{
    let res = data.get(&department);

    match res
    {
        Some(vec) => println!("Members of {department} department: {vec:?}"),
        None => (),
    }

}
