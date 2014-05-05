module Tetris
  class Canvas

    attr_reader   :canvas

    def initialize
      @canvas = []
      setup_new_canvas
    end

    def draw brick
      canvas_dup = @canvas.dup
      pos_x  = brick.x_position
      long   = brick.current[0].length
      brick.current.length.times do |line|
        string = String.new(canvas_dup[brick.y_position + (line)])
        long.times { |time| string[pos_x + time] = brick.current[line][time] if string[pos_x + time] == "." }
        canvas_dup[brick.y_position + (line)] = string
      end
      canvas_dup
    end

    def valid_position?(brick_arg)

      canvas_dup = @canvas.dup
      pos_x  = brick_arg.x_position
      pos_y  = brick_arg.y_position
      long   = brick_arg.current[0].length
      brick_arg.current.length.times do |line|
        canvas_segment = canvas_dup[ pos_y + (line)][pos_x,(long)]
        current_line   = String.new brick_arg.current[line]
        long.times do |pos|
          return false if (canvas_segment[pos]!="."&&current_line[pos]!=".")
        end
      end
      true
    end

    def fix_brick_to_canvas brick
      @canvas = draw brick
    end

    private

    def setup_new_canvas
      19.times do
      @canvas <<  "|..................|"
      end
      @canvas   << "°°°°°°°°°°°°°°°°°°°°"
    end
  end
end