module ResultsClusterModule
  def active_cluster
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

  def visual_cluster_data(start, finish, number_bots)
    cluster = active_cluster
    #separated_bots = active_separated(number_bots)
    step = 1
    result = []
    mas_for_clast = []

    start.step(finish, step) do |i|
      mas_for_clast << cluster.dig(number_bots)[i-1]
      result << ["#{i - 1} - #{((i - 1) + step)}", cluster.dig(number_bots)[i-1]]
    end

    var_for_max = 0
    mas_for_clast.each do |max|

      if max > var_for_max
        var_for_max = max
      end
    end


    real_claster = (var_for_max * 100).to_f / number_bots.to_f

    {
      :visual_result => result,
      :real_cluster => real_claster
    }
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
