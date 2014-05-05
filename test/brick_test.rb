require File.dirname(__FILE__) + "/../tetris"


describe "Brick tests" do
  before :each do
    @brick_random = Tetris::Brick.new
  end

  it "create a new brick type 2 and rotate right" do
    expected = 1
    brick = Tetris::Brick.new 2
    brick.rotate_right
    expected.should == brick.rotation
  end

  it "new brick should make whole roation left" do
    expected = 0
    (@brick_random.brick_class.length  ).times do |rotate|
      @brick_random.rotate_left
    end
    expected.should == @brick_random.rotation
  end

  it "new brick should make whole roation right" do
    expected = 0
    brick = Tetris::Brick.new 4
    brick.brick_class.length.times do |rotate|
      brick.rotate_right
    end
    expected.should == brick.rotation
  end


end