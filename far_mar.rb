require 'csv'

module FarMar
end

require_relative './lib/market'
require_relative './lib/vendor'
require_relative './lib/product'
require_relative './lib/sale'


##TEST #21... FarMar::Sale.self.between(beginning_time, end_time)
sample_begin_time = "hello"
# sample_begin_time = FarMar::Sale.all.first.purchase_time
sample_end_time = "bye"
# sample_end_time = FarMar::Sale.all.last.purchase_time
print "sample begin time in TDD: "
puts sample_begin_time
puts ""
print "sample end time in TDD: "
puts sample_end_time
puts "\n"
test = FarMar::Sale.between(sample_begin_time, sample_end_time)
test.each do |item|
    puts item.purchase_time
end
# I checked the first 50 objects and all of them are within the sample beginning and end times... great!

# tests to confirm the formatting for FarMar::Sale.purchase_time is now in DateTime format...
# s = FarMar::Sale.all.last
# puts s.purchase_time
# puts DateTime.parse("2013-11-12 12:00:35 -0800")




##TEST #20... FarMar::Sale.product
# s = FarMar::Sale.all.last
# puts s.product
# print "I expect the product id below to be:"
# puts s.product_id
# puts ""
# puts s.product.id
# puts "Awesome!"




##TEST #19... FarMar::Sale.vendor
# s = FarMar::Sale.all.last
# puts s.vendor
# print "I expect the vendor id below to be:"
# puts s.vendor_id
# puts ""
# puts s.vendor.id
# puts "Awesome!"




##TEST #18... FarMar::Product.number_of_sales
# p = FarMar::Product.all.last
# puts p.sales.to_s
# puts ""
# print "I expect this number to correspond to the number of elements in the above array:"
# puts p.number_of_sales
# puts ""
# puts "Awesome!"




##TEST #17... FarMar::Product.sales
# p = FarMar::Product.all.last
# puts p.sales.to_s
# print "I expect the two product id's below to be:"
# puts p.id
# puts ""
# puts p.sales.first.product_id
# puts p.sales.last.product_id
# puts "Awesome!"




##TEST #16... FarMar::Product.vendor
# p = FarMar::Product.all.last
# puts p.vendor
# print "I expect the vendor id below to be:"
# puts p.vendor_id
# puts ""
# puts p.vendor.id
#
# puts "Awesome!"




##TEST #15... FarMar::Vendor.revenue
# v = FarMar::Vendor.all.last
# puts v.sales.to_s
# print "Look at the above amounts and see if this sum looks accurate:"
# puts v.revenue
# puts ""
# puts "Exactly correct. Awesome!"




##TEST #14... FarMar::Vendor.sales
# v = FarMar::Vendor.all.last
# puts v.sales.to_s
# print "I expect the two vendor id's below to be:"
# puts v.id
# puts ""
# puts v.sales.first.vendor_id
# puts v.sales.last.vendor_id
# puts "Awesome!"




##TEST #13... FarMar::Vendor.products
# v = FarMar::Vendor.all.last
# puts v.products.to_s
# print "I expect the two vendor id's below to be:"
# puts v.id
# puts ""
# puts v.products.first.vendor_id
# puts v.products.last.vendor_id
# puts "Awesome!"




##TEST #12... FarMar::Vendor.market
# v = FarMar::Vendor.all.last
# print "I expect the market id below to be:"
# puts v.market_id
# puts ""
# puts v.market.id
#
# puts "Awesome!"




##TEST #11... FarMar::Market.vendors
# m = FarMar::Market.all.last
# print "I expect the two market id's below to be:"
# puts m.id
# puts ""
# puts m.vendors.first.market_id
# puts m.vendors.last.market_id
# puts "Awesome!"




##TEST #10... FarMar::Product.by_vendor(vendor_id)
# print "Here's the vendor I'm calling in the product method below:"
# puts vendor_id = FarMar::Vendor.all.last.id
#
# product_tests = FarMar::Product.by_vendor(vendor_id)
#
# puts "Here are the product objects"
# puts product_tests
#
# puts "Here's the confirmation that all of the vendor_id's in these objects (last line before the line break) match the vendor id noted above..."
# product_tests.each do |item|
#     puts item.id
#     puts item.name
#     puts item.vendor_id
#     puts ""
# end

# puts "Glorious!"




##TEST #9... FarMar::Vendor.by_market(market_id)
# print "Here's the market I'm calling in the vendor method below:"
# puts market_id = FarMar::Market.all.last.id
#
# vendor_tests = FarMar::Vendor.by_market(market_id)
#
# puts "Here are the vendor objects"
# puts vendor_tests
#
# puts "Here's the confirmation that all of the market_id's in these objects (last line before the line break) match the market id noted above..."
# vendor_tests.each do |item|
#     puts item.id
#     puts item.name
#     puts item.market_id
#     puts ""
# end
#
# puts "Glorious!"




##TEST #8... FarMar::Sale.find(id)
# test = FarMar::Sale.find(FarMar::Sale.all[0].id)
# puts test
#
# puts "Woo hoo!"




# #TEST #7... FarMar::Sale.all
# test = FarMar::Sale.all
#
# puts "Woo hoo!"
#
# test.each do |item|
#     puts item.id
#     puts item.purchase_time
#     puts ""
# end
#
# puts "end of test"




##TEST #6... FarMar::Product.find(id)
# test = FarMar::Product.find(FarMar::Product.all[0].id)
# puts test
#
# puts "Woo hoo!"




# #TEST #5... FarMar::Product.all
# test = FarMar::Product.all
#
# puts "Woo hoo!"
#
# test.each do |item|
#     puts item.id
#     puts item.name
#     puts ""
# end
#
# puts "end of test"




##TEST #4... FarMar::Vendor.find(id)
# test = FarMar::Vendor.find(FarMar::Vendor.all[0].id)
# puts test
#
# puts "Woo hoo!"




# #TEST #3... FarMar::Vendor.all
# test = FarMar::Vendor.all
#
# puts "Woo hoo!"
#
# test.each do |item|
#     puts item.id
#     puts item.name
#     puts ""
# end
#
# puts "end of test"




##TEST #2... FarMar::Market.find(id)
# test = FarMar::Market.find(FarMar::Market.all[0].id)
# puts test
#
# puts "Woo hoo!"




##TEST #1... FarMar::Market.all
# test = FarMar::Market.all
#
# puts "Woo hoo!"
#
# test.each do |item|
#     puts item.id
#     puts item.name
#     puts ""
# end
#
# puts "end of test"
