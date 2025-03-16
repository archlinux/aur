#!/bin/bash

# Create systemd service file for smartswap_daemon
echo "Creating systemd service file..."
cat << 'EOF' > /etc/systemd/system/smartswap-daemon.service
[Unit]
Description=Dynamic Swap Management Service
After=network.target

[Service]
Type=simple
ExecStart=/bin/bash /usr/lib/smartswap/smartswap_daemon.sh
Restart=no
RestartSec=5
User=root

[Install]
WantedBy=multi-user.target
EOF

if [ $? -ne 0 ]; then
    echo "ERROR: Failed to create service file"
    exit 1
fi
echo "Service file created successfully"

# Create directory and copy smartswap_daemon script
echo "Creating installation directory..."
if ! mkdir -p /usr/lib/smartswap/; then
    echo "ERROR: Failed to create directory /usr/lib/smartswap/"
    exit 1
fi

echo "Installing smartswap_daemon script..."
if ! cp smartswap_daemon.sh /usr/lib/smartswap/; then
    echo "ERROR: Failed to copy script to /usr/lib/smartswap/"
    exit 1
fi

if ! chmod +x /usr/lib/smartswap/smartswap_daemon.sh; then
    echo "ERROR: Failed to make script executable"
    exit 1
fi
echo "Script installed successfully"

# Reload systemd and enable/start service
echo "Reloading systemd daemon..."
if ! systemctl daemon-reload; then
    echo "ERROR: Failed to reload systemd daemon"
    exit 1
fi
echo "Systemd daemon reloaded successfully"

echo "Enabling smartswap-daemon service..."
if ! systemctl enable smartswap-daemon; then
    echo "ERROR: Failed to enable smartswap-daemon service"
    exit 1
fi
echo "Service enabled successfully"

echo "Starting smartswap-daemon service..."
if ! systemctl start smartswap-daemon; then
    echo "ERROR: Failed to start smartswap-daemon service"
    exit 1
fi
echo "Service started successfully"

echo "SmartSwap Daemon installation completed successfully"
echo "Check service status with: systemctl status smartswap-daemon"

