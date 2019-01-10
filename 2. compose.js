// var compose = (f, g) => x => f(g(x));
function compose(f, g) {
  return function(x) {
    return f(g(x));
  }
}
var id = x => x;
var f = x => x + 5;
var g = x => x * 3;
var h = x => x - 1;

var f_1 = id(f);
var f_2 = compose(f, id);
var f_3 = compose(id, f);
var g_1 = id(g);
var g_2 = compose(g, id);
var g_3 = compose(id, g);
var fg = compose(f, g);
var gf = compose(g, f);
var h_gf = compose(h, gf);
var hg_f = compose(compose(h, g), f);

function start(x) {
  console.log('x = ', x);
  console.log('id(x) = ', id(x));
  console.log('f(x) = ', f(x));
  console.log('f_1(x) = ', f_1(x));
  console.log('f_2(x) = ', f_2(x));
  console.log('f_3(x) = ', f_3(x));
  console.log('g(x) = ', g(x));
  console.log('g_1(x) = ', g_1(x));
  console.log('g_2(x) = ', g_2(x));
  console.log('g_3(x) = ', g_3(x));
  console.log('fg(x) = ', fg(x));
  console.log('gf(x) = ', gf(x));
  console.log('h_gf(x) = ', h_gf(x));
  console.log('hg_f(x) = ', hg_f(x));
}
start(1);


function compose(f, g, ...rest) {
  if (rest.length === 0) {
    return function(x) {
      return f(g(x));
    };
  } else {
    return compose(compose(f, g), ...rest);
  }
}
var hgf = compose(h, g, f);
var hgf_1 = x => h(g(f(x)));
console.log('hgf(1) = ', hgf(1));
console.log('hgf_1(1) = ', hgf_1(1));

