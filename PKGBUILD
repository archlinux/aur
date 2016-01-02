# Author: Einhard Leichtfuß <respiranto@icloud.com>
pkgname=ctct
pkgver=0.1.1
pkgrel=1
pkgdesc="a simple console contact manager"
arch=('any')
url="https://respiranto.de/bash"
license=('AGPL')
backup=('etc/ctct/config.sh')
source=("https://respiranto.de/bash/${pkgname}_v$pkgver.tar.xz")
md5sums=('e5202502c42b6e1f11cba4b37ac8ea1d')

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
