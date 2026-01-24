enum Model<T> { Sedan(T), SUV, Coupe, Hatchback, }

struct Vector2D<T>
{
    x: T,
    y: T,
}

impl Vector2D<f64>
{
    fn as_floats(&self) { }


}


fn main() 
{
    let val = Model::Sedan(String::from("def"));

}

