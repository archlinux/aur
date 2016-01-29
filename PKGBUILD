# Author: Einhard Leichtfuß <respiranto@icloud.com>
pkgname=ctct
pkgver=0.2.1
pkgrel=1
pkgdesc="a simple console contact manager"
arch=('any')
url="https://respiranto.de/bash"
license=('AGPL3')
backup=('etc/ctct/config.sh')
source=("https://respiranto.de/bash/${pkgname}_v$pkgver.tar.xz")
md5sums=('c3f12430454ae1e4e31b2b85d54b89ca')

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
