# Maintainer: Piero Rojas <pierorojas@tutamail.com>

pkgname='libpocha'
pkgver=0.7.1
pkgrel=1
pkgdesc='Static utilities library for C and FASM'
arch=('x86_64' 'armv7a')
makedepends=('fasm')
license=('GPLv3')
groups=('pocha')
url="https://gitlab.com/ICanOnlySuffer/$pkgname"

source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('3db1cfdb59aabba624675cf850fe257dcd8aa41a513859ac5d9cb64e64784532')

package () {
	make -C $pkgname-v$pkgver install clean INSTALL_DIR=$pkgdir
}

