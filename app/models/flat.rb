require 'csv'

class Flat < ApplicationRecord
  def self.integrate_csv
    file = File.open("/home/amauey/Bureau/Urban Data Hackathon/UTSEUS-anjuke-real-estate.csv")
    csv = file.read
    file.close
    csv_parsed = CSV.parse csv
    csv_parsed.shift
    csv_parsed.each do |csv_line|
      Flat.create(
        address: csv_line[1],
        longitude: csv_line[2],
        latitude: csv_line[3],
        bedroom: csv_line[4],
        room: csv_line[5],
        surface: csv_line[6],
        price: csv_line[7],
        onesquaremeter: csv_line[8],
        tags: csv_line[9],
        district: csv_line[10],
        neighborhood: csv_line[11]
      )
    end
    byebug
  end
end
