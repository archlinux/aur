fnq-monitor
A utility to monitor Fn+Q ACPI events for switching system performance modes on supported hardware.
Installation
Install the package using an AUR helper, such as yay:
yay -S fnq-monitor

Or build manually from source:
git clone https://aur.archlinux.org/fnq-monitor.git
cd fnq-monitor
makepkg -si

Post-Installation
After installation, each user must enable the user service to start monitoring:
systemctl --user daemon-reexec
systemctl --user enable --now fnq-monitor.service

Dependencies

acpi_call: For ACPI calls
acpid: For ACPI event monitoring
qt5-tools: For qdbus notifications
polkit: For privilege management
breeze-icons: For notification icons

License
This project is licensed under the GPL3 License.
Notes

The package automatically enables and starts the acpid service.
Ensure your user is in the wheel group for polkit rules to work.
If icons are missing, check that breeze-icons is installed.
