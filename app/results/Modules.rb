module ResultsClusterModule
  def active_cluster_circle
    {
      5 => [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 2, 3, 2, 2, 0, 0, 0, 0, 0, 2],
      7 => [0, 0, 0, 0, 0, 0, 0, 0, 3, 2, 2, 2, 0, 0, 0, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 2, 3, 3, 4, 4],
      9 => [0, 4, 4]
    }
  end

  def active_cluster_square
    {
      5 => [3, 1, 4, 2, 3, 1, 1, 1, 2, 3, 3, 3, 1, 3, 1, 1, 2, 2, 2, 3, 2, 3, 3, 3, 1, 1, 2, 3, 2, 5],
      7 => [3, 5, 5, 5, 1, 1, 3, 2, 4, 2, 2, 1, 7, 5, 2, 8, 1, 5, 1, 5, 5, 6, 1, 4, 1, 9, 9, 8, 6, 3, 7, 4, 3, 1, 1, 7, 4, 6, 4, 9, 4, 5, 1, 7, 5, 5, 7, 9, 3, 3, 1, 7, 2, 2, 8, 5, 1, 7, 9, 8]
    }
  end

  def active_cluster_triangle
    {
      5 => [3, 1, 4, 2, 3, 1, 1, 1, 2, 3, 3, 3, 1, 3, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 1, 1, 2, 3, 2, 2],
      7 => [3, 5, 5, 5, 3, 6, 3, 2, 1, 2, 2, 1, 7, 5, 2, 8, 1, 3, 1, 5, 5, 6, 8, 4, 1, 9, 9, 8, 6, 3, 7, 4, 3, 1, 1, 7, 4, 6, 4, 9, 4, 5, 1, 7, 5, 5, 7, 9, 3, 3, 1, 7, 2, 2, 8, 5, 1, 7, 9, 8]
    }
  end

  def active_cluster_maze
    {
      5 => [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 2, 3, 2, 2, 0, 0, 0, 0, 0, 2],
      7 => [0, 0, 0, 0, 0, 0, 0, 0, 3, 2, 2, 2, 0, 0, 0, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 2, 3, 3, 4, 4],
      9 => [0, 4, 4]
    }
  end
end

module ResultsMazeModule
  def number_exit_bots
    {
      5 => [[0, 0, 0, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3],
            [0, 0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5],
            [0, 0, 0, 0, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5]],
      7 => [[0, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 3, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7],
            [0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 3, 3, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6],
            [0, 0, 0, 0, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5]],
      9 => [[0, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 3, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 8, 8, 8, 8],
            [0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 3, 3, 6, 7, 7, 7, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 8, 8, 9],
            [0, 0, 0, 0, 5, 5, 5, 5, 5, 5, 5, 5, 7, 7, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 9]],
      12 => [[0, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 3, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 10, 10, 10, 10, 12, 12, 12, 12],
             [0, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 3, 5, 5, 5, 6, 6, 7, 7, 7, 7, 7, 10, 10, 10, 10, 11, 11, 11, 11],
             [0, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 3, 5, 5, 5, 6, 6, 7, 7, 7, 7, 7, 9, 9, 9, 9, 9, 9, 9, 11]],
      15 => [[0, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 3, 7, 7, 7, 7, 7, 7, 8, 8, 8, 9, 10, 10, 10, 10, 13, 15, 15, 15],
             [0, 1, 1, 2, 2, 2, 2, 3, 3, 5, 5, 5, 5, 5, 5, 6, 6, 7, 7, 10, 10, 10, 10, 10, 10, 10, 11, 14, 14, 15],
             [0, 1, 1, 2, 2, 2, 2, 3, 3, 5, 5, 5, 5, 5, 5, 6, 6, 7, 7, 7, 7, 7, 7, 7, 7, 7, 10, 14, 14, 14]],
    }
  end

=begin
  def observation
    {
      5 => [3, 3, 3],
      10 => [3, 5, 7]
    }
  end
=end
end

module ResultsSeparatedModule
=begin
  def active_separated(number_bots)
    result = []

    1.step(60, 1) do
      result << rand(1..number_bots)
    end

    {
      :five_bots => result,
      :ten_bots => result
    }
  end
=end
end

module CalculationModule
  include ResultsClusterModule
  include ResultsSeparatedModule
  include ResultsMazeModule

  def calculation_clusterization(number_bots, type_area_clust)
    var_for_max = 0

    type_area_clust.each do |max|

      if max > var_for_max
        var_for_max = max
      end
    end

    (var_for_max * 100).to_f / number_bots.to_f
  end

=begin
  def calculation_time_maze_out(number_bots)
    observations = observation.dig(number_bots)

    observations.sum.to_f / observations.length.to_f
  end
=end

  # Статичні дані
  # Залежність середнього часу перебування ботів в лабіринті від кількості ботів
=begin
  def calculation_time_bots_maze(number_exit_bots, number_bots)
    result = []
    previous_value = nil

    number_exit_bots.each_with_index do |value, index|
      if previous_value && value != previous_value
        if value - number_exit_bots[index - 1] == 1
          result << index
        else
          # Дублювання значення виходу ботів (value - mas[index - 1] != 1)
          result.concat(Array.new(value - number_exit_bots[index - 1]) { index })
        end
      end
      previous_value = value
    end

    while result.length != number_bots
      result << number_exit_bots.length
    end

    result.sum.to_f / number_bots.to_f
  end

  # Час перебування кожного з ботів у лабіринті для кожного спостереження
  def result_observation_time(number_bots)
    result_observations = []

    (0..number_exit_bots.dig(number_bots).length - 1).each { |i|
      result_observations << calculation_time_bots_maze(number_exit_bots.dig(number_bots)[i], number_bots)
    }

    result_observations
  end
