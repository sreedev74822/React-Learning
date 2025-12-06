to check docker version
  docker --version
to check running container
 docker ps
to check running container and stopped
 docker ps -a
to pull image
  docker pull node:20
  docker pull python:3.12
to run a container
  docker run -it --name react-dev -p 3000:3000 -v %cd%:/app --user node node:20 bash
  docker run -it --name python-dev -v %cd%:/app --user root python:3.12 bash
  -it -> interactive terminal
  --name react-dev -> assign a custom name to container
  -p 3000:3000 -> map container port 3000 to host port 3000
  -v %cd%:/app -> mount current Windows folder into /app in container
  --user node -> run container as non-root node user (fixes permissions)
  node:20 -> image to use
  bash -> open shell inside container
  inside container
   cd /app
  inside app
   npx create-react-app my-app
   cd my-app
   npm start
to restart existing container
  docker start -ai react-dev
to remove container and image
  docker rm react-dev         # remove container
docker rmi node:20          # remove image
to build docker image for react app
 docker build -t <name>
 docker build -t my-vite-app:latest .
to run locally and test
 docker run -p 8080:80 my-vite-app:latest
docker tag my-vite-app:latest sreedev74822/my-vite:latest
to push to docker repo
 docker push sreedev74822/my-vite:latest
to run detched mode in ec2
 docker run -d -p 80:80 --name my-vite-container sreedev74822/my-vite:latest


