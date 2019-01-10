var curryN = _curry2(function curryN(length, fn) {
  if (length === 1) {
    return _curry1(fn);
  }
  return _arity(length, _curryN(length, [], fn));
});

var curry = curry1(function(curry(fn)) {
  return curryN(fn.length, fn);
});

function _curry1(fn) {
  return function f1(a) {
    if (arguments.length === 0 || _isPlaceholder(a)) {
      return f1;
    } else {
      return fn.apply(this, arguments);
    }
  };
}

function _curry2(fn) {
  return function f2(a, b) {
    switch (arguments.length) {
      case 0:
        return f2;
      case 1:
        return _isPlaceholder(a) ? f2
          : _curry1(function (_b) { return fn(a, _b); });
      default:
        return _isPlaceholder(a) && _isPlaceholder(b) ? f2
          : _isPlaceholder(a) ? _curry1(function (_a) { return fn(_a, b); })
            : _isPlaceholder(b) ? _curry1(function (_b) { return fn(a, _b); })
              : fn(a, b);
    }
  };
}

function _isPlaceholder(a) {
  return a != null &&
    typeof a === 'object' &&
    a['@@functional/placeholder'] === true;
}