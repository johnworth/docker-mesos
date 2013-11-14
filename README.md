docker-mesos
=============

Builds mesos docker image

    ```
    $ sudo docker build  -t <your username>/mesos .
    ```

##Master

    ```
    $ sudo docker run -d -p 5050:5050 <your username>/mesos
    ```

    It launches master by default at localhost:5050

##Slave

###Yeah I know that I need to find a better way

    1. Start a container as master.
    2. Change the name of the docker container
    ```
    # find the container
    $ sudo docker ls -a

    # change container name
    $ sudo docker link <old name found by step above> <new easy to remember name>

    ```
    3. Start slave container with the following command
    ```
    $ sudo docker run -link /<name of container> -i -t <your username>/mesos /bin/bash
    ```
    4. Find the master ip address
    ```
    $ env
    ```
    5. Use the ip address of the linked container as the --master argument

    ```
    mesos-slave --master=<ip address of linked container>:<port of linked container>
    ```



echo "--master="$MASTER_PORT |  sed 's/tcp:\/\///' | xargs mesos-slave



