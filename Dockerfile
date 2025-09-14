FROM node:lts-alpine
WORKDIR app
COPY . /app
RUN npm install
RUN npm run test
EXPOSE 8000
CMD ["node","app.js"]
