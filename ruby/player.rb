class Player
  DEBUG = false

  attr_reader :status

  def initialize(position=0)
    @position = position
  end

  def status
    return 'go' if @position == 0
    "square #{@position}"
  end

  def advance (position)
    @position += position
    @position = @position % 40
  end

  def dbg(obj)
    puts "#{obj}" if DEBUG
  end

end