class Monopoly
  DEBUG = false

  attr_reader :status

  def initialize(position=0)
    @position = position
  end

  def status
    return 'go' if @position == 0
    "square #{@position}"
  end

  def play_turn
    dbg "before #{@position}"
    @position += 1
    @position = @position % 40
    dbg "after #{@position}"
  end

  def dbg(obj)
    puts "#{obj}" if DEBUG
  end

end