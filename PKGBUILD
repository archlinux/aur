# Maintainer: Piero Estéfano Rojas Effio <pierorojas@tutamail.com>

pkgname='ptv'
pkgver=1.5.0
pkgrel=2
pkgdesc='A tree directory visualizer'
arch=('x86_64' 'armv7a')
makedepends=('pul')
license=('MIT')
groups=('pocha')
url="https://github.com/ICanOnlySuffer/$pkgname"

source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package () {
	make -C $pkgname-$pkgver install clean DIR_INSTALL=$pkgdir
}

