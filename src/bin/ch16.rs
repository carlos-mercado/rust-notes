use std::sync::{Arc, Mutex};
use std::{thread, vec};

fn main() {
    let counter = Arc::new(Mutex::new(String::from("base")));
    let mut handles = vec![];

    let strings = Arc::new(Mutex::new(String::from("outer")));

    for _ in 0..2 
    {
        let counter = Arc::clone(&counter);
        let strings = Arc::clone(&strings);
        let handle = thread::spawn(move || {
            let mut base = counter.lock().unwrap();
            let append_this = strings.lock().unwrap();
            *base += &append_this;
        });
        handles.push(handle);
    }

    for handle in handles {
        handle.join().unwrap();
    }

    println!("Result: {}", *counter.lock().unwrap());
}
