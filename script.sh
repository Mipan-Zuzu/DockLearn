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

# BUILD ARGS
docker build --build-arg NODE_VERSION=18 -t arg

# VOLUME 
docker run -d --name app-redis -p 6379:6379 -v app-data:/data redis:latest

docker exec -it app-redis ls -l /data 

# volume menyimpan data secara persitance bisa menyimpan data dari databse maupun redis key value /data untuk default nya redis 

# run redis localhost expose
redis-cli -h localhost -p 6379
SET NAME Mipan EX 60 # untuk kasi expire 1 menit
GET NAME 
KEYS *

# INI SEMUA PATH LOKASI VOLUME DEFAULT DAN BEBERAPA FLAG DB nya 

# POSTGRESS
    docker run -d --name app-postgress -e POSTGRES_USER="mipan" -e POSTGRES_PASSWORD="cuki123@" -e POSTGRES_DB="user" -p 3032:5432 -v 
    postgres-data:/var/lib/postgresql/18/docker postgres:18.4 
# MONGO DB 
    docker run -d --name app-mongodb -e MONGO_INITDB_ROOT_USERNAME="mipan" -e MONGO_INITDB_ROOT_PASSWORD="mipan123@" 
    -p 3032:27017 -v mongodb-app:/data/db
    MongoDb:latest
# REDIS
    docker run -d --name redis-app -p 3032:6379 -v redis-data:/data redis-server --apendonly yes redis