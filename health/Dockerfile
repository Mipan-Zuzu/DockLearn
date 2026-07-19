FROM node:20-alpine 

WORKDIR /app
EXPOSE 3035
USER node

RUN apk add --no-cache curl

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD curl -f http://localhost:3035/health

LABEL dev="Mipan" \
        webiste="https://www.mipandev.my.id"

COPY package.json pnpm-lock.yaml /app/

RUN npm install -g pnpm
RUN pnpm install
    

COPY . .

CMD [ "pnpm", "run" , "dev" ]