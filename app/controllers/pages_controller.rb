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

    visual_cluster = visual_cluster_data(number_bots, start, finish)
=begin
    real_cluster_middle = (calculation_clasterization(number_bots, visual_cluster.dig(:area_cluster_circle)) +
      calculation_clasterization(number_bots, visual_cluster.dig(:area_cluster_square)) +
      calculation_clasterization(number_bots, visual_cluster.dig(:area_cluster_triangle)) +
      calculation_clasterization(number_bots, visual_cluster.dig(:area_cluster_maze))) / 4.0
=end

    @real_cluster_circle = calculation_clasterization(number_bots, visual_cluster.dig(:area_cluster_circle)).round(3)
    @real_cluster_square = calculation_clasterization(number_bots, visual_cluster.dig(:area_cluster_square)).round(3)
    @real_cluster_triangle = calculation_clasterization(number_bots, visual_cluster.dig(:area_cluster_triangle)).round(3)
    @real_cluster_maze = calculation_clasterization(number_bots, visual_cluster.dig(:area_cluster_maze)).round(3)
    @real_cluster_middle = visual_cluster.dig(:average_result_observations)

    # Час виходу ботів + середнє квадратичне відхилення
    result_deviation_mean_exit = res_observation_deviation_mean(number_bots, start, finish, "exit")
    result_deviation_mean_stay = res_observation_deviation_mean(number_bots, start, finish, "stay")
    @observation_bots_out_time = []
    @observation_maze_out_first = []
    @observation_bots_stay_time = []

    (0..number_exit_bots.dig(number_bots).length - 1).each { |i|
      @observation_bots_out_time << time_bots_maze_out(number_exit_bots.dig(number_bots)[i], start, finish).dig(:final_result)
      @observation_bots_stay_time << time_bots_maze_stay(number_exit_bots.dig(number_bots)[i], number_bots, start, finish)
      # Час виходу першого боту для кожного спостереження
      # @observation_maze_out_first << time_bots_maze_out(number_exit_bots.dig(number_bots)[i], start, finish).dig(:result_mas)[0]
    }

    first_bot_out = first_bot_maze_out(number_bots, start, finish)
    # Час виходу першого боту для кожного спостереження
    @observation_maze_out_first = first_bot_out.dig(:count_all_observations)

    # @average_time_maze_out = (@observation_maze_out_first.sum.to_f / @observation_maze_out_first.length.to_f).round(5)

    # Показники для виходів ботів
    @average_result_observ_exit = result_deviation_mean_exit.dig(:average_result_observations)
    @result_deviation_exit = result_deviation_mean_exit.dig(:result_deviation)
    @mean_square_deviation_exit = result_deviation_mean_exit.dig(:mean_square_deviation)

    # Показники для перебування ботів в лабіринті
    @average_result_observ_stay = result_deviation_mean_stay.dig(:average_result_observations)
    @result_deviation_stay = result_deviation_mean_stay.dig(:result_deviation)
    @mean_square_deviation_stay = result_deviation_mean_stay.dig(:mean_square_deviation)

    # Показники для кількості ботів, що вийшли
    results_obs_count_exit = count_bots_maze_out_obs(number_bots, finish)
    @result_all_obs_count = results_obs_count_exit.dig(:count_all_observations)
    @average_result_observ_count = results_obs_count_exit.dig(:average_result_observations)
    @result_deviation_count = results_obs_count_exit.dig(:result_deviation)
    @mean_square_deviation_count = results_obs_count_exit.dig(:mean_square_deviation)

    # Показники для кластеризації
    @average_result_observ_clast = visual_cluster.dig(:average_result_observations)
    @result_deviation_clast = visual_cluster.dig(:result_deviation)
    @mean_square_deviation_clast = visual_cluster.dig(:mean_square_deviation)

    # Показники для першого боту, що вийшов
    @average_time_maze_out_first = first_bot_out.dig(:average_result_observations)
    @result_deviation_first = first_bot_out.dig(:result_deviation)
    @mean_square_deviation_first = first_bot_out.dig(:mean_square_deviation)

    # графік з полосою похибки
    @chart_error_all_system_exit = chart_error(start, finish, "exit")
    @chart_error_all_system_stay = chart_error(start, finish, "stay")
    @chart_error_all_system_count = chart_error(start, finish, "count_out")
    @chart_error_all_system_first = chart_error(start, finish, "first_out")
    @chart_error_all_system_clast = chart_error_clast(start, finish)
  end
end
