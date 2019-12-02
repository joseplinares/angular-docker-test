#### Stage 1
FROM node as build
WORKDIR /usr/workdir
COPY package.json package.json
RUN npm install
COPY ./ .
RUN npm run build-prod

#### Stage 2
FROM nginx
COPY ./nginx.conf /etc/nginx/nginx.conf
RUN rm -rf /usr/share/nginx/html/*
COPY --from=build /usr/workdir/dist/angular-docker-test /usr/share/nginx/html
