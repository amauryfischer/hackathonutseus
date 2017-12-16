require 'csv'
class Victorizateur < ApplicationRecord
  def self.ginger(mat)
    xlength = mat.length
    ylength = mat.first.length
    9.times do |k|
      xlength.times do |i|
        ylength.times do |j|
          #  i == coo en x
          # j == coo en y
          current_value = 10 - k
          if mat[i][j] == current_value
            next_value = current_value - 1
            mat[i-1][j] = next_value unless mat[i-1].nil? || mat[i-1][j].nil? || mat[i-1][j] > next_value
            mat[i+1][j] = next_value unless mat[i+1].nil? || mat[i+1][j].nil? || mat[i+1][j] > next_value

            mat[i-1][j-1] = next_value unless mat[i-1].nil? || mat[i-1][j-1].nil? || mat[i-1][j-1] > next_value
            mat[i-1][j+1] = next_value unless mat[i-1].nil? || mat[i-1][j+1].nil? || mat[i-1][j+1] > next_value

            mat[i][j-1] = next_value unless mat[i].nil? || mat[i][j-1].nil? || mat[i][j-1] > next_value
            mat[i][j+1] = next_value unless mat[i].nil? || mat[i][j+1].nil? || mat[i][j+1] > next_value

            mat[i+1][j+1] = next_value unless mat[i+1].nil? || mat[i+1][j+1].nil? || mat[i+1][j+1] > next_value
            mat[i+1][j-1] = next_value unless mat[i+1].nil? || mat[i+1][j-1].nil? || mat[i+1][j-1] > next_value
          end
        end
      end
      print mat
    end
    mat
  end

  def self.use_ginger
    file = File.open("data/lieux_subway.csv")
    csv = file.read
    file.close
    parsed_csv = CSV.parse csv
    output = self.ginger parsed_csv
    file = File.open("data/grid100output.json","w")
    file.write output.to_json
    file.close
  end

  def self.clean_csv(filename)
    file = File.open(filename)
    csv = file.read
    file.close
    parsed_csv = CSV.parse csv
    new_csv = []
    parsed_csv.each do |line|
      new_line = []
      line.each do |y|
        y = (y.to_f*1000).to_i/1000.0
        new_line.push(y)
      end
      new_csv.push(new_line)
    end
    file = File.open("data/lieux_subway_output.csv","w")
    file.write parsed_csv.to_csv
    file.close
    new_csv
  end

  def self.fetch_location(zoom:)
    @max_lat = 31.4
    @min_lat = 30.4
    @max_lng = 121.1
    @min_lng = 121.5
    @distance = 80
    parsed_csv = clean_csv "data/lieux_subway.csv"
    selected_area = []
    parsed_csv.each do |line|
      selected_area.push([line[0],line[1]]) if line[2].to_i >= zoom
    end
    selected_area
  end
end
