use std::cell::RefCell;

fn main() 
{
    let data = RefCell::new(vec![1,2,3]);
    let mut borrow_1 = data.borrow_mut();
    let _borrow_2 = data.borrow();
    borrow_1.push(4);

}
