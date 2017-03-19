# Maintainer: Joel <aullidolunar (at) gmai1 dot c0m >

_themeUrlId=1017085
_themename=ambiance-crunchy
_themeurlfull=https://dl.opendesktop.org/api/files/download/id/1467268340/Crunchy-themes.tar.gz

pkgname=fluxbox-style-${_themename}
pkgver=16.04.2
pkgrel=0
pkgdesc="This is the Ambiance Crunchy fluxbox theme"
arch=('any')
url="https://www.gnome-look.org/p/${_themeUrlId}/"
license=('GPL')
source=(${_themeurlfull})
sha256sums=('ce138c9973565578c17160b3c02652ae79e83b77b80926acb878f83f28e20277')

package() {
	cd "${srcdir}/fluxbox/styles"
	find . -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/fluxbox/styles/{}" \;
}
