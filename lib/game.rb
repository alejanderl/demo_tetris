module Tetris
  class Game
    attr_accessor :player
    def initialize
      @brick  = Brick.new 2
      @canvas = Canvas.new
      @player = Player.new @brick
      game_loop
    end

    def game_loop
      print_screen
      user_input = gets.chomp
      make_movement user_input
    end

    def make_movement pressed_key
      temp_brick = @brick.dup
      case pressed_key.strip
        when "a"
          temp_brick.move_left
          @brick.move_left   if @canvas.valid_position?(temp_brick)
        when "d"
          temp_brick.move_right
          @brick.move_right  if @canvas.valid_position?(temp_brick)
        when "w"
          temp_brick.rotate_left
          @brick.rotate_left if @canvas.valid_position?(temp_brick)
        when "s"
          temp_brick.rotate_right
          @brick.rotate_right if @canvas.valid_position?(temp_brick)
        else
          @message = "wrong pressed_key"
      end

      temp_brick = @brick.dup
      temp_brick.fall
      @canvas.valid_position?(temp_brick) ? @brick.fall : new_brick
      game_loop
    end

    def print_screen
      system "clear"
      puts @canvas.draw(@brick).join("\n").gsub('.', ' ')
    end

    private
    def new_brick
      @canvas.fix_brick_to_canvas @brick
      @brick = Brick.new
    end

  end
end