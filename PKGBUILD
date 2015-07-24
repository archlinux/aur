# Contributor: Markus Pargmann <scosu@gmx.de>
# Contrinutor: Anton Leontiev <scileont /at/ gmail.com>

pkgname=pmars
pkgver=0.9.2
pkgrel=2
pkgdesc="Reference implementation of Corewar game"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/corewar/"
license=('GPL2')
depends=(libx11)
source=(http://downloads.sourceforge.net/project/corewar/pMARS/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('a73943a34e9de8f0d3028fc4566cd558')

build() {
	cd pmars-$pkgver/src
	make
}

package() {
	cd $pkgname-$pkgver/src
	install -D -m 0755 pmars "$pkgdir/usr/bin/pmars"
}
