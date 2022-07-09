# Maintainer: Piero Rojas <pierorojas@tutamail.com>

pkgname='pocha-dir-list'
pkgver=1.7.1
pkgrel=1
pkgdesc='Terminal application to list files in a directory in a tree'
arch=('x86_64' 'armv7a')
makedepends=('libpocha')
license=('GPLv3')
groups=('pocha')
url="https://gitlab.com/ICanOnlySuffer/$pkgname"

source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('c60d8c35c9804ca64c5af4ac7054e23d387a5cf21c643bf0e97c577d9e956722')

package () {
	make -C $pkgname-v$pkgver install clean INSTALL_DIR=$pkgdir
}

