require 'json'

module Files 
    def check_files_existence
        create_file_if_not_exist('./data/rentals.json', [])
        create_file_if_not_exist('./data/people.json', [])
        create_file_if_not_exist('./data/books.json', [])
    end
      
    def create_file_if_not_exist(file_name, default_content)
        unless File.exist?(file_name)
          File.open(file_name, 'w') do |file|
            file.write(JSON.generate(default_content))
          end
        end
    end
end