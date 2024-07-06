FROM node:18-alpine as builder
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production
COPY . .

FROM node:18-alpine

RUN addgroup -S appgroup && adduser -S appuser -G appgroup
WORKDIR /app
COPY --from=builder /app .
RUN chown -R appuser:appgroup /app
USER appuser

EXPOSE 3000

CMD ["npm", "run", "start:prod"]
