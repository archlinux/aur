# Maintainer: Piero Estéfano Rojas Effio <pierorojas@tutamail.com>

pkgname='ptv'
pkgver=1.5.0
pkgrel=1
pkgdesc='A tree directory visualizer'
arch=('x86_64' 'armv7a')
makedepends=('pul')
license=('MIT')
groups=('pocha')
url="https://gitlab.com/ICanOnlySuffer/$pkname"

source=("$url/-/archive/v$pkgver/v$pkgname-v$pkgver.tar.gz")
sha256sums=('SKIP')

package () {
	make -C $pkgname-$pkgver install clean DIR_INSTALL=$pkgdir
}

