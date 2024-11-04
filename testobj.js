
function A(x) {
  return {
     x: x,
     getX: function () { return this.x },
     foo : function (a) { return this.bar(a+1); }
  };
}

function B(y) {
  let parent = A(y*10);
  let self = Object.create(parent);
  self.x = y + 2;
  self.getX = function() {
     return parent.getX.bind(this)() + 3;
  }
  self.bar = function(a) {
     return a + this.x;
  }
  return self;
}

{
   let obj = B(42);
   console.log('obj.getX()',obj.getX());
   console.log('obj.foo(5)',obj.foo(5));
}
