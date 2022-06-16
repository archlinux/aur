# Maintainer: Piero Rojas <pierorojas@tutamail.com>

pkgname='pocha-dir-list'
pkgver=1.7.0
pkgrel=3
pkgdesc='Terminal application to list files in a directory in a tree'
arch=('x86_64' 'armv7a')
makedepends=('libpocha')
license=('GPLv3')
groups=('pocha')
url="https://gitlab.com/ICanOnlySuffer/$pkgname"

source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('a1ba86ad4977dedc0cfc08040a1bb50ccd1a02df11c9434a2c567cbbfa3d8943')

package () {
	make -C $pkgname-v$pkgver install clean INSTALL_DIR=$pkgdir
}

