FROM golang:alpine as getter
RUN apk add --update --no-cache git
RUN go get github.com/stdupp/goasciiart

FROM alpine as executor
COPY . .
COPY --from=getter /go/bin/goasciiart /usr/local/bin/
CMD ["goasciiart", "-p", "sonots.png"]
