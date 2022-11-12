# Maintainer: Grant Moyer <youremail@domain.com>
pkgname=calibre-plugin-goodreads
pkgver=1.7.1
pkgrel=1
pkgdesc="Downloads metadata and covers from Goodreads - Calibre Plugin"
arch=('any')
url="https://github.com/kiwidude68/calibre_plugins/tree/main/goodreads"
license=('GPL3')
depends=('calibre>=2.0.0')
source=("https://github.com/kiwidude68/calibre_plugins/releases/download/goodreads-v$pkgver/goodreads-v$pkgver.zip")
noextract=("goodreads-v$pkgver.zip")
sha256sums=('70c6bddfd7575f4f77ec7e4bed0fcd9bea0c64bbfee87fcffdde490caaa1f292')

package() {
	install -m644 -D "${srcdir}/goodreads-v$pkgver.zip" "${pkgdir}/usr/share/calibre/system-plugins/goodreads-v$pkgver.zip"
}
