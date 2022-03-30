class GraffitiRequestsController < ApplicationController
  def index
    
    if !params[:month] || !params[:year] || params[:alderman]
      render json: {errors: "Please include all required parameters"},
      status: :unprocessable_entity and return
    end
    
     @graffiti_report = GraffitiReport.new(
      month: params[:month], 
      year: params[:year], 
      alderman_last_name: params[:alderman]
      )

    @graffiti_report.get_ward_and_alderman
    @graffiti_report.get_graffiti_count

    render 'index.json.jbuilder'
  end
end
