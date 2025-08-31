# Claudebox 🐳

A secure, sandboxed Docker environment for running Claude Code with complete workspace isolation.

> **Security**: Claude only has access to your mounted workspace directory - nothing else on your system.

## Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/skmpf/claudebox.git
cd claudebox
```

### 2. Configure Your Workspace

Create your environment file and set your workspace path:

```bash
cp .env.example .env
# Edit .env to set your WORKSPACE_PATH
```

### 3. Start the Container

```bash
docker-compose up -d
```

### 4. Start Using Claude

```bash
# Enter the container where Claude Code is available
docker-compose exec claudebox claude
```

## Usage Commands

```bash
# Start the container in background
docker-compose up -d

# Enter interactive shell with Claude available
docker-compose exec claudebox claude

# Stop the container
docker-compose down
```

## Local Development

Want to modify the container? You can build it locally:

```bash
# Build your own image
docker-compose build

# Or modify compose.yml to use local build:
# Replace 'image: skmpf/claudebox:latest' with 'build: .'
```

## Project Structure

```
claudebox/
├── Dockerfile           # Container definition
├── compose.yml          # Docker Compose configuration
├── .env.example         # Environment template
├── .env                 # Your workspace configuration (created by you)
├── .gitignore          # Git ignore rules
├── .dockerignore       # Docker ignore rules
└── README.md           # This file
```

## How It Works

- **Isolated Environment**: Claude runs in a Docker container with no access to your host system
- **Workspace Mount**: Only your specified workspace directory is mounted and accessible
- **Persistent Auth**: Claude authentication is stored in a Docker volume and persists between restarts

## Troubleshooting

**Container won't start?**

- Check that Docker is running
- Verify your `WORKSPACE_PATH` in `.env` exists and is accessible

**Claude command not found?**

- The container might still be starting up, wait a few seconds and try again
- Try running `docker-compose exec claudebox bash` to get a shell and check if Claude is installed

**Permission issues?**

- Ensure your workspace directory has proper read/write permissions
