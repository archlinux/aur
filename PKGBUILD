# Maintainer: Piero Rojas <pierorojas@tutamail.com>

pkgname='libpocha'
pkgver=0.8.0
pkgrel=1
pkgdesc='Static utilities library for C and FASM'
arch=('x86_64' 'armv7a')
makedepends=('fasm')
license=('GPLv3')
groups=('pocha')
url="https://gitlab.com/ICanOnlySuffer/$pkgname"

source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('aae86215c50c8e25365a2afae0fd01d29a278a1ce26cf3cb46d888fbb95e5fed')

package () {
	make -C $pkgname-v$pkgver install clean INSTALL_DIR=$pkgdir
}

