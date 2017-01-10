# Maintainer: Magno-Tutor
pkgname=hashcode-en
pkgver=1.0
pkgrel=1
pkgdesc="Its purpose is to encode and decode strings."
arch=('any')
depends=('python')
install=hashcode.install
url="https://github.com/Sup3r-Us3r/HashCode"
conflicts=('hashcode-pt')

source=('hashcode-en.py')

md5sums=('0c71c0b61b5615dbcb64a478b4698dee')

package() {
	
	install -D hashcode-en.py "${pkgdir}/usr/bin/hashcode"

}