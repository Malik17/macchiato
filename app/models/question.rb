class Question < ActiveRecord::Base

  def impact
    Vector.new(x_impact, y_impact, z_impact)
  end

end
