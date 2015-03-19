=begin
Class for Table
This class also contains method to return if robot is placed on the table
=end

class Table

  attr_accessor :position
  def place(x, y)
    self.position = { x: x, y: y }
  end

  def is_placed?
    self.position != nil
  end
end