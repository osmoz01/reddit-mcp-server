FROM python:3.12-slim

# Install git (required to install packages from GitHub)
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Install uv
RUN pip install uv

# Clone the repo
RUN git clone https://github.com/eliasbiondo/reddit-mcp-server.git /app

WORKDIR /app

# Install dependencies
RUN uv pip install --system -e .

EXPOSE 8000

CMD ["reddit-no-auth-mcp-server", "--transport", "streamable-http", "--host", "0.0.0.0", "--port", "8000"]
