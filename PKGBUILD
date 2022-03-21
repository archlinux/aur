# Maintainer: Piero Estéfano Rojas Effio <pierorojas@tutamail.com>

pkgname='ptree'
pkgver=1.2.2
pkgrel=1
pkgdesc='A tree directory visualizer'
arch=('x86_64' 'armv7a')
makedepends=('nasm')
url='https://github.com/ICanOnlySuffer/ptree'
license=('MIT')
groups=('pocha')

source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package () {
	cd $pkgname-$pkgver
	make && make install DEST_DIR=$pkgdir && make clean
}

