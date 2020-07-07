// const Util = require("./util");
// const MovingObject = require("./moving_object");

// // // const Default = {
// // //     COLOR = 'grey';
// // //     RADIUS = 50;
// // // }


// function Asteroid (options) {
//     let color = grey;
//     let radius = 50;
//     this.color = color;
//     this.radius = radius;
//     MovingObject.call(this, options)
// }

// Util.inherits(Asteroid, MovingObject);
// module.exports = Asteroid;
// -------------
const Util = require("./util");
const MovingObject = require("./moving_object");

const DEFAULTS = {
    COLOR: 'green',
    RADIUS: 20
};

function Asteroid (options) {
    
    options.color = DEFAULTS.COLOR;
    options.radius = DEFAULTS.RADIUS;
    options.vel = Util.randomVec(10);
    
    MovingObject.call(this, options);
};
// new Asteroid({ pos: [30, 30] });
// const mo = new MovingObject({
//     pos: [30, 30],
//     vel: [10, 10],
//     radius: 5,
//     color: "#00FF00"
// });

Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;