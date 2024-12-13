## Part 1 - Semantic Versioning

My intention was to deploy the website for practical use; setting up things like webhooks, version tags, and a bash script. The product was never actually finished to a demonstration, but the documentation here is streamlined information for anyone who wishes to do it. 

Tags can be created and applied to existing commits on the releases tab of the repository. Remember to use [semantic versioning best practices](https://semver.org/) when writing them.

The GitHub workflow has been amended further to (or at least intend to) run when a **tag** is pushed instead of just when there's a main branch push, and tries to push images to the hub with tag data. It has a tag set of version, latest, major, and major.minor. The intention here was to conveniently stay on top of version tracking, as well as organizing things as they're made.

My Docker repository can be found [here](https://hub.docker.com/repository/docker/schneider228/schneider-ceg3120)
