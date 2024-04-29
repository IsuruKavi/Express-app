# Use a base image with PostgreSQL server and Node.js
FROM postgres:latest
FROM node:22-alpine

# Install Node.js (if required)


# Set working directory
WORKDIR /app




# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy the rest of the application code
COPY . .

# Expose port 8080 for Node.js app
EXPOSE 8080

# Start PostgreSQL in the background and then run Node.js app
CMD ["sh", "-c", "pg_ctl start -D /var/lib/postgresql/data -l /var/log/postgresql/server.log && npm start"]
