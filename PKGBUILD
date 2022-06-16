# Maintainer: Piero Rojas <pierorojas@tutamail.com>

pkgname='pocha-dir-list'
pkgver=1.7.0
pkgrel=1
pkgdesc='Terminal application to list files in a directory in a tree'
arch=('x86_64' 'armv7a')
makedepends=('libpocha')
license=('GPLv3')
groups=('pocha')
url="https://gitlab.com/ICanOnlySuffer/$pkgname"

source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('fd33b6fe882fc53bb69eeee2e62bce74b5dda6d39965190b7780414e70e9f516')

package () {
	make -C $pkgname-v$pkgver install clean INSTALL_DIR=$pkgdir
}

