# Part 1 - Docker-ize it

## CI Project Overview
This project is an attempt to build and configure an Angular website, containerized and deployed using Docker. Containerizing like this is really convenient; I can ship the application into a scalable, accessible, and consistent place.


## Containerizing an Application


On Windows, Docker is just downloadable from the website. Be wary that it will require a restart, and it tries to integrate with WSL Ubuntu.
<br>

The blueprint for a container is a `Dockerfile`.

<br>
The `Dockerfile` in this repository first starts with node.js based on Alpine Linux,

then defines the default app directory with `WORKDIR`,

it copies in the site data with `COPY`,

and installing `@angular/cli` gives the global command line dependency for Angular, with `RUN npm install` giving the Angular application dependencies.

Finally, the ``CMD`` line runs the Angular host for external access. Right now, the `0.0.0.0` line has it listen on all network interfaces.

<br>

Build the Dockerfile by going to its directory and using `docker build -t`.

<br>

You run the container with `docter run -p HOST:CONTAINER IMAGENAME` where `HOST` is the address on the port, and `CONTAINER` is the port on the container. -d for detach is also a particularly useful flag to run the container in the background.

<br>

For example, to run my `angular-bird container` on port 3000 with localhost, the command would be `docker run -d -p 127.0.0.1:3000:3000 angular_bird`. I could view this by going to [https://localhost:3000](https://localhost:3000)


## Working with DockerHub

The DockerHub website makes it pretty easy to create a public repository. It's in the top-right corner of the Repositories tab, and it'll ask you for a namespace (probably just your own account), a repository name, a short description, and its visibility.

<br>

Docker's CLI has a `docker login` command. It'll ask for your DockerHub username and password there. There are other authentication methods, like a personal access token, which will be gone in to later in this document.

<br>

To push a container image to DockerHub, you'd first need to have the image tagged with your username and repository name. If it's not, tag it with `docker tag USERNAME/REPOSITORY:<TagName>`. To push it, the command is pretty much the same format in push form: `docker push USERNAME/REPOSITORY:<TagName>`

<br>

My DockerHub repository can be found here: https://hub.docker.com/repository/docker/schneider228/schneider-ceg3120/general
<br>

# Part 2 - GitHub Actions and DockerHub

## Configuring Github Secrets

You can set GitHub secrets by going to the settings of the repository. On the security tab, you can find "secrets and variables," and add repository secrets.

I set the secrets DOCKER_USERNAME and DOCKER_TOKEN, containing my username and login token respectively.

## Behavior of GitHub Workflow
The GitHub workflow script intends to build and push the docker image to DockerHub. It also has to log in in order to push. It's supposed to trigger on any pushes to the main branch.

It can be found [HERE](.github/workflows/docker.yml)

<br>

If a user wanted to duplicate my project, they'd need their own project-specific details for their own DockerHub account, get their own login token and create the secrets, and update some things in the workflow script to their own repository. If they have different site files than I do, there would need to be some replacements in the Dockerfile. Other than those project-specific things, this project is general enough.

