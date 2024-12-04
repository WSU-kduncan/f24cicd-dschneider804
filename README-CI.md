## CI Project Overview
This project is an attempt to build and configure an Angular website, containerized and deployed using Docker. Containerizing like this is really convenient; I can ship the application into a scalable, accessible, and consistent place.

<br>

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

<br>

## Working with DockerHub


