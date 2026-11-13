FROM node:18.15.0-alpine AS builder

WORKDIR /app

RUN apk add --no-cache python3 make g++

COPY package*.json ./

RUN npm ci && npm cache clean --force

COPY . .

FROM node:18.15.0-alpine

RUN apk add --no-cache sqlite

WORKDIR /app

COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder --chown=node:node /app/package.json ./
COPY --from=builder --chown=node:node /app/index.js ./
COPY --from=builder --chown=node:node /app/shared ./shared
COPY --from=builder --chown=node:node /app/users ./users
COPY --from=builder --chown=node:node /app/healthcheck.js /app/

USER node

EXPOSE 8000

HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 CMD [ "node", "healthcheck.js" ]

CMD ["npm", "start"]
