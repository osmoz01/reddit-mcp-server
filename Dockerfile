FROM python:3.12-slim

# Install uv (fast Python package manager)
RUN pip install uv

# Install the reddit MCP server from GitHub
RUN uv pip install --system \
    "git+https://github.com/eliasbiondo/reddit-mcp-server.git"

# Expose port
EXPOSE 8000

# Start the server
CMD ["reddit-no-auth-mcp-server", "--transport", "streamable-http", "--host", "0.0.0.0", "--port", "8000"]
