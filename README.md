# Testing repo for https://github.com/jaredwray/keyv/issues/516

By https://github.com/afreemanio


Forked from:
https://github.com/jsynowiec/node-typescript-boilerplate


Check info.md for commands I ran to get the repo to this state.


# Installation and running
- Clone the repo
- Copy .env.example to .env, fill the values if you'd like
- Run the following commands to install
```
npm install
```
- Run the following commands to run on OS with debugger
```
npm run debug
```
- Run the following commands to build and run on OS
```
npm run build
npm run start
```
- Run the following commands to build and run on docker
```
docker compose build
docker compose up
```


# The problem
For some reason, I find keyv rewriting URLs to incorrect values

172.17.0.1 is being rewritten to 172.20.0.1

This is supposed to be the docker host IP, so this is needed for my own use
case.

This works on prisma, but not on keyv for some reason. 
Both using the same mysql db.

Works for keyv mongodb.


In the env file example, you will find an example using host.docker.internal
The docker compose file should map this to the docker host IP.

When you run the docker container, and do `cat /etc/hosts`, 
host.docker.internal maps to 172.17.0.1 (the correct docker host IP),
but when you run keyv, you will find the URL translated to:
172.20.0.1















