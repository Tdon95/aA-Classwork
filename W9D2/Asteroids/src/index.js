console.log("Webpack is working!");

const MovingObject = require("./moving_object.js");
window.MovingObject = MovingObject;

const Asteroid = require("./asteroid.js");
window.Asteroid = Asteroid;

document.addEventListener("DOMContentLoaded", function () {
    const canvasEl = document.getElementsByTagName('canvas')[0]; // need to grab element from DOM
    // stores as an Array-like object

    canvasEl.height = 500;
    canvasEl.width = 500;

    const ctx = canvasEl.getContext('2d');
    window.ctx = ctx;
});
