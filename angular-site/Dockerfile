FROM node:alpine
WORKDIR /usr/src/app
COPY ./angular-bird/
RUN npm install -g @angular/cli && npm install && ng build --prod
FROM nginx:alpine
COPY --from=build /app/dist/<project-name> /usr/share/nginx/html
