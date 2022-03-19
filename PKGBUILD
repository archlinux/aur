# Maintainer: Piero Estéfano Rojas Effio <pierorojas@tutamail.com>

pkgname='ptree'
pkgver=1.2.0
pkgrel=1
pkgdesc='A tree directory visualizer'
arch=('x86_64')
url='https://github.com/ICanOnlySuffer/ptree'
license=('MIT')
groups=('pocha')

source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha1sums=('5b736328338d8f28ac70d22e99efce837f63114e')

package () {
	cd $pkgname-$pkgver
	make && make install DEST_DIR=$pkgdir && make clean
}

