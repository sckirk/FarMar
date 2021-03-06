class FarMar::Market
    attr_reader :id, :name, :address, :city, :county, :state, :zip

    def initialize(market_hash)
        @id = market_hash[:id]
        @name = market_hash[:name]
        @address = market_hash[:address]
        @city = market_hash[:city]
        @county = market_hash[:county]
        @state = market_hash[:state]
        @zip = market_hash[:zip]
    end

    def self.all
        markets_from_csv = []
        CSV.read('./support/markets.csv').each do |line|
            csv_market = {
                id: line[0].to_i,
                name: line[1],
                address: line[2],
                city: line[3],
                county: line[4],
                state: line[5],
                zip: line[6]
            }
            markets_from_csv << self.new(csv_market)
        end
        markets_from_csv
    end

    def self.ids
        market_ids = []
        self.all.each do |m_object|
            market_ids << m_object.id
        end
        return market_ids
    end

    def self.find(id)
        if self.ids.include?(id)
            self.all.find {|m_object| m_object.id == id}
        else
            raise ArgumentError.new("Oops, your number input is not a valid market id.")
        end
    end

    def vendors
        return FarMar::Vendor::by_market(@id)
    end
end
