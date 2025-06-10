FROM node:18

# Install dependency OS (buat canvas/sharp dll)
RUN apt-get update && apt-get install -y \
    libcairo2-dev \
    libjpeg-dev \
    libpango1.0-dev \
    libgif-dev \
    librsvg2-dev \
    libpixman-1-0

# Install pm2 global
RUN npm install -g pm2

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

# Start bot pakai PM2, auto restart kalau error
CMD [ "pm2-runtime", "start", "index.js" ]
