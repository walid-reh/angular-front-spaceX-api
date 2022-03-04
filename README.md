# vuejs-front-spaceX-api

## About the Project

- A frontend application using VueJs with Space X API.
- The application use the Space X API to fetch data about capsules and launches.

## Authors of the project

- Jonathan LUMINUKU
- Amer CHERNI
- Walid REHIOUI

### Dependencies and prerequisites

- [Docker](https://www.docker.com/)

### Used image

- [node](https://hub.docker.com/_/node)

### Commands to launching the application

- If first time to start application:
  docker-compose up --build
  (please make sure to choose the version 2 of VueJs which is compatible with used vuetify library)
- else:
  docker-compose up

### How the project was initialised

- This project was initialized using docker via the following commands:

  docker-compose run vue vue create .

- Use the following command to add vuetify plugins

docker-compose run vue vue add vuetify

- Launch the application and build dependencies

docker-compose up --build


### Usage

- Access to localhost with port 8080 : http://localhost:8080 

### Versioning

This project uses [Semantic Versioning](http://semver.org/). For a list of available versions, see the [repository tag list](https://github.com/your/project/tags).
