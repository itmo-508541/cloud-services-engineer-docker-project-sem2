FROM golang:1.25-alpine AS build

WORKDIR /srv
COPY go.mod go.sum ./
RUN go mod download
COPY . ./
RUN go build -o ./backend-app ./cmd/api

FROM alpine:3.22
ARG UID=1001

COPY --from=build /srv/backend-app /usr/local/bin/
RUN apk add --no-cache curl \
        && adduser -S -u ${UID} -G www-data www-data

USER www-data
CMD ["backend-app"]
EXPOSE 8081
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=5 CMD curl -fsS http://127.0.0.1:8081/health || exit 1
