FROM golang:1.25-alpine AS build

WORKDIR /srv
COPY go.mod go.sum ./
RUN go mod download
COPY . ./
RUN go build -o ./backend-app ./cmd/api

FROM alpine:3.22

COPY --from=build /srv/backend-app /usr/local/bin/
CMD ["backend-app"]
EXPOSE 8081
