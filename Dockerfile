# Base image
FROM node:17-alpine3.14

# Working directory
WORKDIR /app

# copy the local folder into the contanier
COPY app/ ./

# copy the package.json file into the container
COPY app/package.json ./

# install with npm
RUN npm install

# Install vue CLI
RUN npm install -g @vue/cli

# Open the port 8080 for container
EXPOSE 8080


# Run the vuejs application
CMD ["npm", "run", "serve"]
