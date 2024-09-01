# Maintainer: Grant Moyer <youremail@domain.com>
pkgname=calibre-plugin-goodreads
pkgver=1.8.2
pkgrel=1
pkgdesc="Downloads metadata and covers from Goodreads - Calibre Plugin"
arch=('any')
url="https://github.com/kiwidude68/calibre_plugins/tree/main/goodreads"
license=('GPL3')
depends=('calibre>=2.0.0')
source=("https://github.com/kiwidude68/calibre_plugins/releases/download/goodreads-v$pkgver/goodreads-v$pkgver.zip")
noextract=("goodreads-v$pkgver.zip")
sha256sums=('382903d34ed341a232dabca32592bd9070db83d19fecd397e4f6bdace0a0b22d')

package() {
	install -m644 -D "${srcdir}/goodreads-v$pkgver.zip" "${pkgdir}/usr/share/calibre/system-plugins/goodreads-v$pkgver.zip"
}
