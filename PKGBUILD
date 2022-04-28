# Maintainer: Piero Estéfano Rojas Effio <pierorojas@tutamail.com>

pkgname='pul'
pkgver=0.4.0
pkgrel=1
pkgdesc='C utils library for the average project'
arch=('x86_64' 'armv7a')
makedepends=('nasm')
license=('MIT')
groups=('pocha')
url="https://gitlab.com/ICanOnlySuffer/$pkgname"

source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('SKIP')

package () {
	make -C $pkgname-$pkgver install clean DIR_INSTALL=$pkgdir
}

