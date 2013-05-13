class SlideUnit
  attr_accessor :position, :normal, :display, :thumb_left, :thumb_right

  def initialize(num)
    @position = num
    @normal = '='
    @display = normal
    @new_normal = false
    @thumb_left = '['
    @thumb_right = ']'
  end

  def show
    print display
  end

  def thumb_l
    @display = thumb_left
  end

  def thumb_r
    @display = thumb_right
  end

  def not_normal
    @normal = false
  end

  def change_normal(arg)
    @normal = arg
  end
end

class Slider < Array
  def show
    self.each do |unit|
      unit.show
    end
  end

  def position(num)
    self.each do |unit|
      unit.display = unit.normal
      if unit.position == num
        unit.thumb_l
      elsif unit.position == num+1
        unit.thumb_r
      end
    end
    show
  end
end

slider = Slider.new

(-10..11).to_a.each do |num|
  slider.push(SlideUnit.new(num))
end

slider.position(2)

