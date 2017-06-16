# Maintainer: Joel <aullidolunar (at) gmai1 dot c0m >

_themename=aurora-nuevo

pkgname=gtk-theme-${_themename}
pkgver=2
pkgrel=0
pkgdesc="Easy On The Eyes GTK 3.20 + Themes."
arch=('any')
url="http://www.noobslab.com/2017/05/try-aurora-next-and-aurora-nuevo-theme.html"
license=('GPL')
depends=('gtk3>=3.20')
source=(https://launchpadlibrarian.net/318148345/aurora-nuevo_3.24~zesty~NoobsLab.com.tar.gz)
sha256sums=('dfd14d87c0956effbbe4fcb624fe31c97332d54a123d35a0b8342c507ff73bd4')

package() {
	cd "${srcdir}/Next-Aurora"
	rm -rf debian
	find . -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
