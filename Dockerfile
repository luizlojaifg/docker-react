FROM node:14.11.0-alpine3.11 as builder

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . . 

CMD ["npm","run","start"]

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

