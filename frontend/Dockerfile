FROM node:22-alpine AS build

ARG BASE_URL=/
ARG VUE_APP_API_URL=/api/
ARG NODE_ENV=development

ENV BASE_URL=$BASE_URL
ENV VUE_APP_API_URL=$VUE_APP_API_URL
ENV NODE_ENV=$NODE_ENV

ENV NODE_OPTIONS=--openssl-legacy-provider

WORKDIR /srv
COPY package.json package-lock.json ./
RUN npm clean-install --no-fund
COPY . .
RUN npm run-script build

FROM nginx:1.28.3-alpine
ARG UID=1001

COPY --from=build /srv/dist/ /srv/

RUN adduser -S -u ${UID} -G nginx www-data

USER www-data
EXPOSE 80
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=5 CMD nginx -t || exit 1
