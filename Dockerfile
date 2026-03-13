FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy dependency filese
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy project files
COPY . .

# Build NestJS app
RUN npm run build

# Expose application port
EXPOSE 3000

# Start the application
CMD ["node", "dist/main.js"]