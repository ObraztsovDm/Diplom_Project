require_relative 'F:\RubyOnRailsProjects\test_diplom\app\results\Module_Data.rb'
require_relative 'F:\RubyOnRailsProjects\test_diplom\app\results\Module_Calc.rb'
include ResultsClusterModule
include ResultsSeparatedModule
include ResultsMazeModule
include CalculationModule

module VisualizationModule

  def visual_cluster_data(number_bots, start, finish)
    cluster_circle = active_cluster_circle
    cluster_square = active_cluster_square
    cluster_triangle = active_cluster_triangle
    #cluster_maze = active_cluster_maze
    step = 1
    result_circle = []
    result_square = []
    result_triangle = []
    result_maze = []
    mas_for_clust_circle = []
    mas_for_clust_square = []
    mas_for_clust_triangle = []
    mas_for_clust_maze = []
    result_dev = []

    (start + 1).step(finish, step) do |i|
      mas_for_clust_circle << cluster_circle.dig(number_bots)[i - 1]
      mas_for_clust_square << cluster_square.dig(number_bots)[i - 1]
      mas_for_clust_triangle << cluster_triangle.dig(number_bots)[i - 1]
      mas_for_clust_maze << clasterization_maze(number_bots)[i - 1].round(5)

      result_circle << ["#{i - step} - #{i}", cluster_circle.dig(number_bots)[i - 1]]
      result_square << ["#{i - step} - #{i}", cluster_square.dig(number_bots)[i - 1]]
      result_triangle << ["#{i - step} - #{i}", cluster_triangle.dig(number_bots)[i - 1]]
      result_maze << ["#{i - step} - #{i}", clasterization_maze(number_bots)[i - 1].round(5)]
    end
    circle = calculation_clasterization(number_bots, mas_for_clust_circle).round(5)
    square = calculation_clasterization(number_bots, mas_for_clust_square).round(5)
    triangle = calculation_clasterization(number_bots, mas_for_clust_triangle).round(5)
    maze = calculation_clasterization(number_bots, mas_for_clust_maze).round(5)

    average = (circle + square + triangle + maze) / 4.0

    result_dev.push((average - triangle).abs.round(5), (average - square).abs.round(5), (average - circle).abs.round(5), (average - maze).abs.round(5))

    result_sum_deviation = result_dev.map { |elem| elem ** 2 }.sum
    mean_square_deviation = Math.sqrt(result_sum_deviation / 4.0)
    {
      :visual_result_circle => result_circle,
      :visual_result_square => result_square,
      :visual_result_triangle => result_triangle,
      :visual_result_maze => result_maze,
      :area_cluster_circle => mas_for_clust_circle,
      :area_cluster_square => mas_for_clust_square,
      :area_cluster_triangle => mas_for_clust_triangle,
      :area_cluster_maze => mas_for_clust_maze,
      :average_result_observations => average.round(5),
      :result_deviation => result_dev,
      :mean_square_deviation => mean_square_deviation.round(5)
    }
  end

  def visual_out_maze(number_bots, start, finish)
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

  def chart_error(start, finish, function)
    bots_variations = [5, 7, 9, 12, 15]
    tmp = []
    result = bots_variations.each_with_object(Hash.new { |h, k| h[k] = [] }) do |bots, hash|
      if function == "exit"
        temp = res_observation_deviation_mean(bots, start, finish, "exit")
      elsif function == "stay"
        temp = res_observation_deviation_mean(bots, start, finish, "stay")
      elsif function == "count_out"
        temp = count_bots_maze_out_obs(bots, finish)
      elsif function == "first_out"
        temp = first_bot_maze_out(bots, start, finish)
      end
      avg_obs, msd = temp.values_at(:average_result_observations, :mean_square_deviation)
      hash[bots] << [bots, (avg_obs + msd / 2).round(5)]
      hash[bots] << [bots, avg_obs.round(5)]
      hash[bots] << [bots, (avg_obs - msd / 2).round(5)]
      tmp << [bots, avg_obs.round(5)]
    end

    result.transform_keys! do |bots|
      case bots
      when 5 then :five_bots
      when 7 then :seven_bots
      when 9 then :nine_bots
      when 12 then :twelve_bots
      when 15 then :fifteen_bots
      else
        nil
      end
    end

    result.define_singleton_method(:dig) do |*args|
      if args == [:connect]
        tmp
      else
        super(*args)
      end
    end

    result
  end

  # візуалізація для кластеризації (графік з полосою похибки)
  # old
=begin
  def chart_error_clast(start, finish)
    bots_variations = [5, 7, 9, 12, 15]
    area_variations = [0, 1, 2, 3]
    result = []
    circle = []
    square = []
    triangle = []
    maze = []

    (bots_variations).each do |bots|
      area_variations.each do |areas|
        temp = visual_cluster_data(bots, start, finish)
        avg_obs, msd = temp.values_at(:average_result_observations, :mean_square_deviation)
        result.push([[areas, (avg_obs + msd / 2).round(5)], [areas, avg_obs.round(5)], [areas, (avg_obs - msd / 2).round(5)]])
      end
    end

    (result).each do |i|
      if i[0][0] == area_variations[0]
        circle << i
      elsif i[0][0] == area_variations[1]
        square << i
      elsif i[0][0] == area_variations[2]
        triangle << i
      elsif i[0][0] == area_variations[3]
        maze << i
      end
    end
    result_5_bots = []
    result_7_bots = []
    result_9_bots = []
    result_12_bots = []
    result_15_bots = []

    result_5_bots.push(circle[0], square[0], triangle[0], maze[0])
    result_7_bots.push(circle[1], square[1], triangle[1], maze[1])
    result_9_bots.push(circle[2], square[2], triangle[2], maze[2])
    result_12_bots.push(circle[3], square[3], triangle[3], maze[3])
    result_15_bots.push(circle[3], square[3], triangle[3], maze[3])

    {
      :circle => circle,
      :square => square,
      :triangle => triangle,
      :maze => maze,
      5 => result_5_bots,
      7 => result_7_bots,
      9 => result_9_bots,
      12 => result_12_bots,
      15 => result_15_bots
    }
  end
=end

  # new
  def chart_error_clast(start, finish)
    bots_variations = [5, 7, 9, 12, 15]
    result = []
    connect = []

    # Перебирається кожна варіація кількості ботів у системі
    bots_variations.each do |bots|
      temp = visual_cluster_data(bots, start, finish)
      # Отримуються дані середнього результату кластеризації для системної варіації
      # та середнього квадратичного відхилення
      avg_obs, msd = temp.values_at(:average_result_observations, :mean_square_deviation)
      # Наповнення результуючого масиву
      # Значення похибки = плюс/мінус половина середнього квадратичного відхилення
      content = [[bots, (avg_obs + msd / 2).round(5)], [bots, avg_obs.round(5)], [bots, (avg_obs - msd / 2).round(5)]]
      connect << content[1]
      result.push(content)
    end

    # Отримується результат
    {
      :result_mas => result,
      :connect => connect
    }
  end
end
