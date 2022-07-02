FROM golang:1.17-alpine as builder

WORKDIR /go/src/

COPY . .

RUN go mod init src/hello && \
  go build hello.go


FROM scratch

COPY --from=builder /go/src/hello /

CMD ["/hello"]