# Maintainer: Grant Moyer <code@grantmoyer.com>
pkgname=calibre-plugin-goodreads
pkgver=1.10.0
pkgrel=1
pkgdesc="Downloads metadata and covers from Goodreads - Calibre Plugin"
arch=('any')
url="https://github.com/kiwidude68/calibre_plugins/tree/main/goodreads"
license=('GPL3')
depends=('calibre>=2.0.0')
source=("https://github.com/kiwidude68/calibre_plugins/releases/download/goodreads-${pkgver}/goodreads-${pkgver}.zip")
noextract=("goodreads-${pkgver}.zip")
sha256sums=('a940b53392e9b14768d464c2bcdf0857a17652a42b3e8239b85862d27329eaf5')

package() {
	install -m644 -D "${srcdir}/goodreads-${pkgver}.zip" "${pkgdir}/usr/share/calibre/system-plugins/goodreads-${pkgver}.zip"
}
