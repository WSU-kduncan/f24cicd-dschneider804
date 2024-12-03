FROM node:18-alpine AS build
WORKDIR /app
COPY ./angular-site /app
RUN npm install -g @angular/cli && npm install && ng build --prod
FROM nginx:alpine
COPY --from=build /app/dist/<project-name> /usr/share/nginx/html
