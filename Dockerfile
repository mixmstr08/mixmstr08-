FROM node:18-slim

# Install git and clean up cache
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy application files
COPY . .

# Install dependencies and build Rammerhead
RUN npm install
RUN npm run build

# Expose port 7860 (Hugging Face requires this exact port)
EXPOSE 7860
ENV PORT=7860

# Start the server
CMD ["node", "src/server.js"
