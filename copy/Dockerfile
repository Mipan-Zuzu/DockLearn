FROM node:20-alpine

# DEFAULT WORKDIR
WORKDIR /app
COPY package.json pnpm-lock.yaml ./

LABEL Author="Mipan"
LABEL Company="MipanFoundation" Website="https://www.mipandev.my.id"

RUN npm install -g pnpm
RUN pnpm install

# COPY SORCE CODE
COPY . .

CMD [ "pnpm", "run", "dev" ]
