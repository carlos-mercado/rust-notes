
/*
enum ListNode<T>
{
    Node(T, Box<ListNode<T>>),
    Nil
}
 */


struct MyBox<T>(T);

impl<T> MyBox<T>
{
    fn new(x: T) -> MyBox<T>
    {
        MyBox(x)
    }
}

use std::ops::Deref;
impl<T> Deref for MyBox<T> {
    type Target = T;

    fn deref(&self) -> &Self::Target
    {
        &self.0
    }
}

fn hello(name: &str)
{
    println!("Hello, {name}!");
}

fn main()
{

    let inner = 5;

    let b = MyBox::new(inner);

    assert_eq!(5, inner);
    assert_eq!(5, *b);

}
