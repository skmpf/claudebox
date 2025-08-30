FROM debian:bookworm-slim

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV PNPM_HOME="/home/appuser/.local/share/pnpm"
ENV PATH="$PNPM_HOME:$PATH"

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    wget \
    git \
    zsh \
    ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js 22 (latest LTS)
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - \
    && apt-get install -y --no-install-recommends nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create non-root user first (before installing global packages)
RUN adduser --disabled-password --gecos "" appuser

# Switch to non-root user for pnpm installation
USER appuser

# Install pnpm as the non-root user
RUN curl -fsSL https://get.pnpm.io/install.sh | sh -

# Add pnpm to PATH for current session and install Claude Code
RUN $PNPM_HOME/pnpm add -g @anthropic-ai/claude-code

# Create workspace directory
USER root
RUN mkdir -p /workspace && chown -R appuser:appuser /workspace

# Switch back to non-root user
USER appuser
WORKDIR /workspace

# Set the correct entrypoint path
ENTRYPOINT ["/home/appuser/.local/share/pnpm/claude"]