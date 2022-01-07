# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=sedsed
pkgver=2.0.0
pkgrel=2
pkgdesc='Debugger and code formatter for sed scripts'
arch=('any')
depends=('python' 'sedparse')
url='https://github.com/aureliojargas/sedsed'
license=('GPL')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aureliojargas/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a18cae4348adb955641912fd854a5f17d9767646d1f6721e664c4ad5e9476a85')

package() {
	install -D -m0755 ${srcdir}/sedsed-${pkgver}/sedsed.py ${pkgdir}/usr/bin/sedsed
}

