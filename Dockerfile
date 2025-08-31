FROM node:22-alpine

# Set environment variables
ENV PNPM_HOME="/home/appuser/.local/share/pnpm" \
    PATH="/home/appuser/.local/share/pnpm:$PATH"

# Install system dependencies
RUN apk add --no-cache \
    git \
    curl \
    bash

# Create non-root user
RUN adduser -D -s /bin/bash appuser \
    && mkdir -p /workspace \
    && chown -R appuser:appuser /workspace

# Switch to non-root user and install pnpm + Claude Code
USER appuser
RUN curl -fsSL https://get.pnpm.io/install.sh | bash

RUN $PNPM_HOME/pnpm add -g @anthropic-ai/claude-code

WORKDIR /workspace

# Default command to keep container running
CMD ["tail", "-f", "/dev/null"]