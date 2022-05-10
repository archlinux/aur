# Maintainer: Piero Estéfano Rojas Effio <pierorojas@tutamail.com>

pkgname='pul'
pkgver=0.5.0
pkgrel=2
pkgdesc='C utils library for the average project'
arch=('x86_64' 'armv7a')
makedepends=('nasm')
license=('GPLv3')
groups=('pocha')
url="https://gitlab.com/ICanOnlySuffer/$pkgname"

source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('SKIP')

package () {
	make -C $pkgname-v$pkgver install clean INSTALL_DIR=$pkgdir
}

