require_relative 'F:\RubyOnRailsProjects\test_diplom\app\results\Module_Data.rb'
include ResultsClusterModule
include ResultsSeparatedModule
include ResultsMazeModule

module CalculationModule

  def calculation_clasterization(number_bots, type_area_clast)
    var_for_max = 0

    # Знаходження максимального значення кластеризації
    type_area_clast.each do |max|

      if max > var_for_max
        var_for_max = max
      end
    end

    # Обчислення ступеню кластеризації, у відсотках від загальної кількості ботів
    (var_for_max * 100).to_f / number_bots.to_f
  end

  def clasterization_maze(number_bots)
    average_clast = []

    # Цикл перебору кожного спостереження для лабіринту
    # (було проведено по три спостереження)
    active_cluster_maze.dig(number_bots).each do |subarr|
      subarr.each_with_index do |num, idx|
        # Ініціалізуація значення кластеризації для поточного спостереження,
        # якщо його ще не було встановлено
        average_clast[idx] ||= 0
        # Додавання значення кластеризації для поточного спостереження
        # до поточного середнього для цього спостереження
        average_clast[idx] += num.to_f / 3.0
      end
    end

    # Масив середніх значень кластеризації
    average_clast
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

    # Якщо на старті обраного проміжку вже є боти, які вийшли за лабіринту,
    # то в результуючий масив записуються значення часу перебування ботів у лабіринті
    # стільки разів, скільки вийшло ботів
    if mas[start] > 0
      result += [start] * mas[start]
    end

    # Цикл заповнення результуючого масиву
    (start).step(finish - 1) do |i|
      # Якщо значення ботів, які вийшли за лабіринту змінилося,
      # воно записується до масиву
      if previous_value && mas[i] != previous_value
        if mas[i] - mas[i - 1] == 1
          result << i
        else
          result.concat(Array.new(mas[i] - mas[i - 1]) { i })
        end
      end
      # Оновилення попереднього значення поточним значенням виходу ботів з лабіринту
      previous_value = mas[i]
    end

    # Якщо при досягненні завершення часового проміжку кількість елементів результуючого
    # масиву не дорівнює кількості ботів у системі (вхідний параметр системи),
    # тоді значення, які залишилося заповнюють фінальною точкою проміжку
    while result.length != number_bots
      result << finish
    end

    # Обчислення середнього часу перебування ботів у лабіринті
    result.empty? ? 0 : result.sum.to_f / result.length.to_f
  end

  # Час перебування кожного з ботів у лабіринті для кожного спостереження
=begin
  def result_observation_time_stay(number_bots, start, finish)
    result_observations = []

    (0..number_exit_bots.dig(number_bots).length - 1).each { |i|
      result_observations << time_bots_maze_stay(number_exit_bots.dig(number_bots)[i], number_bots, start, finish)
    }
    result_observations
  end
