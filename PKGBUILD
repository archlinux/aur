# Maintainer: Carson Rueter <roachh@protonmail.com>
# Contributor: Jerome Leclanche <jerome@leclan.ch>
# Contributor: Marcin Mikołajczak <me@m4sk.in>

_pkgname=lxqt-desktop
pkgname="$_pkgname-git"
pkgver=0.16.0
pkgrel=2
pkgdesc="The LXQt desktop"
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
)
optdepends=(
	"lximage-qt-git: The LXQt image viewer"
	"openbox: Recommended window manager"
	"obconf-qt: Openbox configuration tool (Qt port)"
	"sddm-git: Recommended display manager"
	"sddm-config-editor-git: SDDM Configuration Editor"
	"kwin: Recommended display manager"
	"lxqt-kcm-integration-git: KCM Integration"
	"qterminal-git: Pure Qt terminal"
	"featherpad-git: Pure Qt text editor"
	"screengrab-git: Screenshot capture"
	"qps-git: Task Monitoring"
	"nm-tray-git: Qt front-end to NetworkManager"
	"qlipper: Clipboard manager"
	"kvantum-qt5-git: Alternate Qt style"
	"compton-conf-git: Qt-based configuration tool for compton"
	"pavucontrol-qt-git: PulseAudio mixer (Qt port)"
	"lxqt-connman-applet-git: Qt front-end to ConnMan"
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
