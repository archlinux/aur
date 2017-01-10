# Maintainer: Magno-Tutor
pkgname=hashcode-pt
pkgver=1.0
pkgrel=1
pkgdesc="Tem como objetivo codificar e decodificar strings."
arch=('any')
depends=('python')
install=hashcode.install
url="https://github.com/Sup3r-Us3r/HashCode"
conflicts=('hashcode-en')

source=('hashcode-pt.py')

md5sums=('30c0b2f24cd677e17d6aa97b74070272')

package() {
	
	install -D hashcode-pt.py "${pkgdir}/usr/bin/hashcode"

}