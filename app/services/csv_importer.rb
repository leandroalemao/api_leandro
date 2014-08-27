class CsvImporter
  def initialize(file)
    @file = file
  end

  def read_from_csv!
    require "csv"
    if !csv_empty? 
      count = 0
      ActiveRecord::Base.connection.execute("DELETE FROM products")
      csv = CSV.new(File.open(@file), :header_converters => :symbol, :converters => :all)
      csv.each do |row|
        #ignore de first row
        if count == 0
          count = count + 1
        else
          @products_hash = Hash[csv_header.zip(row)]
          Product.create! @products_hash
          count = count + 1
        end

      end
    end
    
  end

  def csv_empty?
    if CSV.new(File.open(@file)).to_a.empty?
      puts "CSV is empty"
      true
    end
  end

  def csv_header
    %w(id code price)
  end

  private
  attr_reader :file
end
