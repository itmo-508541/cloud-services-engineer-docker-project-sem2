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

RUN apk add --no-cache curl
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=5 CMD curl -fsS http://127.0.0.1:8081/health || exit 1
