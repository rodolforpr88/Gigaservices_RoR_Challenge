# General

- This app is a challenge for Ruby on Rails Developer Pleno for Gigaservices

## Required - about the project
 The project will be a web application composed of the items below:

 1 - A list of users from the API https://randomuser.me/api/ must be imported, saving the result in the database

    Use the following parameters in the query:
      - format=json
      - results=30
      - inc=gender,name,email,Picture
      - nat=br
      - seed=giga

    API images must be stored locally

 2 - Page for consultation by name of imported users

    Use pagination (10~15 records per page)
    Display the previously saved user image in the query

 ### Rules

    - Using Ruby on Rails
    - Use Postgres/MySQL database
    - It is not necessary to require authentication of users who will use the application

### Extras (will be highly appreciated)

    - Use some library/framework for the layout (bootstrap)
    - Use libraries (gems) to take care of pagination and image upload (Kaminari, Carrierwave, etc)
    - Automated tests

 ### Points that will be evaluated:

    - Fulfillment of the proposed objectives
    - Concern with code organization/standardization.
    - Code quality.

 ### Delivery:

    - The delivery of this test must be done via Github. Share your repository with us once everything is ready.
    - We expect to receive a final project report with information on the total effort spent on carrying out the activities
      and your considerations on the activities carried out (challenges and difficulties encountered and solutions implemented)
    - It will also be well evaluated if the project is delivered operationally, published on a server (eg Heroku or other)

### Final Considerations:

    - Try to start the project from “zero” without taking advantage of similar ready-made projects.

# Tools and versions

- Ruby 3.1.2
- Rails 7.0.4
- Yarn 1.22.19 or Npm y9.1.2

# Gems used

- rspec-rails
- factory_bot_rails
- faker
- rails_controller_testing
- pagy
- pry-byebug

# Feedback from company?

- :thumbsdown:

Feel free to contact me and give me a feedback.
