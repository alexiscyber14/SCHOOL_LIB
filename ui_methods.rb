require './logic_classes'

def handle_choice(choice, app, choices)
  if choices.key?(choice)
    method_name = choices[choice]
    if UIMethods.respond_to?(method_name)
      UIMethods.send(method_name, app)
    else
      send(method_name, app)
    end
  else
    puts 'Invalid choice. Please try again.'
  end
end

def list_books(app)
  app.list_books
end

def create_book(app)
  app.create_book
end

def create_rental(app)
  app.create_rental
end

def list_rentals_for_person(app)
  app.list_rentals_for_person
end

def quit(_app)
  puts 'Thanks for using the app!'
end
