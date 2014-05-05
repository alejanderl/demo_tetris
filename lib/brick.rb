module Tetris

  class Brick

    attr_reader :brick_class, :x_position, :y_position, :rotation

    BRICKS = { brick_1: ["****","*/*/*/*"],
               brick_2: ["*./*./**","..*/***","**/.*/.*","***/*.."],
               brick_3: [".*/.*/**","***/..*","**/*./*.","*../***"],
               brick_4: [".*/**/*.","**./.**"],
               brick_5: ["**/**"]
              }

    def initialize(brick_class = Random.rand(BRICKS.length) )
      @y_position = 0
      @x_position = 1
      @rotation   = 0
      @brick_class= BRICKS["brick_#{brick_class+1}".to_sym]
    end

    def move_left
      @x_position -= 1
    end

    def move_right
      @x_position += 1
    end

    def rotate_right
      @rotation = (@rotation < @brick_class.length-1  ) ? (@rotation + 1) : 0
    end

    def rotate_left
      @rotation = (@rotation > 0 ) ? (@rotation - 1) : (@brick_class.length - 1)
    end

    def fall
      @y_position +=1
    end

    def current
      @brick_class[rotation].split "/"
    end
  end

end