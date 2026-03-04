FROM node:20-slim
WORKDIR /app
# Install the pubmed server and supergateway
RUN npm install -g @cyanheads/pubmed-mcp-server supergateway
# Expose the port App Runner will use (default 8080)
EXPOSE 8080
# Run supergateway to convert stdio to SSE on port 8080
CMD ["supergateway", "--port", "8080", "--stdio", "npx @cyanheads/pubmed-mcp-server"]

