# Maintainer: Piero Estéfano Rojas Effio <pierorojas@tutamail.com>

pkgname='pul'
pkgver=0.5.0
pkgrel=3
pkgdesc='C utils library for the average project'
arch=('x86_64' 'armv7a')
makedepends=('nasm')
license=('GPLv3')
groups=('pocha')
url="https://gitlab.com/ICanOnlySuffer/$pkgname"

source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('400822d541c79343e12b4d5de94a6a44de694397949f1be433f89699afd8135f')

package () {
	make -C $pkgname-v$pkgver install clean INSTALL_DIR=$pkgdir
}

