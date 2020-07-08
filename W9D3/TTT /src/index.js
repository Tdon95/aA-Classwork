const View = require('./ttt-view.js');// require appropriate file
const Game = require('../../TTT Node sol/game.js');// require appropriate file

  $( () => {
    // Your code here
    const game = new Game ();
    const rootEl = $('.ttt');
    new View (game, rootEl);
  });

// const View = require("./ttt-view.js")
// const Game = require("./game.js")
// $(() => {
//   // Your code here
//   const game = new Game();
//   $el = $('figure.ttt');
//   const view = new View(game, $el)
// });

  