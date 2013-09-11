class Investment < ActiveRecord::Base
  validates_presence_of :cost, :sale_val
  
  def calculate_roi
    sale_val = self.sale_val
    sq_feet = self.sq_feet
    cost = self.cost
    roi = (sale_val-cost)/cost
    return roi.round(2)
  end

  def calculate_sf
    sale_val = self.sale_val
    sq_feet = self.sq_feet
    cost = self.cost
    sf = (sale_val-cost)/sq_feet
    return sf.round(2)
  end

end
