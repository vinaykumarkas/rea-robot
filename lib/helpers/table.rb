=begin
Class for Table
This class also contains method to return if robot is placed on the table
This class also verifies if the coordinates are valid based on the table dimensions
=end

class Table

  attr_accessor :position
  def place(x, y)
    self.position = { x: x, y: y }  if valid_coordinates?(x, y)
  end

  def is_placed?
    self.position != nil
  end
    
private

  def valid_coordinates?(x, y)
    (x >= 0 && x <= 4 && y >= 0 && y <= 4)
  end
    
end