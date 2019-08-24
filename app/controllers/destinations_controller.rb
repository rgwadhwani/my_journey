class DestinationsController < ApplicationController
  def index
    @q = Destination.ransack(params[:q])
    @destinations = @q.result(:distinct => true).includes(:trip).page(params[:page]).per(10)

    render("destination_templates/index.html.erb")
  end

  def show
    @destination = Destination.find(params.fetch("id_to_display"))

    render("destination_templates/show.html.erb")
  end

  def new_form
    @destination = Destination.new

    render("destination_templates/new_form.html.erb")
  end

  def create_row
    @destination = Destination.new

    @destination.city_name = params.fetch("city_name")
    @destination.arrival_date = params.fetch("arrival_date")
    @destination.departure_date = params.fetch("departure_date")
    @destination.trip_id = params.fetch("trip_id")
    @destination.country_name = params.fetch("country_name")

    if @destination.valid?
      @destination.save

      redirect_back(:fallback_location => "/destinations", :notice => "Destination created successfully.")
    else
      render("destination_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_trip
    @destination = Destination.new

    @destination.city_name = params.fetch("city_name")
    @destination.arrival_date = params.fetch("arrival_date")
    @destination.departure_date = params.fetch("departure_date")
    @destination.trip_id = params.fetch("trip_id")
    @destination.country_name = params.fetch("country_name")

    if @destination.valid?
      @destination.save

      redirect_to("/trips/#{@destination.trip_id}", notice: "Destination created successfully.")
    else
      render("destination_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @destination = Destination.find(params.fetch("prefill_with_id"))

    render("destination_templates/edit_form.html.erb")
  end

  def update_row
    @destination = Destination.find(params.fetch("id_to_modify"))

    @destination.city_name = params.fetch("city_name")
    @destination.arrival_date = params.fetch("arrival_date")
    @destination.departure_date = params.fetch("departure_date")
    @destination.trip_id = params.fetch("trip_id")
    @destination.country_name = params.fetch("country_name")

    if @destination.valid?
      @destination.save

      redirect_to("/destinations/#{@destination.id}", :notice => "Destination updated successfully.")
    else
      render("destination_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_trip
    @destination = Destination.find(params.fetch("id_to_remove"))

    @destination.destroy

    redirect_to("/trips/#{@destination.trip_id}", notice: "Destination deleted successfully.")
  end

  def destroy_row
    @destination = Destination.find(params.fetch("id_to_remove"))

    @destination.destroy

    redirect_to("/destinations", :notice => "Destination deleted successfully.")
  end
end
