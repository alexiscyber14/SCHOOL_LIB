require 'json'
require 'fileutils'
require_relative '../teacher'
require_relative '../students'
require_relative '../book'

module HandleData
  def check_data_files
    File.open('./data/rentals.json', 'w') unless File.exist?('./data/rentals.json')
  end

  def load_rental_data(rental)
    puts rental['date']
    data = {
      date: rental['date'],
      id: rental['id'],
      name: rental['name'],
      age: rental['age'],
      parent_permission: rental['parent_permission'],
      type: rental['type'],
      title: rental['title'],
      author: rental['author']
    }
    if rental['type'] == 'Teacher'
      data['specialization'] = rental['specialization']
    else
      data['classroom'] = rental['classroom']
    end

    data
  end

  def load_rentals
    rentals = []
    json_data = File.read('./data/rentals.json')
    unless json_data.empty?
      JSON.parse(json_data).map do |rental|
        data = load_rental_data(rental)
        rentals << data
      end
    end

    rentals
  end
end

module SaveData
  def load_rental_data(rental)
    rental_data = {
      date: rental[:date],
      id: rental[:id],
      name: rental[:name],
      age: rental[:age],
      parent_permission: rental[:parent_permission],
      type: rental[:type],
      title: rental[:title],
      author: rental[:author]
    }

    if rental[:type] == 'Teacher'
      rental_data[:specialization] = rental[:specialization]
    else
      rental_data[:classroom] = rental[:classroom]
    end
    rental_data
  end

  def save_rentals
    data = []
    @rentals.each do |rental|
      rental_data = load_rental_data(rental)
      data << rental_data
    end
    puts 'save'
    File.write('./data/rentals.json', JSON.pretty_generate(data))
  end
end
