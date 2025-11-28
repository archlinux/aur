# Maintainer: Grant Moyer <youremail@domain.com>
pkgname=calibre-plugin-goodreads
pkgver=1.8.3
pkgrel=1
pkgdesc="Downloads metadata and covers from Goodreads - Calibre Plugin"
arch=('any')
url="https://github.com/kiwidude68/calibre_plugins/tree/main/goodreads"
license=('GPL3')
depends=('calibre>=2.0.0')
source=("https://github.com/kiwidude68/calibre_plugins/releases/download/goodreads-v$pkgver/goodreads-v$pkgver.zip")
noextract=("goodreads-v$pkgver.zip")
sha256sums=('110479f90775113cded797b593f78e1eef0ae9c9ac6224a2879815862c40e9f4')

package() {
	install -m644 -D "${srcdir}/goodreads-v$pkgver.zip" "${pkgdir}/usr/share/calibre/system-plugins/goodreads-v$pkgver.zip"
}
