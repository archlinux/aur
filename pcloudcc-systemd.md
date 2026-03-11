# pcloudcc systemd user service

## Setup

Before enabling the service, you must configure pcloudcc credentials:

```bash
# Run pcloudcc interactively to set up credentials
pcloudcc -u your_username -s

# This will:
# - Prompt for password
# - Save credentials to ~/.pcloud/data.db
# - Create necessary configuration
```

## Usage

After initial setup:

```bash
# Enable and start the service
systemctl --user enable --now pcloudcc@your_username.service

# Check status
systemctl --user status pcloudcc@your_username.service

# Stop the service
systemctl --user stop pcloudcc@your_username.service

# View logs
journalctl --user -u pcloudcc@your_username.service
```

## Notes

- The service requires `~/.pcloud/data.db` to exist (created during initial setup)
- Use the `-s` flag during setup to save your password
- The service will not start without saved credentials
