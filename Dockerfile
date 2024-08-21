FROM golang:1.23.0-alpine AS compiler
WORKDIR /app
COPY . .
RUN go build -buildvcs=false

FROM scratch
WORKDIR /app
COPY --from=compiler /app/hello hello
CMD ["./hello"]