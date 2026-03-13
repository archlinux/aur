#!/bin/bash
# Waykey CLI / Dashboard Launcher

echo "Starting Waykey background service..."
systemctl --user start waykey.service

# Servisin ayağa kalkması ve portu dinlemeye başlaması için kısa bir bekleme
sleep 1

echo "Opening Waykey Dashboard..."
xdg-open http://localhost:8080