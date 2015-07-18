# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname=lxqt-desktop
pkgname=$_pkgname-git
pkgver=0.9.0
pkgrel=3
pkgdesc="The LXQt desktop"
arch=("i686" "x86_64")
url="http://lxqt.org"
license=("GPL2")
depends=(
	"pcmanfm-qt-git"
	# components
	"lxqt-about-git"
	"lxqt-admin-git"
	"lxqt-common-git"
	"lxqt-config-git"
	"lxqt-globalkeys-git"
	"lxqt-notificationd-git"
	"lxqt-openssh-askpass"
	"lxqt-panel-git"
	"lxqt-policykit-git"
	"lxqt-powermanagement-git"
	"lxqt-qtplugin-git"
	"lxqt-runner-git"
	"lxqt-session-git"
	"lxqt-sudo-git"
)
optdepends=(
	"lximage-qt-git: The LXQt image viewer"
	"openbox: Recommended window manager"
	"sddm: Recommended display manager"
	"qterminal: Pure Qt terminal"
	"juffed: Pure Qt text editor (Kate clone)"
	"screengrab: Screenshot capture"
	"qps: Task Monitoring"
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
