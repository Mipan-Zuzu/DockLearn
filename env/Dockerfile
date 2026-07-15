FROM node:20-alpine

WORKDIR /app
COPY  package.json pnpm-lock.yaml /app/

LABEL Dev="Mipan" \
    company="MipanFoundation" \
    website="https://www.mipandev.my.id"

RUN npm install -g pnpm 
RUN pnpm install

COPY . .

CMD [ "pnpm", "run", "dev" ]