class LoggedHoursController < ApplicationController
  before_action :set_logged_hour, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @logged_hours = LoggedHour.all
    respond_with(@logged_hours)
  end

  def show
    respond_with(@logged_hour)
  end

  def new
    @logged_hour = LoggedHour.new
    respond_with(@logged_hour)
  end

  def edit
  end

  def create
    @logged_hour = LoggedHour.new(logged_hour_params)
    @logged_hour.save
    respond_with(@logged_hour)
  end

  def update
    @logged_hour.update(logged_hour_params)
    respond_with(@logged_hour)
  end

  def destroy
    @logged_hour.destroy
    respond_with(@logged_hour)
  end

  private
    def set_logged_hour
      @logged_hour = LoggedHour.find(params[:id])
    end

    def logged_hour_params
      params.require(:logged_hour).permit(:period, :logged_from_date, :logged_to_date, :hours, :description, :project_id)
    end
end
