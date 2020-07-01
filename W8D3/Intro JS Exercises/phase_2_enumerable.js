// Array.prototype.transpose = function () {
//     let arr2 = [];

//     for (let i = 0; i < this[0].length; i++) {
//         let tempArr = [];
//         for (let j = 0; j < this.length; j++) {
//             tempArr.push(this[j][i]);
//         }
//         arr2.push(tempArr);
//     }
//     return arr2;
// }

// Array.prototype.myEach = function(callback)

const test = [1,2,3,4,5,6]

Array.prototype.myEach = function (callback) {
    let arr3 = [];

    for (let i = 0; i < this.length; i++) {
        arr3.push(callback(this[i]));
        
    }
    return arr3;
}

function square(num) {
    return num * num
}
// console.log([1,2,3,4,5].myEach(square))

Array.prototype.myMap = function (callback) {

    for (let i = 0; i < this.length; i++) {
        //arr4.push(this[i] = callback(this[i]));
      this[i] = callback(this[i]);
    }
    return this
}
function cube(num) {
    return num * num * num
}

// console.log([1, 2, 3, 4, 5].myMap(cube))

Array.prototype.myReduce = function (callback, initialValue) {
    let arr = this
    if (initialValue === undefined) {
        // let acc = this[0]
        initialValue = arr[0]
        arr = arr.slice(1)
    }
    let result = initialValue;
    
    arr.myEach(ele => { result = callback(result, ele);
    });

    return result;
}

// console.log(test.myReduce((acc, ele) => acc + ele))



// // without initialValue
// [1, 2, 3].myReduce(function (acc, el) {
//     return acc + el;
// }); // => 6

// // with initialValue
// [1, 2, 3].myReduce(function (acc, el) {
//     return acc + el;
// }, 25); // => 31

// arr.inject {|acc, ele| acc += ele}
// Array#myReduce(callback[, initialValue])

