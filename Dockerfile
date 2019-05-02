FROM node:8-alpine 

ENV NPM_CONFIG_LOGLEVEL warn
ARG APP_ENV
ENV APP_ENV $APP_ENV

WORKDIR /frontend
COPY . .

RUN yarn

CMD if [ ${APP_ENV} = production ]; \
  then \
  npm run build && \
  npx serve -s build -l 3000; \
  else \
  npm start; \
  fi

EXPOSE 3000