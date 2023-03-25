module ResultsClusterModule
  def active_cluster_circle
=begin
    1.step(60, 1) do
      result << rand(1..number_bots)
    end
=end

    {
      5 => [2, 1, 4, 2, 3, 1, 1, 5, 2, 3, 3, 3, 1, 3, 1, 1, 2, 2, 2, 2, 5, 3, 3, 3, 1, 1, 2, 3, 2, 2, 2, 2, 2, 1, 2, 2, 5, 1, 5, 3, 5, 4, 5, 1, 4, 4, 4, 2, 4, 4, 4, 4, 1, 1, 2, 2, 5, 3, 5, 3],
      10 => [3, 5, 7, 5, 9, 9, 3, 2, 9, 2, 2, 1, 7, 5, 2, 8, 9, 10, 1, 5, 10, 6, 8, 4, 1, 9, 9, 8, 6, 10, 7, 4, 3, 1, 3, 7, 4, 6, 4, 9, 4, 5, 1, 7, 10, 5, 7, 9, 3, 3, 1, 7, 2, 2, 8, 5, 10, 10, 9, 8]
    }
  end

  def active_cluster_square
    {
      5 => [3, 1, 4, 2, 3, 1, 1, 5, 2, 3, 3, 3, 1, 3, 1, 1, 2, 2, 2, 3, 5, 3, 3, 3, 1, 1, 2, 3, 2, 2, 2, 2, 2, 1, 2, 2, 5, 1, 5, 3, 5, 2, 5, 1, 4, 4, 4, 2, 4, 4, 4, 4, 1, 1, 2, 2, 5, 3, 5, 3],
      10 => [3, 5, 5, 5, 1, 1, 3, 2, 4, 2, 2, 1, 7, 5, 2, 8, 1, 5, 1, 5, 5, 6, 1, 4, 1, 9, 9, 8, 6, 3, 7, 4, 3, 1, 1, 7, 4, 6, 4, 9, 4, 5, 1, 7, 5, 5, 7, 9, 3, 3, 1, 7, 2, 2, 8, 5, 1, 7, 9, 8]
    }
  end

  def active_cluster_triangle
    {
      5 => [3, 1, 4, 2, 3, 1, 1, 5, 2, 3, 3, 3, 1, 3, 1, 1, 2, 2, 2, 2, 5, 3, 3, 3, 1, 1, 2, 3, 2, 2, 2, 2, 2, 1, 2, 2, 5, 1, 5, 3, 5, 2, 5, 1, 4, 4, 4, 2, 4, 4, 4, 4, 1, 1, 2, 2, 5, 3, 5, 3],
      10 => [3, 5, 5, 5, 3, 6, 3, 2, 1, 2, 2, 1, 7, 5, 2, 8, 1, 3, 1, 5, 5, 6, 8, 4, 1, 9, 9, 8, 6, 3, 7, 4, 3, 1, 1, 7, 4, 6, 4, 9, 4, 5, 1, 7, 5, 5, 7, 9, 3, 3, 1, 7, 2, 2, 8, 5, 1, 7, 9, 8]
    }
  end
end

module ResultsMazeModule
  def number_exit_bots
    {
      5 => [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5],
      10 => [0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 6, 6, 6, 6, 6, 6, 6, 7, 7, 7, 8, 8, 8, 9, 9, 9, 9, 9, 9, 10, 10, 10, 10]
    }
  end

  def observation
    {
      5 => [1.17471, 2.42175, 2.73427, 4.56187, 4.8486, 4.98218, 8.66572, 8.6746, 8.77094, 10.11809, 11.17485, 11.41829, 12.64158, 12.80003, 14.64029, 15.4518, 17.28332, 17.97489, 18.88525, 19.06943, 19.21734, 20.14163, 20.57236, 21.75462, 23.46285, 24.5675, 25.22279, 27.06681, 28.9729, 30.20777, 31.4524, 32.03559, 33.4275, 33.70668, 34.97064, 35.01149, 35.7908, 37.91487, 38.75304, 41.12951, 41.74468, 42.11153, 44.6141, 45.02292, 45.19657, 47.40784, 47.80478, 48.11443, 48.67487, 48.80431, 50.18612, 51.32823, 54.37876, 54.77599, 55.75361, 55.79985, 56.24556, 57.49795, 58.48663, 58.52635],
      10 => [3, 5, 7, 5, 9, 9, 3, 2, 9, 2, 2, 1, 7, 5, 2, 8, 9, 10, 1, 5, 10, 6, 8, 4, 1, 9, 9, 8, 6, 10, 7, 4, 3, 1, 3, 7, 4, 6, 4, 9, 4, 5, 1, 7, 10, 5, 7, 9, 3, 3, 1, 7, 2, 2, 8, 5, 10, 10, 9, 8]
    }
  end
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

