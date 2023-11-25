#NAME : OM KUMAR KESHRI
#COLLEGE : BMS INSTITUTE OF TECHNOLOGY AND MANAGEMENT
#YEAR OF PASSING: 20204
#PHONE NUMBER: 6207079685
#EMAIL: omkumarkeshri18@gmail.com

#the below code is written in ruby language

class Product
  attr_reader :product_name, :unit_cost, :gst_percentage, :quantity

  def initialize(name, cost, gst, qty)
    @product_name = name
    @unit_cost = cost
    @gst_percentage = gst
    @quantity = qty
  end

  def calculate_total_cost
    unit_cost * quantity * (1 + gst_percentage / 100)
  end

  def calculate_gst_amount
    unit_cost * quantity * (gst_percentage / 100)
  end

  def calculate_discounted_total_cost
    unit_cost >= 500 ? calculate_total_cost * 0.95 : calculate_total_cost
  end
end

def find_product_with_max_gst(product_list)
  max_gst_product = product_list[0]
  max_gst_amount = max_gst_product.calculate_gst_amount

  (1...product_list.length).each do |i|
    current_gst_amount = product_list[i].calculate_gst_amount
    if current_gst_amount > max_gst_amount
      max_gst_product = product_list[i]
      max_gst_amount = current_gst_amount
    end
  end

  max_gst_product
end

products = [
  Product.new("Leather Wallet", 1100, 18, 1),
  Product.new("Umbrella", 900, 12, 4),
  Product.new("Cigarette", 200, 28, 3),
  Product.new("Honey", 100, 0, 2)
]

max_gst_product = find_product_with_max_gst(products)

total_amount_to_pay = products.sum { |product| product.calculate_discounted_total_cost }

puts "Product with maximum GST amount: #{max_gst_product.product_name}"
puts "Total amount to be paid: Rs. #{total_amount_to_pay}"
