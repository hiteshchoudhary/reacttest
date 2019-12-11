FROM node:alpine as builder
WORKDIR /var/app
COPY ./package.json ./
RUN npm install
COPY ./ ./
RUN npm run build

FROM nginx
COPY --from=builder /var/app/build /usr/share/nginx/html
