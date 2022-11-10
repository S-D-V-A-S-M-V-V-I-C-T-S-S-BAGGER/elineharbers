# STEP 0: Build the project
FROM klakegg/hugo:0.76.5-alpine AS build

RUN mkdir -p /tmp/build/elineharbers.nl
COPY . /tmp/build/elineharbers.nl

WORKDIR /tmp/build/elineharbers.nl
RUN hugo
RUN cp -R netlify/ public/admin/

# STEP 1: Serve the project's build over HTTP
FROM nginx:latest
LABEL description="A docker container for elineharbers.nl"
LABEL maintainer="info@waddl.nl"
LABEL version="0.1.0"

COPY --from=build /tmp/build/elineharbers.nl/public /usr/share/nginx/html
