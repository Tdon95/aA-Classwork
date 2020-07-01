const tester = [3, 2, 7, 4, 8, 6]

Array.prototype.bubbleSort = function () {
    let sortedArr = false;

    while (!sortedArr) {
        sortedArr = true;

        for (let i = 0; i < (this.length - 1); i++) {
            if (this[i] > this[i + 1]) {
                [this[i], this[i + 1]] = [this[i + 1], this[i]];
                sortedArr = false;
            }
        }
    }
    return this;
}
console.log([3, 2, 7, 4, 8, 6].bubbleSort());

String.prototype.substrings = function () {
    let arr = [];

    for (let i = 0; i <= (this.length); i++) {
        for (let j = (i + 1); j <= this.length; j++) {
            arr.push(this.slice(i, j));
        }
    }

    return arr;
}

console.log("abcdef".substrings())