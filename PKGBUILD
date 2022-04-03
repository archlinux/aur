# Maintainer: Piero Estéfano Rojas Effio <pierorojas@tutamail.com>

pkgname='pul'
pkgver=0.3.0
pkgrel=1
pkgdesc='C utils library for the average project'
arch=('x86_64' 'armv7a')
makedepends=('nasm')
license=('MIT')
groups=('pochita')
url='https://github.com/ICanOnlySuffer/pul'

source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package () {
	make -C $pkgname-$pkgver install clean DEST_DIR=$pkgdir
}

