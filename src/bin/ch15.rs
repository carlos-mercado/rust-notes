use std::rc::Rc;

enum List 
{
    Cons(i32, Rc<List>),
    Nil,
}

fn main() {
    let n = Rc::new(2);
    let n2 = Rc::clone(&n);
    *n2 += 1;

}
