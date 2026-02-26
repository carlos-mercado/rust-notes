use std::{sync::mpsc, thread::{self}, time::Duration};

fn main()
{
    let (tx, rc) = mpsc::channel();

    let t2 = tx.clone();
    let _transmitter = thread::spawn(move || {
        let vals = vec! [
            String::from("hi"),
            String::from("from"),
            String::from("the"),
            String::from("thread"),
        ];
        for s in vals
        {
            tx.send(s).unwrap();
            thread::sleep(Duration::from_secs(5));
        }
    });

    let _transmitter2 = thread::spawn(move || {
        let vals = vec! [
            String::from("more"),
            String::from("messages"),
            String::from("from"),
            String::from("thread two"),
        ];
        for s in vals
        {
            t2.send(s).unwrap();
            thread::sleep(Duration::from_secs(5));
        }
    });

    for got in rc
    {
        println!("Message from the transmitter: {got}");
    }
}
