FROM node:18 AS build

ARG BASE_URL=/
ARG VUE_APP_API_URL=/api/
ARG NODE_ENV=production

ENV BASE_URL=$BASE_URL
ENV VUE_APP_API_URL=$VUE_APP_API_URL
ENV NODE_ENV=$NODE_ENV

ENV NODE_OPTIONS=--openssl-legacy-provider

WORKDIR /srv
COPY package.json package-lock.json ./
RUN npm clean-install
COPY . .
RUN npm run-script build

FROM nginx:1.29-alpine3.23

COPY --from=build /srv/dist/ /srv/
EXPOSE 80