module VisualizationModule
  include ResultsClusterModule
  include ResultsSeparatedModule
  include ResultsMazeModule

  def visual_cluster_data(start, finish, number_bots)
    cluster_circle = active_cluster_circle
    cluster_square = active_cluster_square
    cluster_triangle = active_cluster_triangle
    #separated_bots = active_separated(number_bots)
    step = 1
    result_circle = []
    result_square = []
    result_triangle = []
    mas_for_clust_circle = []
    mas_for_clust_square = []
    mas_for_clust_triangle = []

    start.step(finish, step) do |i|
      mas_for_clust_circle << cluster_circle.dig(number_bots)[i-1]
      mas_for_clust_square << cluster_square.dig(number_bots)[i-1]
      mas_for_clust_triangle << cluster_triangle.dig(number_bots)[i-1]

      if i == start
        result_circle << ["#{i} - #{((i) + step)}", cluster_circle.dig(number_bots)[i-1]]
        result_square << ["#{i} - #{((i) + step)}", cluster_square.dig(number_bots)[i-1]]
        result_triangle << ["#{i} - #{((i) + step)}", cluster_triangle.dig(number_bots)[i-1]]
      else
        result_circle << ["#{i - 1} - #{((i - 1) + step)}", cluster_circle.dig(number_bots)[i-1]]
        result_square << ["#{i - 1} - #{((i - 1) + step)}", cluster_square.dig(number_bots)[i-1]]
        result_triangle << ["#{i - 1} - #{((i - 1) + step)}", cluster_triangle.dig(number_bots)[i-1]]
      end
    end

    {
      :visual_result_circle => result_circle,
      :visual_result_square => result_square,
      :visual_result_triangle => result_triangle,
      :area_cluster_circle => mas_for_clust_circle,
      :area_cluster_square => mas_for_clust_square,
      :area_cluster_triangle => mas_for_clust_triangle
    }
  end

  def visual_cluster_maze(start, finish, number_bots)
    exit_bots = number_exit_bots
    step = 1
    result = []

    start.step(finish, step) do |i|

      if i == start
        result << ["#{i} - #{((i) + step)}", exit_bots.dig(number_bots)[i-1]]
      else
        result << ["#{i - 1} - #{((i - 1) + step)}", exit_bots.dig(number_bots)[i-1]]
      end
    end

    result
  end

  def calculation_clusterization(number_bots, type_area_clust)
    var_for_max = 0

    type_area_clust.each do |max|

      if max > var_for_max
        var_for_max = max
      end
    end

    (var_for_max * 100).to_f / number_bots.to_f
  end

  def calculation_time_maze(number_bots)
    observations = observation.dig(number_bots)

    observations.sum.to_f / observations.length.to_f
  end

=begin
  def series_visual(alf, bet, n_g, frequency)
    step = (bet - alf) / n_g
    result = []
    j = 0

    alf.step(bet, step) do |i|

      y = different_series(alf, bet, n_g, frequency)[j]
      j += 1

      if i == bet
        break
      end

      result << ["#{i.round(2)} - #{(i + step).round(2)}", y]
    end

    result
  end

=end
end

=begin
module ResultModule
  include NeymanModule
  include MetropolisModule
  include ReverseModule

  # математичне очікування
  def result_average(alf, bet)
    (bet - alf) / Math.log(bet / alf)
  end

  # дисперсія
  def result_dispersion(alf, bet)
    (((bet ** 2) - (alf ** 2)) / (2 * Math.log(bet / alf))) - (((bet - alf) / Math.log(bet / alf)) ** 2)
  end

  # математичне очікування для серій
  def result_average_series(result_param)
    sum_for_average = 0.0

    result_param.each do |i|
      sum_for_average += i
    end

    sum_for_average / result_param.length.to_f
  end
=end

# мода для серій
=begin
  def result_mode_series(result_param)
    temp = result_param[0]

    result_param.each do |i|
      if temp > i
        temp = i
      end
    end

    temp
  end
=end

=begin
  def result_mode_series(result_param)
    result = {}

    result_param.each do |word|
      result[word.round(3)] ||= 0
      result[word.round(3)] += 1
    end
    temp = result.size - 1

    result.sort_by { |key, value| value }[temp][0]
  end

  # дисперсія для серій
  def result_dispersion_series(result_param)
    temp = 0.0

    result_param.each do |i|
      temp += i ** 2
    end

    average_var_squared = temp / result_param.length

    average_square = result_average_series(result_param) ** 2

    average_var_squared - average_square
  end

  def helper_result(alf, bet, val_n, n_g)
    helper_result_methods = {
      :neyman_for_first => result_neyman(val_n, alf, bet),
      :neyman_for_second => result_neyman(val_n, alf, bet),
      :metropolis_for_first => ran_rec_metropolis(alf, bet, val_n),
      :metropolis_for_second => ran_rec_metropolis(alf, bet, val_n),
      :reverse_for_first => result_reverse(alf, bet, val_n),
      :reverse_for_second => result_reverse(alf, bet, val_n)
    }

    helper_result_frequency = {
      :frequency_one_neyman => calculation_pk_frequency(alf, bet, n_g, helper_result_methods.dig(:neyman_for_first)),
      :frequency_two_neyman => calculation_pk_frequency(alf, bet, n_g, helper_result_methods.dig(:neyman_for_second)),
      :frequency_one_metropolis => calculation_pk_frequency(alf, bet, n_g, helper_result_methods.dig(:metropolis_for_first)),
      :frequency_two_metropolis => calculation_pk_frequency(alf, bet, n_g, helper_result_methods.dig(:metropolis_for_second)),
      :frequency_one_reverse => calculation_pk_frequency(alf, bet, n_g, helper_result_methods.dig(:reverse_for_first)),
      :frequency_two_reverse => calculation_pk_frequency(alf, bet, n_g, helper_result_methods.dig(:reverse_for_second))
    }

    {
      :methods => helper_result_methods,
      :frequencies => helper_result_frequency
    }
  end
end
=end
