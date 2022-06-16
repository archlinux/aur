# Maintainer: Piero Rojas <pierorojas@tutamail.com>

pkgname='pocha-dir-list'
pkgver=1.7.0
pkgrel=2
pkgdesc='Terminal application to list files in a directory in a tree'
arch=('x86_64' 'armv7a')
makedepends=('libpocha')
license=('GPLv3')
groups=('pocha')
url="https://gitlab.com/ICanOnlySuffer/$pkgname"

source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('31c91f3efd9d7a74ebdb99567c2d7f0fda99456b1374d03be94f5b95bbb13d9a')

package () {
	make -C $pkgname-v$pkgver install clean INSTALL_DIR=$pkgdir
}

