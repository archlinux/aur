# Maintainer: Einar Gangsø <mail@einargangso.no>

pkgname=mediasort
pkgver=2.0.1
pkgrel=1
pkgdesc='A command line tool for sorting media files'

url='https://github.com/eigan/mediasort'
arch=('any')
license=('GPLv2')

depends=('php>=7.0')

source=("https://github.com/eigan/mediasort/releases/download/${pkgver}/mediasort.phar")
sha256sums=("fad7bdcd9dc4575ed4f176cab5483faee75f7cd2bcc068a841fa45c35957971a")


package() {
	cd "$srcdir"
	install -Dm 755 mediasort.phar $pkgdir/usr/bin/mediasort
}