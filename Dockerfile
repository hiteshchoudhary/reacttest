FROM node:alpine as builder
WORKDIR /var/app
COPY ./package.json ./
RUN npm install
COPY ./ ./
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /var/app/build /usr/share/nginx/html
