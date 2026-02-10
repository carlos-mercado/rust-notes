enum ListNode<T>
{
    Node(T, Box<ListNode<T>>),
    Nil
}


fn main()
{
    let mut x = 5;

    let x_reference = &mut x;

    *x_reference += 5;

    let boxed_x : Box<&mut i32> = Box::new(&mut x);

    **boxed_x *= 2;


}
