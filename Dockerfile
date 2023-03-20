
FROM node:16-alpine AS base
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN apk add --update --no-cache openssl1.1-compat
COPY . ./
# COPY package*.json ./
# COPY tsconfig.json ./
# COPY src ./src
RUN ls -a
RUN npm install
RUN npm run build

# https://notiz.dev/blog/dockerizing-nestjs-with-prisma-and-postgresql
## this is stage two , where the app actually runs
FROM node:16-alpine as output
RUN apk add --update --no-cache openssl1.1-compat
WORKDIR /usr/src/app/build
COPY package.json ./
RUN npm install --only=production
COPY --from=base /usr/src/app/node_modules ./node_modules
COPY --from=base /usr/src/app/package*.json ./
COPY --from=base /usr/src/app/build .


RUN npm install pm2 -g
EXPOSE 8080
CMD ["pm2-runtime","src/main.js"]

