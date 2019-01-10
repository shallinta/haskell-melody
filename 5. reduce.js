// reduce :: (a -> b -> a) -> a -> [b] -> a
var reduce = (f, acc, array) => {
  if (array.length === 0) {
    return acc;
  }
  var [x, ...xs] = array;
  return reduce(f, f(acc, x), xs);
};

var arr = [1,2,3,4,5]
console.log('arr = ', arr);

// sum :: Num a => [a] -> a
var sum = arr => arr.reduce((acc, x) => acc + x, 0);
var sum1 = arr => reduce((acc, x) => acc + x, 0, arr);
console.log('sum(arr) = ', sum(arr));
console.log('sum1(arr) = ', sum1(arr));

// product :: Num a => [a] => a
var product = arr => arr.reduce((acc, x) => acc * x, 1);
var product1 = arr => reduce((acc, x) => acc * x, 1, arr);
console.log('product(arr) = ', product(arr));
console.log('product1(arr) = ', product1(arr));


