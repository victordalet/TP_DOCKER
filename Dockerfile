FROM node:16

WORKDIR /app

COPY front/package.json ./

RUN yarn install

COPY front .

RUN yarn build



FROM nginx

COPY --from=0 /app/dist /usr/share/nginx/html

COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80





