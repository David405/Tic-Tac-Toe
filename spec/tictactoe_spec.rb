# frozen_string_literal: true

require './lib/game.rb'
require './lib/player.rb'
require './lib/board.rb'

RSpec.describe Game do
  let(:player1) { double('player1') }
  let(:player2) { double('player2') }
  let(:game) { Game.new(player1, player2, board) }
  let(:board) { Board.new }

  describe '#ask_position' do
    context "when it's Player 1's turn" do
      it 'shows Player 1 name' do
        allow(player1).to receive(:name) { 'Player1' }
        expect(game.ask_position).to eql('Player1, choose a position')
      end
    end

    context "when it's Player 2's turn" do
      it 'shows Player 2 name' do
        allow(player1).to receive(:marker) { 'X' }
        allow(player2).to receive(:name) { 'Player2' }
        allow(player2).to receive(:marker) { 'O' }
        game.play(1)
        expect(game.ask_position).to eql('Player2, choose a position')
      end
    end
  end

  describe '#mark_position' do
    context 'when Player 1 chooses a position' do
      it "places player 1's mark on board's array" do
        board.mark_position(4, 'X')
        expect(board.board).to eql(['   ', '   ', '   ', '   ', ' X ', '   ', '   ', '   ', '   '])
      end
    end

    context 'when Player 2 chooses a position' do
      it "places player 2's mark on board's array" do
        board.mark_position(4, 'X')
        board.mark_position(7, 'O')
        expect(board.board).to eql(['   ', '   ', '   ', '   ', ' X ', '   ', '   ', ' O ', '   '])
      end
    end
  end

  describe '#display_board' do
    let(:board_player1) do
      "   |   |   \n" \
      "-----------\n" \
      "   | X |   \n" \
      "-----------\n" \
      '   |   |   '
    end

    let(:board_player2) do
      "   |   |   \n" \
      "-----------\n" \
      "   | X |   \n" \
      "-----------\n" \
      '   |   | O '
    end

    context 'when Player 1 choose an empty space' do
      it "displays the board with Player 1's mark on the chosen position" do
        allow(player1).to receive(:marker) { 'X' }
        game.play(5)
        expect(board.display_board).to eql(board_player1)
      end
    end

    context 'when Player 2 choose an empty space' do
      it "displays the board with Player 2's mark on the chosen position" do
        allow(player1).to receive(:marker) { 'X' }
        allow(player2).to receive(:marker) { 'O' }
        game.play(5)
        game.play(9)
        expect(board.display_board).to eql(board_player2)
      end
    end
  end

  describe '#valid?' do
    context "when user's input is not in the range 1..9" do
      it 'returns false' do
        expect(game.valid?(11)).to eql(false)
      end
    end

    context "when user's input in in the range 1..9" do
      it 'returns true' do
        expect(game.valid?(5)).to eql(true)
      end
    end
  end

  describe '#occupied?' do
    context 'when user choose and empty space' do
      it 'returns false' do
        allow(player1).to receive(:marker) { 'X' }
        allow(player2).to receive(:marker) { 'O' }
        game.play(1)
        game.play(5)
        expect(game.occupied?(7)).to eql(false)
      end
    end

    context 'when user choose and occupied space' do
      it 'returns true' do
        allow(player1).to receive(:marker) { 'X' }
        allow(player2).to receive(:marker) { 'O' }
        game.play(1)
        game.play(5)
        expect(game.occupied?(1)).to eql(true)
      end
    end
  end

  describe '#draw?' do
    it 'returns true when the board is full' do
      allow(player1).to receive(:marker) { 'X' }
      allow(player2).to receive(:marker) { 'O' }
      game.play(1)
      game.play(5)
      game.play(3)
      game.play(7)
      game.play(8)
      game.play(9)
      game.play(4)
      game.play(2)
      game.play(6)
      expect(game.draw?).to eql(true)
    end
  end

  describe '#win?' do
    it "returns true when a player's moves are included in winning combinations" do
      allow(player1).to receive(:marker) { 'X' }
      allow(player2).to receive(:marker) { 'O' }
      game.play(1)
      game.play(4)
      game.play(2)
      game.play(7)
      game.play(3)

      expect(game.win?).to eql(true)
    end
  end

  describe '#display_winner' do
    context 'When player 1 wins the game' do
      it "displays the win massage with player 1's name" do
        allow(player1).to receive(:name) { 'Player1' }
        allow(player1).to receive(:marker) { 'X' }
        allow(player2).to receive(:name) { 'Player2' }
        allow(player2).to receive(:marker) { 'O' }
        game.play(1)
        game.play(4)
        game.play(2)
        game.play(7)
        game.play(3)

        expect(game.display_winner).to eql('Player1 wins!')
      end
    end

    context 'When player 2 wins the game' do
      it "displays the win massage with player 2's name" do
        allow(player1).to receive(:name) { 'Player1' }
        allow(player1).to receive(:marker) { 'X' }
        allow(player2).to receive(:name) { 'Player2' }
        allow(player2).to receive(:marker) { 'O' }
        game.play(9)
        game.play(1)
        game.play(4)
        game.play(2)
        game.play(7)
        game.play(3)

        expect(game.display_winner).to eql('Player2 wins!')
      end
    end
  end
end
