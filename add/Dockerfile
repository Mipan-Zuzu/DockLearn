    FROM alpine:3.23 

    LABEL Author="Mipan"
    LABEL Company="MipanFoundation" Website="https://www.mipandev.my.id"

    RUN mkdir world
    ADD text/*.txt world

    CMD  ["cat", "world/say.txt", "world/mipan.txt"]