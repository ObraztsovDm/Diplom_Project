require_relative 'F:\RubyOnRailsProjects\test_diplom\app\results\Module_Calc.rb'
require_relative 'F:\RubyOnRailsProjects\test_diplom\app\results\Module_Visual.rb'
include ResultsClusterModule # модуль результатів кластерізації ботів
include ResultsSeparatedModule # модуль результатів відокремлених ботів ботів
include VisualizationModule # модуль методів для гістограм
include ResultsMazeModule # модуль результатів лабіринту
include CalculationModule # модуль обчислень
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

    visual_cluster = visual_cluster_data(number_bots, start, finish)
    visual_maze = visual_out_maze(number_bots, start, finish)

    @cluster_circle = visual_cluster.dig(:visual_result_circle)
    @cluster_square = visual_cluster.dig(:visual_result_square)
    @cluster_triangle = visual_cluster.dig(:visual_result_triangle)
    @cluster_maze = visual_cluster.dig(:visual_result_maze)

    @maze_exit_bots = visual_maze

    #@average_time_maze_out = calculation_time_maze_out(number_bots).round(5)
    #@observation_maze_out = observation.dig(number_bots)

    # Залежність середнього часу перебування ботів в лабіринті від кількості ботів
    # Статичні дані
    # @time_observation_stay = result_observation_time(number_bots)
    # Динамічні дані
    # @time_observation_stay = result_observation_time(number_bots, start, finish)
    #@time_observation_results = []

=begin
    time_observation.each do |observation|
      @time_observation_results << observation.round(5)
    end
=end

    # Гістограмне відсоткове представлення
    @visual_all_system_maze = visual_maze_all_system(start, finish)

    # Статичні дані
    # Час виходу ботів + середнє квадратичне відхилення
=begin
    result_deviation_mean = res_observation_deviation_mean(number_bots)
    @observation_bots_out_time = []
    @observation_maze_out_first = []

    (0..number_exit_bots.dig(number_bots).length - 1).each { |i|
      @observation_bots_out_time << time_bots_maze_out(number_exit_bots.dig(number_bots)[i]).dig(:final_result)
      # Час виходу першого боту для кожного спостереження
      @observation_maze_out_first << time_bots_maze_out(number_exit_bots.dig(number_bots)[i]).dig(:result_mas)[0]
    }
=end
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
        format.html { redirect_to home_path(@active) }
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
        format.html { redirect_to actives_url(@active) }
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
      format.html { redirect_to actives_url }
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
