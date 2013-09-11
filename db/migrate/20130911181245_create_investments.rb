class CreateInvestments < ActiveRecord::Migration
  def change
    create_table :investments do |t|
      t.float :sq_feet
      t.float :cost
      t.float :sale_val
      t.float :amount
      t.float :profit
       
      t.timestamps
    end
  end
end
