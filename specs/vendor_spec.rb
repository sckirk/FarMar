require_relative 'spec_helper'

describe FarMar::Vendor do
    let(:v) {FarMar::Vendor.all.last}
    describe "#initialize" do
        let(:v_manual) {FarMar::Vendor.new({id: 1234, name: "Sweet Bumpas", number_employees: 2, market_id: 123})}
        it "can create a new instance of Vendor" do
            v_manual.must_be_instance_of(FarMar::Vendor)
        end

        it "can assign instance variables according to the input hash" do
            v_manual.id.must_equal(1234)
            v_manual.number_employees.must_be_instance_of(Fixnum)
            v_manual.name.must_be_instance_of(String)
        end
    end

    describe "self.all" do
        it "will output an array" do
            FarMar::Vendor.all.must_be_instance_of(Array)
        end

        it "will contain a vendor object as each element of the array" do
            FarMar::Vendor.all[0].must_be_instance_of(FarMar::Vendor)
            FarMar::Vendor.all[0].id.must_be_instance_of(Fixnum)
        end
    end

    describe "self.find(id)" do
        it "will output a vendor object" do
            FarMar::Vendor.find(FarMar::Vendor.all[0].id).must_be_instance_of(FarMar::Vendor)
        end

        it "must take a valid argument" do
            proc {FarMar::Vendor.find(2000000000)}.must_raise(ArgumentError)
        end
    end

    describe "market" do
        it "will output a market object" do
            v.market.must_be_instance_of(FarMar::Market)
        end

        it "will output the market object whose market id corresponds to the current vendor instance's market id" do
            v.market.id.must_equal(v.market_id)
        end
    end

    describe "products" do
        it "will output an array" do
            v.products.must_be_instance_of(Array)
        end

        it "will output product objects that correspond to the current vendor id" do
            v.products.first.vendor_id.must_equal(v.id)
            v.products.last.vendor_id.must_equal(v.id)
        end
    end

    describe "sales" do
        it "will output an array" do
            v.sales.must_be_instance_of(Array)
        end

        it "will output sale objects that correspond to the current vendor id" do
            v.sales.first.vendor_id.must_equal(v.id)
            v.sales.last.vendor_id.must_equal(v.id)
        end
    end

    describe "revenue" do
        it "will return a fixnum" do
            v.revenue.must_be_instance_of(Fixnum)
        end
    end

    describe "self.by_market(market_id)" do
        let(:market_id) {FarMar::Market.all.last.id}
        it "will output an array" do
            FarMar::Vendor.by_market(market_id).must_be_instance_of(Array)
        end

        it "will contain a vendor object as each element of the array" do
            FarMar::Vendor.by_market(market_id)[0].must_be_instance_of(FarMar::Vendor)
            FarMar::Vendor.by_market(market_id)[0].name.must_be_instance_of(String)
        end

        it "will output vendor objects whose market id corresponds to the market id passed into the method" do
            FarMar::Vendor.by_market(market_id).first.market_id.must_equal(market_id)
            FarMar::Vendor.by_market(market_id).last.market_id.must_equal(market_id)
        end

        it "must take a valid argument" do
            proc {FarMar::Vendor.by_market(2000000000)}.must_raise(ArgumentError)
        end
    end
end
