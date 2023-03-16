require_relative 'F:\RubyOnRailsProjects\test_diplom\app\results\Modules.rb'
include ResultsClusterModule # модуль результатів кластерізації ботів
include ResultsSeparatedModule # модуль результатів відокремлених ботів ботів
include VisualizationModule # модуль методів для гістограм
#include ResultModule # модуль результатів

class ActivesController < ApplicationController
  before_action :set_active, only: %i[ show edit update destroy ]

  # GET /actives or /actives.json
  def index
    @actives = Active.all
    length = Active.all.length

    if length == 0
      start = 1
      finish = 20
      number_bots = 5
      user_cluster = 90
    else
      @active = Active.find(length)
      start = @active.start
      finish = @active.end
      number_bots = @active.number_bots
      user_cluster = @active.guess_claster
    end

    visual = visual_cluster_data(start, finish, number_bots)
    real_cluster_middle = (calculation_clusterization(number_bots, visual.dig(:area_cluster_circle)) +
      calculation_clusterization(number_bots, visual.dig(:area_cluster_square)) +
      calculation_clusterization(number_bots, visual.dig(:area_cluster_triangle))) / 3.0


    @cluster_circle = visual.dig(:visual_result_circle)
    @cluster_square = visual.dig(:visual_result_square)
    @cluster_triangle = visual.dig(:visual_result_triangle)
    @real_cluster_circle = calculation_clusterization(number_bots, visual.dig(:area_cluster_circle))
    @real_cluster_square = calculation_clusterization(number_bots, visual.dig(:area_cluster_square))
    @real_cluster_triangle = calculation_clusterization(number_bots, visual.dig(:area_cluster_triangle))
    @real_cluster_middle = real_cluster_middle.round(5)
    @user_cluster = user_cluster.to_f
  end

  # GET /actives/1 or /actives/1.json
  def show
  end

  # GET /actives/new
  def new
    @active = Active.new
  end

  # GET /actives/1/edit
  def edit
  end

  # POST /actives or /actives.json
  def create
    @active = Active.new(active_params)

    respond_to do |format|
      if @active.save
        format.html { redirect_to home_path(@active)}
        format.json { render :show, status: :created, location: @active }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @active.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /actives/1 or /actives/1.json
  def update
    respond_to do |format|
      if @active.update(active_params)
        format.html { redirect_to actives_url(@active)}
        format.json { render :show, status: :ok, location: @active }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @active.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /actives/1 or /actives/1.json
  def destroy
    @active.destroy

    respond_to do |format|
      format.html { redirect_to actives_url}
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_active
    @active = Active.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def active_params
    params.require(:active).permit(:start, :end, :number_bots, :guess_claster)
  end
end
