# Maintainer: Piero Estéfano Rojas Effio <pierorojas@tutamail.com>

pkgname='ptv'
pkgver=1.4.0
pkgrel=1
pkgdesc='A tree directory visualizer'
arch=('x86_64' 'armv7a')
makedepends=('pul')
license=('MIT')
groups=('pochita')
url='https://github.com/ICanOnlySuffer/ptv'

source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package () {
	make -C $pkgname-$pkgver install clean DEST_DIR=$pkgdir
}

