require_relative 'F:\RubyOnRailsProjects\test_diplom\app\results\Modules.rb'
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

    visual_cluster = visual_cluster_data(start, finish, number_bots)
    visual_maze = visual_out_maze(start, finish, number_bots)
    real_cluster_middle = (calculation_clusterization(number_bots, visual_cluster.dig(:area_cluster_circle)) +
      calculation_clusterization(number_bots, visual_cluster.dig(:area_cluster_square)) +
      calculation_clusterization(number_bots, visual_cluster.dig(:area_cluster_triangle)) +
      calculation_clusterization(number_bots, visual_cluster.dig(:area_cluster_maze))) / 4.0

    @cluster_circle = visual_cluster.dig(:visual_result_circle)
    @cluster_square = visual_cluster.dig(:visual_result_square)
    @cluster_triangle = visual_cluster.dig(:visual_result_triangle)
    @cluster_maze = visual_cluster.dig(:visual_result_maze)

    @maze_exit_bots = visual_maze

    @real_cluster_circle = calculation_clusterization(number_bots, visual_cluster.dig(:area_cluster_circle))
    @real_cluster_square = calculation_clusterization(number_bots, visual_cluster_data(start, finish, number_bots).dig(:area_cluster_square))
    @real_cluster_triangle = calculation_clusterization(number_bots, visual_cluster.dig(:area_cluster_triangle))
    @real_cluster_maze = calculation_clusterization(number_bots, visual_cluster.dig(:area_cluster_maze))
    @real_cluster_middle = real_cluster_middle.round(5)

    #@average_time_maze_out = calculation_time_maze_out(number_bots).round(5)
    #@observation_maze_out = observation.dig(number_bots)
    @user_cluster = user_cluster.to_f

    # Залежність середнього часу перебування ботів в лабіринті від кількості ботів
    # Статичні дані
    # @time_observation_stay = result_observation_time(number_bots)
    # Динамічні дані
    @time_observation_stay = result_observation_time(number_bots, start, finish)
    #@time_observation_results = []

=begin
    time_observation.each do |observation|
      @time_observation_results << observation.round(5)
    end
=end

    # Середній час для всіх спостережень (перебування в лабіринті)
    @average_time_maze_stay = @time_observation_stay.sum.to_f / @time_observation_stay.length.to_f

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
    # Динамічні дані
    # Час виходу ботів + середнє квадратичне відхилення
    result_deviation_mean = res_observation_deviation_mean(number_bots, start, finish)
    @observation_bots_out_time = []
    @observation_maze_out_first = []

    (0..number_exit_bots.dig(number_bots).length - 1).each { |i|
      @observation_bots_out_time << time_bots_maze_out(number_exit_bots.dig(number_bots)[i], start, finish).dig(:final_result)
      # Час виходу першого боту для кожного спостереження
      @observation_maze_out_first << time_bots_maze_out(number_exit_bots.dig(number_bots)[i], start, finish).dig(:result_mas)[0]
    }

    # Серенє значення часу виходу першого боту
    @average_time_maze_out = @observation_maze_out_first.sum.to_f / @observation_maze_out_first.length.to_f

    @average_result_observations = result_deviation_mean.dig(:average_result_observations)
    @result_deviation = result_deviation_mean.dig(:result_deviation)
    @mean_square_deviation = result_deviation_mean.dig(:mean_square_deviation)
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
