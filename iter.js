function logAll(it) {
    let r;
    while (!(r = it.next()).done) {
        console.log(r.value);
    }
}

function bufIterator(buf) {
   let i = 0;
   return {
      next: function() {
	  if (i >= buf.length) return { done : true };
          return {
              value : buf.readUInt8(i++),
          };
      },
   };
}

function* bufGenerator(buf) {
     for (let i = 0; i < buf.length; ++i) {
         yield buf.readUInt8(i);
     }
}

function* traverse(n) {
     if (!n) return;
     yield* traverse(n.left);
     yield n.data;
     yield* traverse(n.right);
}

let bst = {
    data: "cheese",
    left: {
       data: "apples",
       right : {
            data: "bread",
       }
    },
    right: {
        data: "wurst",
    }
};
