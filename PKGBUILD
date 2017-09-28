# Maintainer: Adam Jedlička <adajedlicka@gmail.com>
pkgname="filius"
pkgver="1.7.2"
_pkgver="1.7.2-2"
pkgrel=1
pkgdesc="Network simulation program"
arch=('any')
url="http://www.lernsoftware-filius.de"
license=('GPL')
depends=('java-environment>=8')
source=(http://www.lernsoftware-filius.de/downloads/$pkgname-$_pkgver.noarch.rpm)
sha1sums=("f79f7a56126aabbcf3a325e840dee182a30287d3")

package() {
	cd $srcdir
	cp -r usr/ etc/ $pkgdir
}

