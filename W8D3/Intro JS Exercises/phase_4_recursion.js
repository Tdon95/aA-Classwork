function range(start, end) {
    if (end - start === 0) {
        return [];
    }

    let rec = range(start, end - 1);
    rec.push(end - 1);
    return rec;
}

console.log(range(1, 10))

// function concat(xs, y) {
//     return xs.concat(y);
// }

// function range(x, y) {
//     function rec(x, y, acc) {
//         return x < y ? rec(x + 1, y, concat(acc, x)) : acc;
//     }

//     return rec(x, y, []);
// }
// console.log(range(1, 10))
