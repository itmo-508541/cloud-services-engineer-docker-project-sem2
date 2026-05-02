FROM node:22 AS build

WORKDIR /srv
COPY package.json package-lock.json ./
RUN npm clean-install
COPY . .
RUN NODE_OPTIONS=--openssl-legacy-provider npm run-script build

FROM nginx:1.29-alpine3.23

COPY --from=build /srv/dist/ /usr/share/nginx/html/momo-store/
EXPOSE 80
