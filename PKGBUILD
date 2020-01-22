# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname=lxqt-kwin-desktop
pkgname=$_pkgname-git
pkgver=0.14.0
pkgrel=1
pkgdesc="The LXQt-Kwin desktop"
arch=("i686" "x86_64")
url="http://lxqt.org"
license=("GPL2")
depends=(
	"pcmanfm-qt-git"
	# components
	"lxqt-about-git"
	"lxqt-admin-git"
	"lxqt-archiver-git"
	"lxqt-config-git"
	"lxqt-globalkeys-git"
	"lxqt-notificationd-git"
	"lxqt-openssh-askpass-git"
	"lxqt-panel-git"
	"lxqt-policykit-git"
	"lxqt-powermanagement-git"
	"lxqt-qtplugin-git"
	"lxqt-runner-git"
	"lxqt-session-git"
	"lxqt-sudo-git"
	"lxqt-themes-git"
	"lxqt_wallet-git"
	"lxqt-kcm-integration-extra-git"
	"lxqt-organizer-git"
)
optdepends=(
	"sddm-git: Recommended display manager"
	"sddm-config-editor-git: an sddm config editor"
	"nm-tray-git: Qt front-end to NetworkManager"
	"lxqt-connman-applet-git: Qt front-end to ConnMan"
	"cmst-git: a connman system tray"
	"kvantum-qt5-git: SVG-based Qt5 theme engine plus a config tool and extra themes"
	"pavucontrol-qt-git: PulseAudio mixer. Qt port of pavucontrol"
	"lximage-qt-git: The LXQt image viewer"
	"qterminal-git: Pure Qt terminal"
	"featherpad-git: Pure Qt text editor"
	"feathernotes-git: Lightweight Qt hierarchical notes-manager for Linux"
	"screengrab-git: Screenshot capture"
	"qps-git: Task Monitoring"
	"lector-git: Qt based ebook reader with support for PDF, epub, djvu, fb2, comicbooks, mobi, azw"
	"mpv-git: Recommended video player"
	"meteo-qt-git: System tray application for weather status information"
	"qvkbd-git: Qt Virtual Keyboard"
	"simplescreenrecorder-git: A feature-rich screen recorder that supports X11 and OpenGL"
	"qbittorrent-git: A bittorrent client powered by C++, Qt5 and the good libtorrent library"
	"ksmoothdock-git: Recommended dock to be used with lxqt-kwin"
	"qomui-git: Qt OpenVPN Gui with advanced features and support for multiple providers"
	"speedcrunch-git: Simple, high precision and powerful calculator"
	"performance-tweaks: Recommended for fast and responsive desktop experience"
	"systemdgenie: Systemd management utility"
)
makedepends=("git")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/lxde/lxqt.git")
sha256sums=("SKIP")


pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --always | sed "s/-/./g"
}

build() {
	msg2 "This is a metapackage. Nothing will be built."
}

package() {
	msg2 "This is a metapackage. Nothing will be installed."
}
