# Claudebox

Sandboxed Docker environment for Claude Code with workspace isolation.

## Setup

1. **Create `.env`** - Copy the `.env.example` and set your workspace path:

   ```bash
   cp .env.example .env
   ```

2. **Start container**:

   ```bash
   docker-compose up -d
   ```

3. **Login to Claude** (one-time):
   ```bash
   docker-compose exec claudebox claude auth login
   ```

## Usage

```bash
# Chat with Claude
docker-compose exec claudebox claude chat

# Open shell
docker-compose exec claudebox zsh

# Stop container
docker-compose down
```

## Files

- `Dockerfile` - Container definition
- `docker-compose.yml` - Service config
- `.env` - Your workspace path

Claude only has access to your workspace directory. Authentication persists between restarts.
