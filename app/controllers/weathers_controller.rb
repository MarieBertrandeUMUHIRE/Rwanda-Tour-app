class WeathersController < ApplicationController
 def index
  city = params[:city] || "Kigali"
  country = params[:country] || "Rwanda"
  
  if city.nil? || country.empty?
    flash[:info] = "No Results"
    redirect_to "/weathers"
  end

    weather_hash = Unirest.get("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22#{city}%2C%20#{country}%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys").body
    if weather_hash["results"].nil?
     flash[:info] = "No Results"
     redirect_to "/weathers"
   end

    @location_and_time = weather_hash["query"]["results"][
      "channel"]["title"]
      @weather = weather_hash["query"]["results"]["channel"]["item"]["condition"]
  end
end
