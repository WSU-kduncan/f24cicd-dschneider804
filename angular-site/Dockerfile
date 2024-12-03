FROM node:alpine
WORKDIR /usr/src/app
COPY ./angular-bird/
RUN npm install -g @angular/cli
RUN npm install
COPY --from=build /app/dist/<project-name> /usr/share/nginx/html
