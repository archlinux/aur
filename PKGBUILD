# Maintainer: Piero Estéfano Rojas Effio <pierorojas@tutamail.com>

pkgname='ptv'
pkgver=1.6.0
pkgrel=2
pkgdesc='A tree directory visualizer'
arch=('x86_64' 'armv7a')
makedepends=('pul')
license=('GPLv3')
groups=('pocha')
url="https://gitlab.com/ICanOnlySuffer/$pkgname"

source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('SKIP')

package () {
	make -C $pkgname-$pkgver install clean INSTALL_DIR=$pkgdir
}

