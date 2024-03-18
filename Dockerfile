FROM node:18.19.0

# env variables
ENV LOCAL_PORT 1801
ENV VITE_SW_PROXY_TARGET "http://192.168.3.186:12800"

#   create configuration directory
RUN mkdir /etc/denetwork/

#   create a working directory inside the container
WORKDIR /usr/src/app

#   copy the local package.json to the container
COPY package.json ./

#   install project dependencies
RUN npm install

#   copies all files in the current directory into the container (except those specified in .dockerignore)
COPY . .

#   expose the ports used by the application
EXPOSE ${LOCAL_PORT}

#   run application inside container
#CMD [ "vite" ]
CMD [ "npm", "run", "dev" ]
