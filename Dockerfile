FROM node:14.11.0-alpine3.11 as builder

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . . 

CMD ["npm","run","start"]

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

