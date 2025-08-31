# Claudebox

Sandboxed Docker environment for Claude Code with workspace isolation.

Uses the pre-built Docker image `skmpf/claudebox:latest` from Docker Hub.

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
# Start the container
docker-compose up -d

# Get into the container shell where Claude Code is available
docker-compose exec claudebox claude

# Stop container
docker-compose down
```

## Local Development

To modify the image and build locally:

```bash
# Build your own image
docker-compose build

# Or modify compose.yml to use local build:
# Replace 'image: skmpf/claudebox:latest' with 'build: .'
```

## Files

- `Dockerfile` - Container definition  
- `compose.yml` - Service config
- `.env` - Your workspace path

Claude only has access to your workspace directory. Authentication persists between restarts.
