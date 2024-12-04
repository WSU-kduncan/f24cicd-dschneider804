This project is an attempt to build and configure an Angular website, containerized and deployed using Docker. Containerizing like this is really convenient; I can ship the application into a scalable, accessible, and consistent place.

<br>
On Windows, Docker is just downloadable from the website. Be wary that it will require a restart, and it tries to integrate with WSL Ubuntu.
<br>

To build & configure a container, create a `Dockerfile`. Build the Dockerfile by going to its directory and using `docker build -t`.

<br>
The `Dockerfile` in this repository first starts with node.js based on Alpine Linux,
then defines the default app directory with `WORKDIR`,
it copies in the site data with `COPY`,
and installing `@angular/cli` gives the global command line dependency for Angular, with `RUN npm install` giving the Angular application dependencies.
Finally, the ``CMD`` line runs the Angular host for external access. Right now, the `0.0.0.0` line simply means localhost.


