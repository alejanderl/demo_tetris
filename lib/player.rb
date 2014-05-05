module Tetris
  class Player
    attr_accessor :current_brick
    def initialize brick
      @current_brick = brick
      @message = ""
      @points = ""
    end
  end
end