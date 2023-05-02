require_relative 'F:\RubyOnRailsProjects\test_diplom\app\results\Module_Data.rb'
require_relative 'F:\RubyOnRailsProjects\test_diplom\app\results\Module_Calc.rb'
include ResultsClusterModule
include ResultsSeparatedModule
include ResultsMazeModule
include CalculationModule

module VisualizationModule

  def visual_cluster_data(start, finish, number_bots)
    cluster_circle = active_cluster_circle
    cluster_square = active_cluster_square
    cluster_triangle = active_cluster_triangle
    cluster_maze = active_cluster_maze
    #separated_bots = active_separated(number_bots)
    step = 1
    result_circle = []
    result_square = []
    result_triangle = []
    result_maze = []
    mas_for_clust_circle = []
    mas_for_clust_square = []
    mas_for_clust_triangle = []
    mas_for_clust_maze = []

    (start + 1).step(finish, step) do |i|
      mas_for_clust_circle << cluster_circle.dig(number_bots)[i - 1]
      mas_for_clust_square << cluster_square.dig(number_bots)[i - 1]
      mas_for_clust_triangle << cluster_triangle.dig(number_bots)[i - 1]
      mas_for_clust_maze << clasterization_maze(number_bots)[i - 1].round(4)

      result_circle << ["#{i - step} - #{i}", cluster_circle.dig(number_bots)[i - 1]]
      result_square << ["#{i - step} - #{i}", cluster_square.dig(number_bots)[i - 1]]
      result_triangle << ["#{i - step} - #{i}", cluster_triangle.dig(number_bots)[i - 1]]
      result_maze << ["#{i - step} - #{i}", clasterization_maze(number_bots)[i - 1].round(4)]
    end

    {
      :visual_result_circle => result_circle,
      :visual_result_square => result_square,
      :visual_result_triangle => result_triangle,
      :visual_result_maze => result_maze,
      :area_cluster_circle => mas_for_clust_circle,
      :area_cluster_square => mas_for_clust_square,
      :area_cluster_triangle => mas_for_clust_triangle,
      :area_cluster_maze => mas_for_clust_maze
    }
  end

  def visual_out_maze(start, finish, number_bots)
    exit_bots = number_exit_bots
    step = 1
    result_first_observation = []
    result_second_observation = []
    result_third_observation = []

    (start + 1).step(finish, step) do |i|
      result_first_observation << ["#{i - step} - #{i}", exit_bots.dig(number_bots)[0][i - 1]]
      result_second_observation << ["#{i - step} - #{i}", exit_bots.dig(number_bots)[1][i - 1]]
      result_third_observation << ["#{i - step} - #{i}", exit_bots.dig(number_bots)[2][i - 1]]
    end

    {
      :first_observation => result_first_observation,
      :second_observation => result_second_observation,
      :third_observation => result_third_observation
    }
  end

  def visual_maze_all_system(start, finish)
    step = 1
    result_5_bots = []
    result_7_bots = []
    result_9_bots = []
    result_12_bots = []
    result_15_bots = []

    (start + 1).step(finish, step) do |i|
      result_5_bots << ["#{i - step} - #{i}", percentage_histogram_maze(5)[i - 1].round(4)]
      result_7_bots << ["#{i - step} - #{i}", percentage_histogram_maze(7)[i - 1].round(4)]
      result_9_bots << ["#{i - step} - #{i}", percentage_histogram_maze(9)[i - 1].round(4)]
      result_12_bots << ["#{i - step} - #{i}", percentage_histogram_maze(12)[i - 1].round(4)]
      result_15_bots << ["#{i - step} - #{i}", percentage_histogram_maze(15)[i - 1].round(4)]
    end

    {
      :five_bots => result_5_bots,
      :seven_bots => result_7_bots,
      :nine_bots => result_9_bots,
      :twelve_bots => result_12_bots,
      :fifteen_bots => result_15_bots
    }
  end
end