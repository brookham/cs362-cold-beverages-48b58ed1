class Vessel
  attr_reader :name, :volume

  def initialize(name= 'FAKE', volume = 100)
    @name = name
    @volume = volume
    @filled = false
  end

  def empty?
    !@filled
  end

  def fill
    @filled = true
  end

end
