# Maintainer: Grant Moyer <youremail@domain.com>
pkgname=calibre-plugin-goodreads
pkgver=1.5.3
pkgrel=1
pkgdesc="Downloads metadata and covers from Goodreads - Calibre Plugin"
arch=('any')
url="https://www.mobileread.com/forums/showthread.php?t=130638"
license=('custom')
depends=('calibre>=0.8.1')
source=("Goodreads-$pkgver.zip::https://plugins.calibre-ebook.com/130638.zip")
noextract=("Goodreads-$pkgver.zip")
sha256sums=('757ed8c90c940e3f676ac5c46539c1d895e8654c9744c98de504ee40bde2ba29')

package() {
	install -m644 -D "${srcdir}/Goodreads-$pkgver.zip" "${pkgdir}/usr/share/calibre/system-plugins/Goodreads.zip"
}
