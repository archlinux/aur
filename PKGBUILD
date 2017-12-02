# Maintainer: Einar Gangsø <mail@einargangso.no>

pkgname=mediasort
pkgver=0.11.1
pkgrel=1
pkgdesc='A command line tool for sorting media files'

url='https://github.com/eigan/mediasort'
arch=('any')
license=('GPLv2')

depends=('php>=7.0')

source=("https://github.com/eigan/mediasort/releases/download/${pkgver}/mediasort.phar")
sha256sums=("0ca0e66b85cf0c6dd4f79a25e33e3cf29036969d24d875c8b1b65547218a9f3a")


package() {
	cd "$srcdir"
	install -Dm 755 mediasort.phar $pkgdir/usr/bin/mediasort
}