FROM node:14.11.0-alpine3.11

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . . 

CMD ["npm","run","start"]

FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html

