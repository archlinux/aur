# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

: "${USE_SYSTEMD:=1}"

pkgname=sonicde-meta
pkgver=6.8
pkgrel=2
pkgdesc='Meta package to install SonicDE, an X11-focused fork of KDE'
arch=('any')
license=('None')
url='https://github.com/Sonic-DE'
depends=(
	'aurorae'
	'flatpak-kcm'
	'kup'
	'sonic-activities-stats'
	'sonic-activity-manager-daemon'
	'sonic-audio-applet-pulse'
	'sonic-bluetooth-runtime'
	'sonic-browser-integration'
	'sonic-decoration'
	'sonic-desktop-interface'
	'sonic-disks'
	'sonic-dr-robotnik'
	'sonic-ecco'
	'sonic-file-search-ui'
	'sonic-frameworks-keyring-pam'
	'sonic-gtk-theme-bridge'
	'sonic-keybind-daemon'
	'sonic-launcher-menu-edit'
	'sonic-login-manager'
	'sonic-network-manager'
	'sonic-night-light'
	'sonic-oxygen'
	'sonic-oxygen-sounds'
	'sonic-pipewire'
	'sonic-polkit-agent'
	'sonic-power-management'
	'sonic-print-management'
	'sonic-qt-theme-bridge'
	'sonic-screen'
	'sonic-screenies'
	'sonic-screenlocker'
	'sonic-silver'
	'sonic-silver-gtk'
	'sonic-silver-sound-theme'
	'sonic-ssh-password-prompt'
	'sonic-system-info'
	'sonic-system-monitor'
	'sonic-system-settings'
	'sonic-system-stats'
	'sonic-terminal'
	'sonic-terminal-tools'
	'sonic-thunderbolt'
	'sonic-vault'
	'sonic-welcome-center'
	'sonic-workspace-addons'
	'sonic-write-daemon'
	'xdg-desktop-portal-sonicde'
)
((USE_SYSTEMD)) && depends+=('sonic-firewall')
optdepends=(
	'breeze-grub: Breeze theme for GRUB'
	'breeze-plymouth: Breeze theme for Plymouth'
	'plymouth-kcm: Configure Plymouth from systemsettings'
	'sddm-kcm: SDDM configuration module'
	'sonic-breeze: Breeze theme for SonicDE'
	'sonic-drawing-tablet: Drawing tablet settings on X'
	'sonic-gamma: Adjust gamma settings on X'
	'sonic-silver-sddm: SDDM silver theme'
	'sonic-theme-sdk: Development tools'
	'sonic-workspace-wallpapers: Additional wallpapers'
	'union: Next generation QtQuick/QtWidgets style engine'
)
provides=('plasma-meta')
conflicts=('plasma-meta')
options=('!debug')
