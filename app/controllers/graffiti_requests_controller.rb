class GraffitiRequestsController < ApplicationController
  def index

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
