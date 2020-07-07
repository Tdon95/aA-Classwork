const Util = require("./util");
function MovingObject (options) {
    
    this.pos = options.pos;
    this.vel = options.vel;
    this.radius = options.radius;
    this.color = options.color;
};
//options is going to be a hash with all the parameters;

// const mo = new MovingObject({
//     pos: [30, 30],
//     vel: [10, 10],
//     radius: 5,
//     color: "#00FF00"
// });

MovingObject.prototype.draw = function draw(ctx) {
    ctx.fillStyle = this.color;   

    ctx.beginPath();
    // ctx.arc(250,250,20,0, 2*Math.PI);

    ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2*Math.PI);


    ctx.strokeStyle = "red";
    ctx.stroke ();

    ctx.fill();
};

MovingObject.prototype.move = function move () {
    
    this.pos = [this.pos[0] + this.vel[0], this.pos[1] + this.vel[1]];
    // this.pos += this.pos + this.vel;
};


module.exports = MovingObject;


// Circle.prototype.moveRandom = function (maxX, maxY) {
//   let dx = (Math.random() * 2) - 1;
//   let dy = (Math.random() * 2) - 1;

//   this.centerX = Math.abs((this.centerX + (dx * this.radius * 0.1)) % maxX);
//   this.centerY = Math.abs((this.centerY + (dy * this.radius) * 0.1) % maxY);
// };