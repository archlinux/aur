# Maintainer: Piero Estéfano Rojas Effio <pierorojas@tutamail.com>

pkgname='ptree'
pkgver=1.3.0
pkgrel=1
pkgdesc='A tree directory visualizer'
arch=('x86_64' 'armv7a')
makedepends=('putils')
license=('MIT')
groups=('pocha')
url='https://github.com/ICanOnlySuffer/ptree'

source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package () {
	cd $pkgname-$pkgver && make install DEST_DIR=$pkgdir && make clean
}