=end

  # гістогранме представлення у відсотках
  def percentage_histogram_maze(number_bots)
    averages = []
    average_clust = []

    number_exit_bots.dig(number_bots).each do |subarr|
      subarr.each_with_index do |num, idx|
        averages[idx] ||= 0
        averages[idx] += (num.to_f / 3.0) * 100 / number_bots

        average_clust[idx] ||= 0
        average_clust[idx] += num.to_f / 3.0
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
  # Час виходу ботів з лабіринту + середнє квадратичне відхилення
  def time_bots_maze_out(mas, start, finish)
    result = []
    previous_value = nil

    # Якщо у початковий момент часу інтервалу є боти, які виходять з лабіринту,
    # додаються відповідні значення часу до масиву результатів, повторюючи їх
    # стільки разів, скільки ботів вийшло з лабіринту
    if mas[start] > 0
      result += [start + 1] * mas[start]
    end

    # Цикл заповнення результуючого масиву
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

    # result_mas - масив значень часу виходу ботів з лабіринту
    # final_result - середній час виходу ботів з лабіринту
    {
      :result_mas => result.empty? ? 0 : result,
      :final_result => result.empty? ? 0 : result.sum.to_f / result.length.to_f
    }
  end

  def res_observation_deviation_mean(number_bots, start, finish, function)
    exit_bots = number_exit_bots.dig(number_bots)
    exit_bots_length = exit_bots.length

    if function == "exit"
      # Середнє значення часу виходу ботів
      result_observations = exit_bots.map { |bot| time_bots_maze_out(bot, start, finish).dig(:final_result) }.sum.to_f / 3.0
      # Розрахунок відхилення за кожним спостереженням
      result_deviation = exit_bots.map { |bot| (time_bots_maze_out(bot, start, finish).dig(:final_result) - result_observations).abs.round(5) }
    elsif function == "stay"
      # Середнє значення часу перебування ботів
      result_observations = exit_bots.map { |bot| time_bots_maze_stay(bot, number_bots, start, finish) }.sum.to_f / 3.0
      # Розрахунок відхилення за кожним спостереженням
      result_deviation = exit_bots.map { |bot| (time_bots_maze_stay(bot, number_bots, start, finish) - result_observations).abs.round(5) }
    end

    # Середнє квадратичне відхилення
    result_sum_deviation = result_deviation.map { |elem| elem ** 2 }.sum
    mean_square_deviation = Math.sqrt(result_sum_deviation / exit_bots_length)

    {
      :average_result_observations => result_observations.round(4),
      :result_deviation => result_deviation,
      :mean_square_deviation => mean_square_deviation.round(4)
    }
  end

  # Числові дані кількості ботів, що вийшли з лабіринту
  def count_bots_maze_out_obs(number_bots, finish)
    mas = number_exit_bots.dig(number_bots)
    result = []
    result_dev = []

    # Обчислення відсотоку ботів, які вийшли з лабіринту
    # для кожного спостереження
    (0..mas.length - 1).each do |i|
      result << ((mas[i][finish - 1]) * 100) / number_bots
    end

    # Підрахування середнього значення
    average = result.sum.to_f / result.length.to_f

    # Відхилення від середнього значення
    (0..result.length - 1).each do |i|
      result_dev << (average - result[i]).abs.round(5)
    end

    # Середнє квадратичне відхилення
    result_sum_deviation = result_dev.map { |elem| elem ** 2 }.sum
    mean_square_deviation = Math.sqrt(result_sum_deviation / mas.length)

    # Хеш отриманих результатів
    {
      :count_all_observations => result,
      :average_result_observations => average.round(5),
      :result_deviation => result_dev,
      :mean_square_deviation => mean_square_deviation.round(5)
    }
  end

  # Числові дані виходу перших ботів з лабіринту
  def first_bot_maze_out(number_bots, start, finish)
    result_first_exit = []
    result_dev = []

    # Обчислення часу виходу першого боту з лабіринту
    # для кожного спостереження
    (0..number_exit_bots.dig(number_bots).length - 1).each { |i|
      result_first_exit << time_bots_maze_out(number_exit_bots.dig(number_bots)[i], start, finish).dig(:result_mas)[0]
    }

    # Підрахування середнього значення
    average = (result_first_exit.sum.to_f / result_first_exit.length.to_f).round(5)

    # Відхилення від середнього значення
    (0..result_first_exit.length - 1).each do |i|
      result_dev << (average - result_first_exit[i]).abs.round(5)
    end

    # Середнє квадратичне відхилення
    result_sum_deviation = result_dev.map { |elem| elem ** 2 }.sum
    mean_square_deviation = Math.sqrt(result_sum_deviation / result_first_exit.length)

    # Хеш отриманих результатів
    {
      :count_all_observations => result_first_exit,
      :average_result_observations => average.round(5),
      :result_deviation => result_dev,
      :mean_square_deviation => mean_square_deviation.round(5)
    }
  end
end
