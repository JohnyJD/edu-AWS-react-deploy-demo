# Multistep process
# Production
FROM node:23-alpine as build

# No volumes needed this is production source code
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# Automaticly start nginx
COPY --from=build /app/build /usr/share/nginx/html