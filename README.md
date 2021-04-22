# Infrastructure Engineer/DevOps challenge

This repository contains an unfinished python application. Your high level goal is to prepare this application for deployment.

To do that you will need to:

1. Fix any application errors and correct the output
2. Ensure the tests run
3. Create a Dockerfile for the application
4. Create a Dockerfile for the database backend (Mongo)
5. Create a docker-compose file capable of running the app and db together
6. Build a CI/CD pipeline for running tests
7. Create deployment configuration for Kubernetes (deployment, service, ingress, and secrets)


Each of the above goals is detailed below.

### Fix any application errors and correct the output

The app has two exposed endpoints, both of which return a list

* `/api/v1/records` - Returns a list of records
* `/api/v1/records/{id}` - Returns a list with a single record that matches the `id` parameter

The second endpoint `/api/v1/records/{id}` should return a *single* object and not a list. Please
correct the application to reflect this. In the case that no record is found, update the endpoint
to return an HTTP 204 status code.

### Ensure the tests run

The tests are written using python's built in unittest package. Ensure these tests
run without failure in multiple python versions using `tox` (`pip install tox`).

    Note there is a tox.ini file in the repo already

### Create a Dockerfile for the application

Create a Dockerfile for packaging the main python flask application, taking into consideration that
* The resulting image should be as small as possible on disk
* This application will be running in "production" (eg. Is running a flask application directly appropriate?)

### Create a Dockerfile for the database backend

The backend here is Mongo db, for which there are existing public images to pull from. The additional
step here is to ensure the initial data is _pre-loaded_ when the container starts up.

### Create a docker-compose file capable of running the app and db together

Given the two Dockerfiles (and presumably local images you've now built) create a docker-compose
configuration that:
* Runs both containers
* Sets appropriate environment variables
* Configures networking such that the application can reach the database backend

### Create a CI/CD pipeline for running tests

Now that images build locally, the tests run, and your containers can talk to each other when
run via docker-compose, it's time to create a CI/CD config. Create a configuration (consider
circle, travis ci, github, all of these have a free tier) for this that runs the tests.

Things to consider:

* Will you run the tests on every push?
* Which branches should you run tests for?
* Tags?

### Create deployment configuration for Kubernetes

Create valid configuration file(s) for a Kubernetes deployment, secrets, service, and ingress.
You can use a higher level tool (eg. Helm) if you prefer.

Assume: Your images are stored on Dockerhub

---
## Final notes

    You do not have to perfectly execute every one of these stages. However, be ready to talk
    through them at length and discuss any issues, your decisions, and implementation.
  
    If a problem section feels unclear or incorrect, please create a github issue and optionally
    a pull request.
