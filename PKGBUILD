# Maintainer: Piero Estéfano Rojas Effio <pierorojas@tutamail.com>

pkgname='ptree'
pkgver=1.1.4
pkgrel=1
pkgdesc='A tree directory visualizer'
arch=('x86_64')
url='https://github.com/ICanOnlySuffer/ptree'
license=('MIT')
groups=('pocha')

source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha1sums=('85f0e4a6484646daf181145f11b4c0031d61a215')

package () {
	cd $pkgname-$pkgver
	make DESTDIR=$pkgdir install
}

