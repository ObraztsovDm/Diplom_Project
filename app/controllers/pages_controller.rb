require_relative 'F:\RubyOnRailsProjects\test_diplom\app\results\Module_Calc.rb'
require_relative 'F:\RubyOnRailsProjects\test_diplom\app\results\Module_Visual.rb'
require_relative 'F:\RubyOnRailsProjects\test_diplom\app\controllers\actives_controller.rb'
include ResultsClusterModule # модуль результатів кластерізації ботів
include ResultsSeparatedModule # модуль результатів відокремлених ботів ботів
include VisualizationModule # модуль методів для гістограм
include ResultsMazeModule # модуль результатів лабіринту
include CalculationModule # модуль обчислень

class PagesController < ApplicationController
  def about # вызывает шаблон views/pages/about.html.erb
    @heading = 'Сторінка про нас' # переменная вывода информации
      end

  def videos
    @heading = 'Сторінка всіх відеоматеріалів'
  end

  def help

  end

  def numerical_character
    @active = Active.find(Active.all.length)
    start = @active.start
    finish = @active.end
    number_bots = @active.number_bots

    visual_cluster = visual_cluster_data(start, finish, number_bots)
    real_cluster_middle = (calculation_clasterization(number_bots, visual_cluster.dig(:area_cluster_circle)) +
      calculation_clasterization(number_bots, visual_cluster.dig(:area_cluster_square)) +
      calculation_clasterization(number_bots, visual_cluster.dig(:area_cluster_triangle)) +
      calculation_clasterization(number_bots, visual_cluster.dig(:area_cluster_maze))) / 4.0

    @real_cluster_circle = calculation_clasterization(number_bots, visual_cluster.dig(:area_cluster_circle)).round(3)
    @real_cluster_square = calculation_clasterization(number_bots, visual_cluster_data(start, finish, number_bots).dig(:area_cluster_square)).round(3)
    @real_cluster_triangle = calculation_clasterization(number_bots, visual_cluster.dig(:area_cluster_triangle)).round(3)
    @real_cluster_maze = calculation_clasterization(number_bots, visual_cluster.dig(:area_cluster_maze)).round(3)
    @real_cluster_middle = real_cluster_middle.round(5)

    # Час виходу ботів + середнє квадратичне відхилення
    result_deviation_mean_exit = res_observation_deviation_mean(number_bots, start, finish, "exit")
    result_deviation_mean_stay = res_observation_deviation_mean(number_bots, start, finish, "stay")
    @observation_bots_out_time = []
    @observation_maze_out_first = []
    @observation_bots_stay_time = []

    (0..number_exit_bots.dig(number_bots).length - 1).each { |i|
      @observation_bots_out_time << time_bots_maze_out(number_exit_bots.dig(number_bots)[i], start, finish).dig(:final_result)
      @observation_bots_stay_time << time_bots_maze_stay(number_exit_bots.dig(number_bots)[i], number_bots, start, finish).dig(:final_result)
      # Час виходу першого боту для кожного спостереження
      @observation_maze_out_first << time_bots_maze_out(number_exit_bots.dig(number_bots)[i], start, finish).dig(:result_mas)[0]
    }

    # Серенє значення часу виходу першого боту
    @average_time_maze_out = (@observation_maze_out_first.sum.to_f / @observation_maze_out_first.length.to_f).round(5)

    # Показники для виходів ботів
    @average_result_observ_exit = result_deviation_mean_exit.dig(:average_result_observations)
    @result_deviation_exit = result_deviation_mean_exit.dig(:result_deviation)
    @mean_square_deviation_exit = result_deviation_mean_exit.dig(:mean_square_deviation)

    # Показники для перебування ботів в лабіринті
    @average_result_observ_stay = result_deviation_mean_stay.dig(:average_result_observations)
    @result_deviation_stay = result_deviation_mean_stay.dig(:result_deviation)
    @mean_square_deviation_stay = result_deviation_mean_stay.dig(:mean_square_deviation)

  end
end
