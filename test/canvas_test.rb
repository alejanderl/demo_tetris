require File.dirname(__FILE__) + "/../tetris"

describe "Brick tests" do
  before :all do

  end

  it "test create thousand bricks" do
    1000.times do
     brick = Tetris::Brick.new
    end
  end

  it "validate a position " do

    canvas   = Tetris::Canvas.new
    brick    = Tetris::Brick.new 2
    canvas.valid_position?(brick).should be true
    brick.instance_variable_set "@x_position", 0
    canvas.valid_position?(brick).should be false

  end

  it "try with strange canvas" do
    brick  = Tetris::Brick.new 2
    canvas = Tetris::Canvas.new
    test_canvas = ["|..................|",
                   "|.....*............|",
                   "|.....**..*........|",
                   "|......*...........|",
                   "|....*.............|",
                   "|..................|",
                   "|..*.........*.....|",
                   "|...*..*...........|",
                   "|..................|",
                   "|..................|",
                   "|....*.*...........|",
                   "|....*....*........|",
                   "|..................|",
                   "|.......*.*........|",
                   "|.......*..........|",
                   "|..*........*......|",
                   "|....*...*.........|",
                   "|..................|",
                   "|..................|",
                   "°°°°°°°°°°°°°°°°°°°°",
                  ]
    canvas.instance_variable_set :@canvas, test_canvas
    brick.instance_variable_set "@x_position", 5
    canvas.valid_position?(brick).should be false
  end

end