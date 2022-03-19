# Maintainer: Piero Estéfano Rojas Effio <pierorojas@tutamail.com>

pkgname='ptree'
pkgver=1.2.1
pkgrel=1
pkgdesc='A tree directory visualizer'
arch=('x86_64' 'armv7a')
url='https://github.com/ICanOnlySuffer/ptree'
license=('MIT')
groups=('pocha')

source=("$url/archive/refs/tags/v$pkgver.tar.gz")

package () {
	cd $pkgname-$pkgver
	make && make install DEST_DIR=$pkgdir && make clean
}

