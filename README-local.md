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

# Source - https://stackoverflow.com/a/2419270
# Posted by Ian Clelland, modified by community. See post 'Timeline' for change history
# Retrieved 2026-05-15, License - CC BY-SA 4.0

git add -A && git commit -m "Your Message"

