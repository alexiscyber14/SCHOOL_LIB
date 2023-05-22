# Ruby Challenge: Person, Student, and Teacher Classes

This project demonstrates the implementation of three classes in Ruby: `Person`, `Student`, and `Teacher`. These classes are designed to represent individuals in a school setting and provide various functionalities related to their attributes and permissions.

## Language Used

The project is implemented in Ruby.

## Getting Started

To get started with this project, follow these steps:

1. Clone the repository to your local machine.
2. Make sure you have Ruby installed on your system.
3. Open the project in your preferred code editor.

## Classes

### Person

The `Person` class serves as the base class for both students and teachers. It has the following instance variables:

- `@id`: The unique identifier for each person.
- `@name`: The name of the person (default value: "Unknown").
- `@age`: The age of the person.
- `@parent_permission`: A boolean indicating whether the person has parent permission (default value: true).

The `Person` class provides the following functionality:

- **Constructor**: It initializes the `Person` object with the specified `id`, `age`, `name`, and `parent_permission` (optional) parameters.
- **Getters**: It provides getter methods to access the `id`, `name`, and `age` instance variables.
- **Setters**: It provides setter methods to modify the `name` and `age` instance variables.
- **Private Method of_age?**: This private method returns true if the person's age is greater than or equal to 18, and false otherwise.
- **Public Method can_use_services?**: This method returns true if the person is of age or if they have permission from their parents.

### Student

The `Student` class inherits from the `Person` class and adds an additional instance variable:

- `@classroom`: The classroom in which the student is enrolled.

The `Student` class provides the following additional functionality:

- **Constructor**: It extends the parent class's constructor by including an additional parameter to specify the `classroom`.
- **Method play_hooky**: This method returns the string "¯\\(ツ)/¯", indicating that the student is playing hooky.

### Teacher

The `Teacher` class also inherits from the `Person` class and adds an additional instance variable:

- `@specialization`: The area of specialization for the teacher.

The `Teacher` class provides the following additional functionality:

- **Constructor**: It extends the parent class's constructor by including an additional parameter to specify the `specialization`.
- **Override can_use_services?**: This method overrides the parent class's `can_use_services?` method and always returns true, indicating that the teacher can use all services.


## Future Features

Here are some potential future features that can be added to enhance the functionality of the classes:

- **Additional Attributes**: Expand the `Person` class with more attributes such as address, phone number, or email.
- **Methods for Student**: Implement methods in the `Student` class for submitting assignments, tracking grades, or joining extracurricular activities.
- **Methods for Teacher**: Add methods to the `Teacher` class for assigning grades, managing class schedules, or generating reports.
- **Parent Class**: Introduce a parent class to handle common attributes and behaviors shared between students and teachers.
- **Database Integration**: Develop database integration to store and retrieve student and teacher information.
- **User Interface**: Create a user interface to interact with the classes, allowing users to input data and view results.
- **Serialization**: Implement serialization capabilities to save and load instances of the classes.

## Author

This project was created by [Alexander Ssenyondo].

- GitHub: [@alexiscyber14](https://github.com/alexiscyber14)
- Instagram:[@Alexiscyber14](https://www.instagram.com/alexiscyber14/)
- LinkedIn:[@Alex_Ssenyoondo](https://www.linkedin.com/in/alex-software/)
- wellfound:[@alexiscyber14](https://angel.co/u/alexander-senyondo)

## License

This project is licensed under the [MIT License](LICENSE).