=end

  # Динамічні дані
  # Залежність середнього часу перебування ботів в лабіринті від кількості ботів
  def time_bots_maze_stay(mas, number_bots, start, finish)
    result = []
    previous_value = nil

    (start).step(finish - 1) do |i|
      if previous_value && mas[i] != previous_value
        if mas[i] - mas[i - 1] == 1
          result << i
        else
          result.concat(Array.new(mas[i] - mas[i - 1]) { i })
        end
      end
      previous_value = mas[i]
    end

    while result.length != number_bots
      result << finish
    end

     result.sum.to_f / number_bots
  end

  # Час перебування кожного з ботів у лабіринті для кожного спостереження
  def result_observation_time(number_bots, start, finish)
    result_observations = []

    (0..number_exit_bots.dig(number_bots).length - 1).each { |i|
      result_observations << time_bots_maze_stay(number_exit_bots.dig(number_bots)[i], number_bots, start, finish)
    }
    result_observations
  end

  # гістогранме представлення у відсотках
  def percentage_histogram_maze(number_bots)
    averages = []

    number_exit_bots.dig(number_bots).each do |subarr|
      subarr.each_with_index do |num, idx|
        averages[idx] ||= 0
        averages[idx] += (num.to_f / 3.0) * 100 / number_bots
      end
    end

    averages
  end

  # Статичні дані
  # Час виходу ботів з лабіринту + середнє квадратичне відхилення
=begin
  def time_bots_maze_out(number_exit_bots)
    result = []
    previous_value = nil

    number_exit_bots.each_with_index do |value, index|
      if previous_value && value != previous_value
        if value - number_exit_bots[index - 1] == 1
          result << index + 1
        else
          # Дублювання значення виходу ботів (value - mas[index - 1] != 1)
          result.concat(Array.new(value - number_exit_bots[index - 1]) { index + 1 })
        end
      end
      previous_value = value
    end

    {
      :result_mas => result,
      :final_result => result.empty? ? 0 : (result.sum.to_f / result.length.to_f).round(5)
    }
  end

  def res_observation_deviation_mean(number_bots)
    exit_bots = number_exit_bots.dig(number_bots)
    exit_bots_length = exit_bots.length

    # Середнє значення часу виходу ботів
    result_observations = exit_bots.map { |bot| time_bots_maze_out(bot).dig(:final_result) }.sum.to_f / 3.0
    # Розрахунок відхилення за кожним спостереженням
    result_deviation = exit_bots.map { |bot| (time_bots_maze_out(bot).dig(:final_result) - result_observations).abs.round(5) }
    # Середнє квадратичне відхилення
    result_sum_deviation = result_deviation.map { |elem| elem ** 2 }.sum
    mean_square_deviation = Math.sqrt(result_sum_deviation / exit_bots_length)

    {
      :average_result_observations => result_observations.round(5),
      :result_deviation => result_deviation,
      :mean_square_deviation => mean_square_deviation.round(5)
    }
  end
=end

  # Динамічні дані
  #Час виходу ботів з лабіринту + середнє квадратичне відхилення
  def time_bots_maze_out(mas, start, finish)
    result = []
    previous_value = nil

    (start).step(finish - 1) do |i|
      if previous_value && mas[i] != previous_value
        if mas[i] - mas[i - 1] == 1
          result << i + 1
        else
          result.concat(Array.new(mas[i] - mas[i - 1]) { i + 1 })
        end
      end
      previous_value = mas[i]
    end

    {
      :result_mas => result.empty? ? 0 : result,
      :final_result => result.empty? ? 0 : result.sum.to_f / result.length.to_f
    }
    #(result.sum.to_f / result.length.to_f).round(4)
  end

  def res_observation_deviation_mean(number_bots, start, finish)
    exit_bots = number_exit_bots.dig(number_bots)
    exit_bots_length = exit_bots.length

    # Середнє значення часу виходу ботів
    result_observations = exit_bots.map { |bot| time_bots_maze_out(bot, start, finish).dig(:final_result) }.sum.to_f / 3.0
    # Розрахунок відхилення за кожним спостереженням
    result_deviation = exit_bots.map { |bot| (time_bots_maze_out(bot, start, finish).dig(:final_result) - result_observations).abs.round(5) }
    # Середнє квадратичне відхилення
    result_sum_deviation = result_deviation.map { |elem| elem ** 2 }.sum
    mean_square_deviation = Math.sqrt(result_sum_deviation / exit_bots_length)

    {
      :average_result_observations => result_observations.round(4),
      :result_deviation => result_deviation,
      :mean_square_deviation => mean_square_deviation.round(4)
    }
  end
end

module VisualizationModule
  include ResultsClusterModule
  include ResultsSeparatedModule
  include ResultsMazeModule
  include CalculationModule

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
      mas_for_clust_maze << cluster_maze.dig(number_bots)[i - 1]

      result_circle << ["#{i - step} - #{i}", cluster_circle.dig(number_bots)[i - 1]]
      result_square << ["#{i - step} - #{i}", cluster_square.dig(number_bots)[i - 1]]
      result_triangle << ["#{i - step} - #{i}", cluster_triangle.dig(number_bots)[i - 1]]
      result_maze << ["#{i - step} - #{i}", cluster_maze.dig(number_bots)[i - 1]]
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
