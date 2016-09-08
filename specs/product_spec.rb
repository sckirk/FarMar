require_relative 'spec_helper'

describe FarMar::Product do
    describe "#initialize" do
        let (:p) {FarMar::Product.new({id: 2345, name: "Gluten Free Ice Cream Sandwich", vendor_id: 1234})}
        it "can create a new instance of Product" do
            p.must_be_instance_of(FarMar::Product)
        end

        it "can assign instance variables according to the input hash" do
            p.name.must_equal("Gluten Free Ice Cream Sandwich")
            p.vendor_id.must_be_instance_of(Fixnum)
        end
    end

    describe "self.all" do
        it "will output an array" do
            FarMar::Product.all.must_be_instance_of(Array)
        end

        it "will contain an object as each element of the array" do
            FarMar::Product.all[0].must_be_instance_of(FarMar::Product)
            FarMar::Product.all[0].id.must_be_instance_of(Fixnum)
        end
    end

    describe "self.find(id)" do
        it "will output an object" do
            FarMar::Product.find(FarMar::Product.all[0].id).must_be_instance_of(FarMar::Product)
        end
    end

    describe "self.by_vendor(vendor_id)" do
        let(:vendor_id) {FarMar::Vendor.all.last.id}
        it "will output an array" do
            FarMar::Product.by_vendor(vendor_id).must_be_instance_of(Array)
        end

        it "will contain an object as each element of the array" do
            FarMar::Product.by_vendor(vendor_id)[0].must_be_instance_of(FarMar::Product)
            FarMar::Product.by_vendor(vendor_id)[0].name.must_be_instance_of(String)
        end
    end
end
