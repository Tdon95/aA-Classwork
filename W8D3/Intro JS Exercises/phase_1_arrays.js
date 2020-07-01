// Array#uniq

Array.prototype.uniq = function () {
    let arr = [];

    for (let i = 0; i < this.length; i++) {
        let ele = this[i];
        if (!arr.includes(ele)) {
            arr.push(ele);
        }
    };

    console.log(arr);
    return arr;
};
// [1, 2, 2, 3, 3, 3].uniq()

Array.prototype.twoSum = function () {
    let arr1 = [];

    for (let i = 0; i < this.length - 1; i++) {
        for (let j = i + 1; j < this.length; j++) {
            if (this[i] + this[j] === 0) {
                arr1.push([i, j]);
            }
        }
    }
    // console.log(arr1)
    return arr1;
}
// [1, -1, 2, 4, -2] => [[0,1], [2, 4]]
// console.log([1, -1, 2, 4, -2, 8, -4, -1, -8].twoSum())

Array.prototype.transpose = function () {
    let arr2 = [];

    for (let i = 0; i < this[0].length; i++) {
        let tempArr = [];
        for (let j = 0; j < this.length; j++) {
            tempArr.push(this[j][i]);   
        }
        arr2.push(tempArr);
    }
    return arr2;
}
// [] -> [[1], [2]] -> [[1,3], [2,4]] -> [[1,3,5], [2,4,6]]
// [[1,2],[3,4],[5,6]] => [[1,3,5],[2,4,6]]

// const array = [[1, 2], [3, 4], [5, 6]]
// console.log(array.transpose())
// console.log([[1, 2], [3, 4], [5, 6]].transpose())


