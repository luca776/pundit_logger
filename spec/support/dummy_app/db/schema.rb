ActiveRecord::Schema.define do
  self.verbose = false
  create_table :widgets, force: true do |t|
    t.string   :product_id,    limit: 255
    t.timestamps               null: false
  end
end