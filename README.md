mouse-hardware-fixA lightweight, plug-and-play C++ daemon for Linux that fixes physical scroll wheel bouncing and mouse button chatter (double-clicking) at the kernel level.Hardware switches degrade over time, causing scroll wheels to jump in the opposite direction and buttons to register multiple clicks. Instead of throwing away an expensive mouse, this utility intercepts the raw hardware signals, applies a precise software debounce algorithm, and outputs a clean signal through a virtual device.FeaturesScroll Bouncing Fix: Prevents the scroll wheel from jumping in the wrong direction when physical detents fail to settle.Click Chatter Fix: Debounces standard mouse buttons (MB1 through MB5) to prevent accidental double-clicks.True Plug-and-Play: Uses udev to dynamically detect when a mouse is plugged in (via direct USB, wireless dongle, or Bluetooth) and automatically spawns a dedicated, isolated service for that specific device.Macro Preserving: Strictly bounds the fix to standard mouse movement, scrolling, and MB1-MB5. Custom hardware switches, DPI toggles, and macro keys are ignored and passed through natively by the kernel.Zero Latency: Written in C++ using direct evdev and uinput ioctls.InstallationArch Linux (AUR)The easiest way to install is via the Arch User Repository. This will automatically configure the systemd templates and udev rules.Using an AUR helper:paru -S mouse-hardware-fix-git
# or
yay -S mouse-hardware-fix-git
Manual AUR installation:git clone [https://aur.archlinux.org/mouse-hardware-fix-git.git](https://aur.archlinux.org/mouse-hardware-fix-git.git)
cd mouse-hardware-fix-git
makepkg -si
Manual Installation (Debian/Ubuntu/Fedora/etc.)If you are not on Arch Linux, you can easily compile and install the daemon manually.Prerequisites: g++, systemd, udevClone the repository:git clone [https://github.com/Aleynikovich/mouse-hardware-fix.git](https://github.com/Aleynikovich/mouse-hardware-fix.git)
cd mouse-hardware-fix
Compile the daemon:g++ -O3 mouse-hardware-fix.cpp -o mouse-hardware-fix
Install the binary and rules:sudo cp mouse-hardware-fix /usr/local/bin/
sudo cp mouse-hardware-fix@.service /etc/systemd/system/
sudo cp 99-mouse-fix.rules /etc/udev/rules.d/
Reload system managers and trigger detection:sudo systemctl daemon-reload
sudo udevadm control --reload-rules
sudo udevadm trigger
How It WorksThe udev rule watches for any new physical input device that identifies as a mouse.When connected, udev triggers a parameterized systemd service (mouse-hardware-fix@<event_node>).The C++ daemon uses EVIOCGRAB to temporarily mute the broken physical mouse, preventing its corrupted signals from reaching your desktop environment.It creates a pristine virtual mouse called "Debounced Mouse" using /dev/uinput.It reads the raw physical inputs, filters out the bounces and chatters based on strict time thresholds (0.4s idle timeout for scrolls, 0.025s debounce for clicks), and forwards the clean inputs to the virtual mouse.To prevent infinite recursive loops (udev fork bombs), the virtual mouse is explicitly tagged with a fake vendor ID (1234), which the udev rule is hardcoded to ignore.TroubleshootingIf you plug in your mouse and it does not seem to be working, or you want to see the active debounce logs, you can view the live output of all running instances:journalctl -u "mouse-hardware-fix@*" -f
To see if the daemon has successfully attached to your physical devices, check the systemd status:systemctl status "mouse-hardware-fix@*.service"

