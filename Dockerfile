FROM strapi/strapi

WORKDIR /project

COPY ./package.json ./
# COPY ./yarn.lock ./

RUN yarn install

COPY . .

ENV NODE_ENV production

# RUN yarn create strapi-app my-project --quickstart

RUN yarn build

EXPOSE 1337

CMD ["yarn", "start"]
