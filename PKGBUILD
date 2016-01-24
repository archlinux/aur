# Author: Einhard Leichtfuß <respiranto@icloud.com>
pkgname=ctct
pkgver=0.1.2
pkgrel=2
pkgdesc="a simple console contact manager"
arch=('any')
url="https://respiranto.de/bash"
license=('AGPL3')
backup=('etc/ctct/config.sh')
source=("https://respiranto.de/bash/${pkgname}_v$pkgver.tar.xz")
md5sums=('fcee4a18e2fbf4b3f2514c685a0a8848')

build()
{
	cd "${pkgname}_v$pkgver"
	./configure prefix=/usr sysconfdir=/etc
}

package()
{
	cd "${pkgname}_v$pkgver"
	make DESTDIR="$pkgdir" install
}
