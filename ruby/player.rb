class Player
  DEBUG = false
  POSITION_PREFIX = "square"

  attr_reader :name
  attr_reader :position

  def initialize(name, position=0)
    @name = name
    @position = position
  end

  def status
    return 'go' if @position == 0
    "#{POSITION_PREFIX} #{@position}"
  end

  def advance(steps)
    @position += steps
    @position = @position % 40
    "#{@name} advances #{steps} and lands on #{POSITION_PREFIX} #{@position}"
  end

  def dbg(obj)
    puts "#{obj}" if DEBUG
  end

end