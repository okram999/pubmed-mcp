FROM node:20-bookworm

# Install basic tools needed for npx and supergateway
RUN apt-get update && apt-get install -y ca-certificates && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Install the server and bridge locally to avoid global path issues
RUN npm install @cyanheads/pubmed-mcp-server supergateway

# App Runner default port
EXPOSE 8080

# Use the local path to supergateway and npx
CMD ["./node_modules/.bin/supergateway", "--port", "8080", "--stdio", "npx -y @cyanheads/pubmed-mcp-server"]

