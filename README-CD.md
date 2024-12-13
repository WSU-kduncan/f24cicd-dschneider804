## Part 1 - Semantic Versioning

My intention was to deploy the website for practical use; setting up things like webhooks, version tags, and a bash script. The product was never actually finished to a demonstration, but the documentation here is streamlined information for anyone who wishes to do it. 

Tags can be created and applied to existing commits on the releases tab of the repository. Remember to use [semantic versioning best practices](https://semver.org/) when writing them.

The GitHub workflow has been amended further to (or at least intend to) run when a **tag** is pushed instead of just when there's a main branch push, and tries to push images to the hub with tag data. It has a tag set of version, latest, major, and major.minor. The intention here was to conveniently stay on top of version tracking, as well as organizing things as they're made.

My Docker repository can be found [here](https://hub.docker.com/repository/docker/schneider228/schneider-ceg3120).

## Part 2 - Deployment

The EC2 instance created to run this was a T2.small machine running Ubuntu. I assigned it an elastic IP of 54.84.198.30. 

Docker can be installed here using the website's [official installation guide for Ubuntu](https://docs.docker.com/engine/install/ubuntu/). It installs with the apt repository. The install commands recommended are long, so I would copy-paste them from the website.

I made a Bash script. It's an process of updating the container when called, doing so by `pull`ing the latest image from my DockerHub repo, `kill`s and removes (`rm`) the previous container, and then starts a new one with that latest image. It's actually just on the root folder of the Ubuntu instance, called containerupdate.sh. You can see it within my repository [here](https://github.com/WSU-kduncan/f24cicd-dschneider804/blob/main/Deployment/containerupdate.sh).

It's important to install [adnahn's webhook](https://github.com/adnanh/webhook) to the instance. `sudo apt-get install webhook` does download it, although configuration afterwards is needed, especially in `hooks.json`, which needs to be pointed to have an ID and points to the Bash script for execution. The primary purpose of this was to connect event sources to trigger our workflows, and it does this efficiently.

[hooks.json](https://github.com/WSU-kduncan/f24cicd-dschneider804/blob/main/Deployment/hooks.json) is located alongside the Bash script in the root folder of the instance. In repository settings, you can create a webhook that will send a POST request to the necessary payload URL you provide it. I set just the push event to activate the webhook. The webhook service over on the instance is started and begins logging to a file with `webhook -hooks hooks.json > hook.log`

I never got to the point of putting this together, so I never had a successful test, but theoretically to test this you could just push a new commit/tag to the repository and then check the `hook.log` file to see if anything came in. Then check to see if it triggered the Bash script as intended by going to see if the container is running and up-to-date. Docker has its own `logs` command to look at to see if anything happened.

You might wanna have this service on startup. This can be done using a systemd file that essentially makes the system treat it like a network service or something that starts up on boot before a GUI is seen with `multi-user.target`. Within the instance it's located in /etc/systemd/system, the file I wrote is [here](https://github.com/WSU-kduncan/f24cicd-dschneider804/blob/main/Deployment/webhook.service).

## References
Besides what I hyperlinked in this document, I used several websites' documentations and online resources to figure out what to do here. Particularly helpful ones, and ones anyone picking this up may want to learn from are as follows:
[Medium article on GitHub webhooks](https://levelup.gitconnected.com/automated-deployment-using-docker-github-actions-and-webhooks-54018fc12e32)
[Linux handbook guide for systemd files](https://linuxhandbook.com/create-systemd-services/)
[DockerDocs for GitHub action stuff](https://docs.docker.com/build/ci/github-actions/manage-tags-labels/)
