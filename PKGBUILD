# Maintainer: Yauhen Kirylau <yawghen AT gmail.com>

pkgname=gnome-colors-common-icon-theme
pkgver=5.5.1
pkgrel=2
pkgdesc='GNOME-Colors icon theme (common icons)'
arch=('any')
url="https://github.com/actionless/oomox"
license=('GPL3')
source=(
	"git+https://github.com/actionless/oomox.git#branch=master"
)
md5sums=("SKIP")
provides=('gnome-colors-icon-theme')
conflicts=('gnome-colors-icon-theme')

package() {
	cd "${srcdir}/oomox"
	install -d "$pkgdir/usr/share/icons/gnome-colors-common"
	cp -r gnome-colors/gnome-colors-common/* \
		"$pkgdir/usr/share/icons/gnome-colors-common/"
}

