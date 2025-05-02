FROM node:22.15.0 AS compile-image

WORKDIR /backend

COPY package-lock.json package.json  ./
COPY tsconfig.json ./

RUN npm install

COPY . .

RUN npm run build

FROM node:22.15.0 AS runtime-image

WORKDIR /backend
COPY --from=compile-image /backend/dist/ ./dist
COPY --from=compile-image /backend/package.json ./
RUN npm install --omit=dev

COPY <<EOF /backend/.env
PORT=3000
NODE_ENV=production
EOF

CMD ["node","dist/server.js"]