#### Stage 1
FROM node as build
# WORKDIR /usr/workdir
# COPY package.json package.json
# RUN npm install
# COPY ./ .
# RUN npm run build-prod

#### Stage 2
# FROM nginx
# COPY ./nginx.conf /etc/nginx/nginx.conf
# RUN rm -rf /usr/share/nginx/html/*
# COPY --from=build /usr/workdir/dist/angular-docker-test /usr/share/nginx/html

ARG some_variable_name
# or with a hard-coded default:
#ARG some_variable_name=default_value

RUN echo "Oh dang look at that $some_variable_name"
# you could also use braces - ${some_variable_name}
