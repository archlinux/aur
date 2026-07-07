# Required — at least 32 characters. Generate with:
# openssl rand -hex 48
JWT_SECRET=

# Server
PORT=2121
HOST=0.0.0.0

# Public URL shown in emails/links (no trailing slash)
# PUBLIC_BASE_URL=https://portal.example.com

# Set true ONLY when the portal is served over HTTPS (reverse proxy).
# Must be false (or unset) for plain HTTP LAN access, e.g. http://192.168.x.x:2121
# FORCE_SECURE_COOKIES=false

# Allow Sonarr/Radarr/Tautulli URLs on private/LAN IPs (common in Docker/homelab)
# ALLOW_PRIVATE_INTEGRATION_URLS=true

# Optional one-time setup token for remote first-time configuration
# SETUP_TOKEN=

# Optional fixed Plex OAuth client id (auto-generated on first run if unset)
# CLIENT_ID=
