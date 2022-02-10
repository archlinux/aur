# Maintainer: Piero Estéfano Rojas Effio <pierorojas@tutamail.com>

pkgname='ptree'
pkgver=1.1.3
pkgrel=1
pkgdesc='A tree directory visualizer'
arch=('x86_64')
url='https://github.com/ICanOnlySuffer/ptree'
license=('MIT')
groups=('pocha')

source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha1sums=('199d68e37858f5e1e3ec60158ef4c1c1ed9d5682')

package () {
	cd $pkgname-$pkgver
	make DESTDIR=$pkgdir install
}

