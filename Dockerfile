FROM klakegg/hugo:0.81.0-ext-alpine AS builder

RUN mkdir /app
WORKDIR /app

COPY . /app

RUN hugo


FROM nginx:latest

COPY --from=builder /app/public /usr/share/nginx/html
