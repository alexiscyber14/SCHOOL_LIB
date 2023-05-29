<div align="center">
  <h3><b>School library</b></h3>
</div>

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
  - [🚀 Live Demo](#live-demo)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Usage](#usage)
  - [Run tests](#run-tests)
  - [Deployment](#deployment)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [❓ FAQ (OPTIONAL)](#faq)
- [📝 License](#license)

<!-- PROJECT DESCRIPTION -->

# 📖 School library <a name="about-project"></a>

**Ruby School libray Project** demonstrates the implementation of three classes in Ruby: `Person`, `Student`, and `Teacher`. These classes are designed to represent individuals in a school setting and provide various functionalities related to their attributes and permissions.


## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>


<details>
  <summary>Ruby</summary>
  <ul>
    <li><a href="https://ruby.org/">Ruby</a></li>
  </ul>
</details>


### Key Features <a name="key-features"></a>

- **Has mltiple classes used to create objects and definitions to access and updtae the objects data**
- **It uses inheritance; a design pattern that enables you to write a single piece of code that code be used by multiple classes without making duplicates of the same data in the code**
- **It uses the ruby  attr_accessor function to access objects and update their values without havingto write mutiple lines of getters and setters for the class**

<p align="right">(<a href="#readme-top">back to top</a>)</p>


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



## 💻 Getting Started <a name="getting-started"></a>

To get started with this project and have a local copy and running, follow these steps:

### Prerequisites <a name="prerequisites">

In order to run this project you need:
  
### Setup <a name="setup">

Clone this repository to your desired folder:
Example commands:

```sh
  cd my-folder
  git clone git@github.com:myaccount/my-project.git
```

### Install <a name="install">

Install this project with:
- **install Ruby on your computer**


### Usage <a name="usage">
- **To use this project content, you need to have ruby installed on you computer and must have prior knowledge in basic programming**


### Run tests <a name="run-tests">
Note:
- **More information on how to run tests on the this project will be provided later in the week: thanks!!**


### Deployment <a name="deployment">
To make your project accessible to others:
- **Create an account with github, create a public respository, and provide the link to the files and the project code base will be accessible to others**

## Authors <a name="authors">

👤 **Alexander Ssenyondo**

- GitHub: [@alexiscyber14](https://github.com/alexiscyber14)
- Instagram:[@Alexiscyber14](https://www.instagram.com/alexiscyber14/)
- LinkedIn:[@Alex_Ssenyoondo](https://www.linkedin.com/in/alex-software/)
- wellfound:[@alexiscyber14](https://angel.co/u/alexander-senyondo)

👤 **Yidnekachew Kassahun**

- GitHub: [@Yidnekachew-cmd](https://github.com/Yidnekachew-cmd)
- Twitter: [@Yidnekassahun](https://twitter.com/Yidnekassahun)
- LinkedIn: [@yidne kassahun](https://www.linkedin.com/in/yidnekachew-kassahun-2b817a24b/)


##  Contrubuting <a name="contributing"></a>
 The project is still in development but after its completed, future updates and contributions are welcome: Thank you!

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

Here are some potential future features that can be added to enhance the functionality of the classes:

- [] **Additional Attributes**: Expand the `Person` class with more attributes such as address, phone number, or email.
- [] **Methods for Student**: Implement methods in the `Student` class for submitting assignments, tracking grades, or joining extracurricular activities.
- [] **Methods for Teacher**: Add methods to the `Teacher` class for assigning grades, managing class schedules, or generating reports.
- [] **Parent Class**: Introduce a parent class to handle common attributes and behaviors shared between students and teachers.
- [] **Database Integration**: Develop database integration to store and retrieve student and teacher information.
- [] **User Interface**: Create a user interface to interact with the classes, allowing users to input data and view results.
- [] **Serialization**: Implement serialization capabilities to save and load instances of the classes.
- [] **Additional Attributes**: Expand the `Person` class with more attributes such as address, phone number, or email.
<p align="right">(<a href="#readme-top">back to top</a>)</p>


## ⭐️ Show your support <a name="support"></a>

If you like this project you can give it a ⭐️.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🙏 Acknowledgments <a name="acknowledgements"></a>
I would like to thank <a href="https://www.microverse.org/">MICROVERSE</a> for their contribution to the material used in this project.


## License
<p>This project is <a href="/LICENSE.md">MIT</a> licensed</p>
