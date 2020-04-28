# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname=lxqt-kwin-desktop
pkgname=$_pkgname-git
pkgver=0.15.0
pkgrel=1
pkgdesc="The LXQt-Kwin desktop"
arch=("any")
url="http://lxqt.org"
license=("GPL2")
depends=(
	"pcmanfm-qt-git"
	"lximage-qt-git"
	"qterminal-git"
	"pavucontrol-qt-git"
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
optdepends=("lxqt-connman-applet: Qt front-end to ConnMan"
	"cmst: a connman system tray"
	"kvantum-qt5: SVG-based Qt5 theme engine plus a config tool and extra themes"
	"featherpad: Pure Qt text editor"
	"feathernotes: Lightweight Qt hierarchical notes-manager for Linux"
	"qps: Task Monitoring"
	"lector: Qt based ebook reader with support for PDF, epub, djvu, fb2, comicbooks, mobi, azw"
	"qpdfview: A tabbed PDF viewer using the poppler library."
	"mpv: Recommended video player"
	"audacious: Recommended audio player"
	"mystiq: FFmpeg GUI front-end based on Qt5."
	"ffaudioconverter: Graphical audio converter"
	"converseen: A batch image processor"
	"photoflare: Quick, simple but powerful Cross Platform image editor."
	"shotcut: video editor"
	"qvkbd: Qt Virtual Keyboard"
	"simplescreenrecorder: A feature-rich screen recorder that supports X11 and OpenGL"
	"qbittorrent: A bittorrent client powered by C++, Qt5 and the good libtorrent library"
	"qomui: Qt OpenVPN Gui with advanced features and support for multiple providers"
	"performance-tweaks: Recommended for fast and responsive desktop experience"
	"systemdgenie: Systemd management utility"
	"ksmoothdock: Recommended dock to be used with lxqt-kwin"
	"kdocker: An application to help you dock any application into the system tray"
	"speedcrunch: Simple, high precision and powerful calculator."
	"sddm: Recommended display manager"
	"sddm-config-editor-git: an sddm config editor"
	"nm-tray-git: Qt front-end to NetworkManager"
	"meteo-qt-git: System tray application for weather status information"
)
makedepends=("git")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/lxde/lxqt.git")
sha256sums=("SKIP")

build() {
	msg2 "This is a metapackage. Nothing will be built."
}

package() {
	msg2 "This is a metapackage. Nothing will be installed."
}
