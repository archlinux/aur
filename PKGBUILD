# Maintainer: Einar Gangsø <mail@einargangso.no>

pkgname=mediasort
pkgver=0.12
pkgrel=1
pkgdesc='A command line tool for sorting media files'

url='https://github.com/eigan/mediasort'
arch=('any')
license=('GPLv2')

depends=('php>=7.0')

source=("https://github.com/eigan/mediasort/releases/download/${pkgver}/mediasort.phar")
sha256sums=("931395bf18aab7773b3a9bc85aeb4ee8ed602cddbfd74aaa7579256977ff1f46")


package() {
	cd "$srcdir"
	install -Dm 755 mediasort.phar $pkgdir/usr/bin/mediasort
}