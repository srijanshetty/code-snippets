var once = function(fn, context) {
  return function() {
    if(!fn) {
      return undefined;
    }
    
    // We call the function only once
    fn.apply(context || this, arguments);
    
    // Set the function to null
    fn = null;
  };
}