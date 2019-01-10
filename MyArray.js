var empty = Symbol('Empty');
var array = function(head, tail) {
  this.head = head;
  this.tail = tail;
  if (!tail) {
    this.tail = empty;
  }
  this.toString = function() {
    if (this.tail === empty) {
      return `${this.head}:[]`;
    }
    return `${this.head}:${this.tail.toString()}`;
  }
}

var unshift = function(arr, x) { return new array(x, arr); }

var concat = function(arr1, arr2) {
  if (arr1 === empty) {
    return arr2;
  } else {
    return new array(arr1.head, concat(arr1.tail, arr2));
  }
}

var push = function(arr, x) { return concat(arr, new array(x)); }

var reverse = function(arr) {
  if (arr === empty) {
    return empty;
  } else {
    return push(reverse(arr.tail), arr.head);
  }
}

var first = function(arr) {
  if (arr === empty) {
    return empty;
  } else {
    return arr.head;
  }
}

var last = function(arr) {
  return first(reverse(arr));
}

var reduce = function(arr, foo, acc) {
  if (arr === empty) {
    return acc;
  } else {
    return reduce(arr.tail, foo, foo(arr.head, acc));
  }
}

var map = function(arr, foo) {
  if (arr === empty) {
    return empty;
  } else {
    return new array(foo(arr.head), map(arr.tail, foo));
  }
}

var sum1 = function(arr) {
  if (arr === empty) {
    return 0;
  } else {
    return arr.head + sum1(arr.tail);
  }
}

var sum2 = function(arr) {
  return reduce(arr, function(x, acc) { return acc + x; }, 0);
}

var arr1 = new array(2);
console.log(arr1);
var arr2 = unshift(arr1, 3);
console.log(arr2);
var arr3 = concat(new array(4), arr2);
console.log(arr3);
var arr4 = push(reverse(arr3), 5);
console.log(arr4);
var arr5 = push(map(arr4, function(x) { return x - 1; }), 5);
console.log(arr5);
console.log(sum1(arr5), sum2(arr5));
var arr6 = reduce(arr5, function(x, acc) {
  if (acc === empty) {
    return new array(x);
  } else {
    return concat(acc, new array(x + last(acc)));
  }
}, empty);
console.log(arr6);

var arr7 = reduce(arr5, function(x, acc) {
  if (acc === empty) {
    return new array(x - 1);
  } else {
    return concat(acc, new array(x - 1));
  }
}, empty);
console.log(arr7);
