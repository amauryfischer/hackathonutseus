class FetcherController < ApplicationController
  def area
    list = Victorizateur.fetch_location zoom: 10
    render json: list.to_json
  end

  def specificflat
    lat = params[:lat].to_i / 1000.0
    lng = params[:lng].to_i / 1000.0
    result = []
    Flat.all.each do |f|
      if f.latitude.to_f > lat && f.latitude.to_f < lat+0.005 && f.longitude.to_f > lng  && f.longitude.to_f  < lng+ 0.005
        result.push f
      end
    end
    byebug
    render json: result[0..10].to_json #if result.count <= 10
  end
end
