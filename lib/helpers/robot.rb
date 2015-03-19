class Robot

  attr_accessor :orientation
 
  def orient(orientation)
    if [ :north, :south, :west, :east ].include?(orientation)
      self.orientation = orientation
    else
      nil
    end
  end
  
  def vector
    case self.orientation
        when :west
      { x: -1, y: 0 }
    when :east
      { x: 1, y: 0 }
    when :north
      { x: 0, y: 1 }
    when :south
      { x: 0, y: -1 }
    else
      raise "Invalid orientation #{self.orientation}"
    end
  end
    
end