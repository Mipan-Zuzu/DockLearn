FROM alpine:3.23

RUN mkdir /app 
LABEL dev="mipandev" \
    webiste="https://www.mipandev.my.id"

RUN echo "SUCCSES" > "/app/text.txt"
EXPOSE 3032
RUN cat "/app/text.txt"
