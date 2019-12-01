#### Stage 1
FROM node as build
ARG ARG_API_URL=localhost
ENV API_URL=$ARG_API_URL
COPY ./package.json /usr/workdir/
WORKDIR /usr/workdir
RUN npm install
COPY ./ /usr/workdir
RUN npm run build-prod

#### Stage 2
FROM nginx
COPY ./nginx.conf /etc/nginx/nginx.conf
RUN rm -rf /usr/share/nginx/html/*
COPY --from=build /usr/workdir/dist/angular-docker-test /usr/share/nginx/html
