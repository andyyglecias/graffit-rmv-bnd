class GraffitiReport
  attr_reader :ward_number, :month, :year, :graffiti_count, :alderman_last_name, :alderman_full_name 
  
  def initialize(opts)
    @month = opts[:month]
    @year = opts[:year]
    @alderman_last_name = opts[:alderman_last_name]
  end

  #populating ward number
  
  def get_ward_and_alderman
    response = HTTP.get("https://data.cityofchicago.org/resource/htai-wnw4.json?$q=#{alderman_last_name}")

    @ward_number = response.parse[0]["ward"]
    @alderman_full_name = response.parse[0]["alderman"]
  end

  def get_graffiti_count

    response2 = HTTP.get("https://data.cityofchicago.org/resource/hec5-y4x5.json?$query=SELECT%20COUNT(*)%20WHERE%20creation_date%20%3E%20%22#{@year}-#{formatted_month}-01%22%20AND%20creation_date%20%3C%20%22#{@year}-#{next_month}-01%22%20AND%20ward=#{@ward_number}")

    @graffiti_count = response2.parse[0]["COUNT"]
  end

  private
  
    def formatted_month
    @month.rjust(2, "0") 
    end

    def next_month
      next_month = (@month.to_i + 1).to_s.rjust(2, "0")
    end


end