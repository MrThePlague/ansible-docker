# ansible-docker 
## Ansible Control Node
Master Dockerfile for a Docker image which gathers all of the dependencies to create a network-centric Ansible control node, while maintaining explicitly version-controlled packages. By performing version control on the tools used alongside Ansible playbooks, it can be assured that future releases of Ansible or the accompanying libraries do not break existing playbooks. The purpose of this project is to maintain the master Dockerfile; however, the intended usage would be for users to consume the prebuilt image from a container registry.

The following key packages are included:

* Ansible - v2.5.5.0
* NAPALM - v2.3.1
* NAPALM-Ansible - v0.9.1
* Netmiko - v2.1.1

# Building the Docker Image
Initially building the container image from the Dockerfile is not required for the use of this container image; however, the initial build is performed as follows:

* Clone the Git repository `git clone https://github.com/MrThePlague/ansible-docker.git`
* Change to the `ansible-docker` directory `cd ansible-docker`
* Use the Docker build command to build the container from the Dockerfile `docker build -t <name the image> ./`

To validate that the image has been created, you can list your current local images.

eg:

    $ docker build -t mrtheplague/ansible-docker ./
    $ docker images
    REPOSITORY                   TAG                 IMAGE ID            CREATED              SIZE
    mrtheplague/ansible-docker   latest              a1511ef40f0a        About a minute ago   286MB
    alpine                       3.7                 3fd9065eaf02        5 months ago         4.15MB

# Using the Docker Container
Once the Docker image file has been pulled, a container can be instantiated by performing the `docker run` command. Docker will mount a folder into the container, allowing you to run a local playbook from within the container instance:

* Clone the desired Ansible playbook which you would like to run using the container
* Change to the playbook's directory `cd <repository>`
* Run the image, mounting the local folder into the container `docker run -v </host/directory:/container/directory> -i -t <image name> /bin/sh`
* To confirm Ansible is functioning, use the command `ansible --version`

eg:

    $ docker run -v /full/path/to/repository:/tmp -i -t mrtheplague/ansible-docker:latest /bin/sh
    $ ansible --version
    ansible 2.5.5
    config file = None
    configured module search path = [u'/root/.ansible/plugins/modules', u'/usr/share/ansible/plugins/modules']
    ansible python module location = /usr/lib/python2.7/site-packages/ansible
    executable location = /usr/bin/ansible
    python version = 2.7.14 (default, Dec 14 2017, 15:51:29) [GCC 6.4.0]