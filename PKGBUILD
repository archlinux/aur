# Maintainer: Piero Rojas <pierorojas@tutamail.com>

pkgname='libpocha'
pkgver=0.7.0
pkgrel=1
pkgdesc='Static utilities library for C and FASM'
arch=('x86_64' 'armv7a')
makedepends=('fasm')
license=('GPLv3')
groups=('pocha')
url="https://gitlab.com/ICanOnlySuffer/$pkgname"

source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('b991910fd6638a90043b93feae3f8cf305e0aa9dc6b1375f3bfdf1bfeccf4f37')

package () {
	make -C $pkgname-v$pkgver install clean INSTALL_DIR=$pkgdir
}

