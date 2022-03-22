# Maintainer: Piero Estéfano Rojas Effio <pierorojas@tutamail.com>

pkgname='putils'
pkgver=0.2.0
pkgrel=2
pkgdesc='C utils library for the average project'
arch=('x86_64' 'armv7a')
makedepends=('nasm')
license=('MIT')
groups=('pocha')
url='https://github.com/ICanOnlySuffer/putils'

source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package () {
	cd $pkgname-$pkgver && make install DEST_DIR=$pkgdir && make clean
}

