# Maintainer: Piero Rojas <pierorojas@tutamail.com>

pkgname='maneki-fetch'
pkgver=0.2.0
pkgrel=1
pkgdesc='A lightweight system information tool'
arch=('x86_64')
makedepends=('ruby')
license=('GPLv3')
groups=('maneki')
url="https://gitlab.com/ICanOnlySuffer/$pkgname"

source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('afc9937399a75354b8600184e21c6f1425b63824378a5a3c3a7be8bc538b668f')

package () {
	make -C $pkgname-v$pkgver install clean INSTALL_DIR=$pkgdir \
		OS=archlinux
}

