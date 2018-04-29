# Maintainer: Einar Gangsø <mail@einargangso.no>

pkgname=mediasort
pkgver=0.12.2
pkgrel=1
pkgdesc='A command line tool for sorting media files'

url='https://github.com/eigan/mediasort'
arch=('any')
license=('GPLv2')

depends=('php>=7.2')

source=("https://github.com/eigan/mediasort/releases/download/${pkgver}/mediasort.phar")
sha256sums=("cfabaebb50abed980ba336d179309b427746478f932476b59c796b6beecd3e95")


package() {
	cd "$srcdir"
	install -Dm 755 mediasort.phar $pkgdir/usr/bin/mediasort
}