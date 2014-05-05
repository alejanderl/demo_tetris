module Tetris
  p_root = File.dirname(File.absolute_path(__FILE__))
  Dir.glob(p_root + '/lib/*') {|file| require file}
  require "debugger"
  extend self

  def new
    game = Game.new
  end

end


