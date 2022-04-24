1. Check if docker and docker-compose are installed:
docker version
docker-compose version

2. Pull the specified docker images:

docker pull infracloudio/csvserver:latest
docker pull prom/prometheus:v2.22.0

3. Clone the specified repo:
git clone https://github.com/infracloudio/csvserver.git

4. List the pulled docker images:
docker images

5. Run the docker container:
docker run  infracloudio/csvserver:latest
docker run -it infracloudio/csvserver:latest

6. Check if the docker container is running or not.
docker ps

7. If the docker container is not running, check the status
docker ps -a

8. Check the logs and see what is the error:

docker logs <Container id>
2021/09/21 08:21:37 error while reading the file "/csvserver/inputdata": open /csvserver/inputdata: no such file or directory

9. Create a shell script to create the inputFile
#!/bin/bash
echo > "inputFile.txt"
for ((i=0;i<10;i++))
do
        printf "$i, $RANDOM\n" >> inputFile.txt
done

10. Run the cotainer by mouting the inputfile path
docker run -d -i -v /home/gagan/csvserver/solution/inputFile.txt:/csvserver/inputdata infracloudio/csvserver:latest

12. Get into the container
docker exec -it <container-id> bash

13. Check the port
netstat -tulnp
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
tcp6       0      0 :::9300                 :::*                    LISTEN      1/csvserver

14. Stop the running container
docker stop <container-id>

15. Run the container and specifying the environment variable
docker run -d -i -v /home/gagan/csvserver/solution/inputFile.txt:/csvserver/inputdata -p 9393:9300 -e CSVSERVER_BORDER='Orange' infracloudio/csvserver:latest
