Vector = Struct.new(:x,:y,:z) do

  def add(v)
    Vector.new(self.x + v.x, self.y + v.y, self.z + v.z)
  end

  def scale(k)
    Vector.new(self.x*k, self.y*k, self.z*k)
  end

  def abs
    Vector.new(self.x.abs, self.y.abs, self.z.abs)
  end

end
