# Autostart Chromium in Fullscreen mode
/usr/bin/xinit /usr/bin/chromium --desktop-window-1080p --kiosk $(cat /home/chromium/chromium-autostart-url.txt)
