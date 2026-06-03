Keywords
docker
wsprdaemon
radiod
ka9q-radio
ubersdr
libfobos
fobos
rx888
wspr

Step 1. Create a mini-app or install libfobos on ubuntu:24.04
Step 2. Dockerize to <adding_fobos>
Step 3. docker exec -ti <adding_fobos>
Step 4. Verify setup

Preparation.
Step 1. Think about folder structure in the source folder and the github repository
Look at example from ka9q-radio forked in ubersdr (simple)
-docker
	Dockerfile
	docker-compose.yml
-src
	all for libfobos
-(this is the root /)
	docker.sh

Build hierarchy (verify my understanding)

docker-compose.yml
uses/calls Dockerfile
calls docker.sh

I already built a working libfobos in snow

Image hierarchy
ubuntu:24.04 as base for <adding_fobos>
creates image in my own github repo
<adding_fobos_image>
adding_fobos_image as base for <adding_radiod>

save used commands in Dockerfile

Step 5. Replace use of a .sh by a Dockerfile
works in /fobos/sand/ and by running --privileged it also has access to the fobos SDR on the usb port
sand@FOBOS:~/uberfobos$ docker buildx build -t libfob-test .
docker run -it --privileged --name fobtest-3 libfob-test

This working version shows that my 2.3.1 libfobos repo shows more Fobos SDR data from ./fobos_devinfo or ./fobos_recorder than the later RigExpert version of their libfobos library 2.4.1
I will post 2 versions of my Dockerfile to easily experiment with this : Dockerfile-231 and Dockerfile-241

Step 6. From /bin/bash prompt install radiod the normal way and see if this works
Step 7. Create docker-compose.yml to docker compose up a working setup directly running the fobos test script ./fobos_devinfo
Step 8. Integrate the libfobos in front of the radiod-ubersdr Dockerfile, might need some tweaks in the original radiod-ubersdr Dockerfile
