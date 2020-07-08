class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;

    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    this.$el.on("click", "li", (event => {
      const $square = $(event.currentTarget);
      this.makeMove($square)
    }));
  }

  makeMove($square) {
    const currentPlayer = this.game.currentPlayer;
    const pos = $square.data("pos");
    this.game.playMove(pos);
    $square.addClass(currentPlayer);
  


    if (this.game.isOver()) {
      this.$el.off("click");
      this.$el.addClass("winner" + currentPlayer);
      
    } 
  }

  setupBoard() {
    const $ul = $('<ul>');

    for (let row = 0; row < 3; row++) {
      for (let col = 0; col < 3; col++) {
        let $li = $('<li>');
        $li.data("pos", [row, col]);

        $ul.append($li);
      }
    }
    this.$el.append($ul);
  }
}

module.exports = View;


// $('li').on('click', e => {
//   //     // debugger // examine `e`, look at the event's `currentTarget` and `target` properties
//   //     $(e.currentTarget).toggleClass('incomplete complete');
//   // });