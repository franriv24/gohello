FROM golang:1.23.0-alpine AS compiler
WORKDIR /app
RUN apk add --no-cache upx
COPY . .
RUN go build -buildvcs=false -ldflags="-s -w"
RUN upx --best hello

FROM scratch
WORKDIR /app
COPY --from=compiler /app/hello hello
CMD ["./hello"]