FROM golang:latest AS builder

WORKDIR /usr/app
COPY . .

RUN go mod init github.com/EduardoDrozda/gochallenge-fullcycle

RUN go build 

CMD [ "./gochallenge-fullcycle" ]

FROM scratch 

COPY --from=builder /usr/app .

CMD [ "./gochallenge-fullcycle" ]