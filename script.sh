# FROM Instruction
docker build -t mipanzuzu/from:1.0.0 from

# RUN Instruction
docker build -t mipanzuzu/run:1.0.0 run

docker build -t mipanzuzu/run:1.0.0 run --progress=plain --no-cache
docker images mipanzuzu/*

# CMD Instruction 
docker build -t mipanzuzu/command:1.0.0 command 
docker run --name command mipanzuzu/command:1.0.0 

docker logs command

# LABEL Instruction
docker build -t mipanzuzu/metadata:1.0.0 metadata

docker inspect mipanzuzu/metadata:1.0.0