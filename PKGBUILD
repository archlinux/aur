# Maintainer: Grant Moyer <code@grantmoyer.com>
pkgname=calibre-plugin-goodreads
pkgver=1.8.4
pkgrel=1
pkgdesc="Downloads metadata and covers from Goodreads - Calibre Plugin"
arch=('any')
url="https://github.com/kiwidude68/calibre_plugins/tree/main/goodreads"
license=('GPL3')
depends=('calibre>=2.0.0')
source=("https://github.com/kiwidude68/calibre_plugins/releases/download/goodreads-${pkgver}/goodreads-${pkgver}.zip")
noextract=("goodreads-${pkgver}.zip")
sha256sums=('7201fd243958ff91960998ac1f9b70bea196d6f386b1e2acf5ba42184c3b9821')

package() {
	install -m644 -D "${srcdir}/goodreads-${pkgver}.zip" "${pkgdir}/usr/share/calibre/system-plugins/goodreads-${pkgver}.zip"
}
