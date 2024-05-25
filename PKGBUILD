# Maintainer: Grant Moyer <youremail@domain.com>
pkgname=calibre-plugin-goodreads
pkgver=1.8.1
pkgrel=1
pkgdesc="Downloads metadata and covers from Goodreads - Calibre Plugin"
arch=('any')
url="https://github.com/kiwidude68/calibre_plugins/tree/main/goodreads"
license=('GPL3')
depends=('calibre>=2.0.0')
source=("https://github.com/kiwidude68/calibre_plugins/releases/download/goodreads-v$pkgver/goodreads-v$pkgver.zip")
noextract=("goodreads-v$pkgver.zip")
sha256sums=('b8d8f226d51df45a09832c6bb54e3f920b2208268f0e2946792cd205fd420e81')

package() {
	install -m644 -D "${srcdir}/goodreads-v$pkgver.zip" "${pkgdir}/usr/share/calibre/system-plugins/goodreads-v$pkgver.zip"
}
