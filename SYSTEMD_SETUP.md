# Systemd Timer Setup Guide

This guide walks you through setting up automated Lem AUR updates using systemd timers.

## Why Systemd Timers?

Systemd timers are superior to cron for this use case:
- ✅ Better logging (integrated with journalctl)
- ✅ Persistent scheduling (catches up if system was down)
- ✅ Service dependencies (waits for network before running)
- ✅ Failed job handling (retries, logging)
- ✅ User-level or system-level deployment

## Quick Setup

Everything is prepared. Just run:

```bash
sudo /home/thomas/lem-aur-build/setup-systemd.sh
```

This will:
1. Copy service and timer files to `/etc/systemd/system/`
2. Enable the timer (auto-starts on boot)
3. Start the timer immediately
4. Show the status

## Manual Setup (If Preferred)

If you want to set up manually:

```bash
# Copy files to systemd directory
sudo cp /home/thomas/lem-aur-build/lem-aur-update.{service,timer} /etc/systemd/system/

# Reload systemd
sudo systemctl daemon-reload

# Enable and start
sudo systemctl enable lem-aur-update.timer
sudo systemctl start lem-aur-update.timer

# Verify
sudo systemctl status lem-aur-update.timer
```

## Viewing and Managing the Timer

### Check Timer Status

```bash
sudo systemctl status lem-aur-update.timer
```

Example output:
```
● lem-aur-update.timer - Daily Lem AUR Package Update
     Loaded: loaded (/etc/systemd/system/lem-aur-update.timer; enabled; vendor preset: enabled)
     Active: active (waiting) since Mon 2026-04-10 18:30:00 UTC; 2h 45min ago
    Trigger: Tue 2026-04-11 02:00:00 UTC; 6h left
```

### List All Timers (Including Next Run)

```bash
systemctl list-timers lem-aur-update.timer
```

### View Recent Logs

```bash
# Last 50 lines
sudo journalctl -u lem-aur-update.service -n 50

# Real-time logs (follow)
sudo journalctl -u lem-aur-update.service -f

# Today's logs
sudo journalctl -u lem-aur-update.service --since today
```

### Test the Timer (Run Now Instead of Waiting)

```bash
# Start the service immediately (doesn't run the timer schedule)
sudo systemctl start lem-aur-update.service

# Watch it run
sudo journalctl -u lem-aur-update.service -f
```

## Schedule Configuration

The timer is set to run daily at 2:00 AM local time.

### Modify the Schedule

To change when it runs, edit the timer file:

```bash
sudo nano /etc/systemd/system/lem-aur-update.timer
```

Examples of OnCalendar schedules:

```ini
# Every day at 2 AM
OnCalendar=*-*-* 02:00:00

# Every day at 2:30 AM  
OnCalendar=*-*-* 02:30:00

# Every weekday (Mon-Fri) at 2 AM
OnCalendar=Mon-Fri *-*-* 02:00:00

# Every Sunday at 3 AM
OnCalendar=Sun *-*-* 03:00:00

# Every 12 hours
OnCalendar=*-*-* 00,12:00:00

# Twice daily (2 AM and 2 PM)
OnCalendar=*-*-* 02,14:00:00
```

After editing, reload and restart:

```bash
sudo systemctl daemon-reload
sudo systemctl restart lem-aur-update.timer
```

## Troubleshooting

### Timer Not Running

**Check if timer is enabled:**
```bash
sudo systemctl is-enabled lem-aur-update.timer
```

**Check if timer is active:**
```bash
sudo systemctl is-active lem-aur-update.timer
```

**Enable and start if needed:**
```bash
sudo systemctl enable lem-aur-update.timer
sudo systemctl start lem-aur-update.timer
```

### Service Keeps Failing

**Check the service status:**
```bash
sudo systemctl status lem-aur-update.service
```

**View detailed logs:**
```bash
sudo journalctl -u lem-aur-update.service -n 100
```

**Common issues:**
- Docker not running: `sudo systemctl start docker`
- SSH key not configured: Check AUR_SETUP.md
- Network issues: Timer waits for network with `After=network-online.target`

### Manual Test Fails But Timer Might Work

Test the script manually as the thomas user:

```bash
/home/thomas/lem-aur-build/update.sh
```

If this succeeds but the timer fails, the issue might be:
- **Permissions**: The service runs as `thomas` user, ensure all paths are accessible
- **Docker permissions**: User must be in docker group

Fix docker permissions:
```bash
sudo usermod -aG docker thomas
# Log out and back in for changes to take effect
```

### Want to Disable Temporarily

```bash
# Stop and disable (won't run on next schedule)
sudo systemctl stop lem-aur-update.timer
sudo systemctl disable lem-aur-update.timer

# Re-enable later
sudo systemctl enable lem-aur-update.timer
sudo systemctl start lem-aur-update.timer
```

## Understanding the Service File

The `lem-aur-update.service` file:

```ini
[Service]
Type=oneshot                    # Run once and exit
User=thomas                     # Run as thomas user
WorkingDirectory=...            # Start in the repo directory
ExecStart=./update.sh           # Run the update script
StandardOutput=journal          # Log to systemd journal
StandardError=journal           # Log errors to systemd journal
TimeoutStartSec=300             # 5 minute timeout (for Docker)
```

## Understanding the Timer File

The `lem-aur-update.timer` file:

```ini
[Timer]
OnCalendar=*-*-* 02:00:00       # When to run
Persistent=true                 # Catch up missed runs
```

`Persistent=true` means if the system was off at 2 AM, it will run the update as soon as it's back up.

## Advanced: User-Level Timer (Optional)

To run the timer as just your user (not system-wide):

```bash
# Install in user systemd directory
mkdir -p ~/.config/systemd/user/
cp /home/thomas/lem-aur-build/lem-aur-update.{service,timer} ~/.config/systemd/user/

# Reload user systemd
systemctl --user daemon-reload

# Enable and start (for your user only)
systemctl --user enable lem-aur-update.timer
systemctl --user start lem-aur-update.timer

# Status (use --user flag)
systemctl --user status lem-aur-update.timer
systemctl --user list-timers
```

Note: User timers only run when the user is logged in or session is persistent.

## Integration with System Monitoring

### Grafana/Prometheus

Log the service completion to monitor:
```bash
# Check success rate
sudo journalctl -u lem-aur-update.service | grep "SUCCESS\|ERROR" | wc -l
```

### Email Notifications (Optional)

To get email alerts on failures, add to `/etc/systemd/system/lem-aur-update.service`:

```ini
[Unit]
OnFailure=send-email@%n.service

[Service]
# ... other settings ...
# Add to beginning of ExecStart to capture output:
StandardOutput=file:/tmp/lem-aur-update.log
```

## References

- Systemd Timer Documentation: `man systemd.timer`
- Calendar Format: `man systemd.time`
- Systemd Service Documentation: `man systemd.service`

## Quick Reference Commands

```bash
# View all timers
systemctl list-timers

# View specific timer
systemctl list-timers lem-aur-update.timer

# View service status
sudo systemctl status lem-aur-update.service

# View logs
sudo journalctl -u lem-aur-update.service -f

# Run now
sudo systemctl start lem-aur-update.service

# Stop timer
sudo systemctl stop lem-aur-update.timer

# Reload after editing
sudo systemctl daemon-reload

# Remove entirely
sudo systemctl disable lem-aur-update.timer
sudo rm /etc/systemd/system/lem-aur-update.*
sudo systemctl daemon-reload
```
