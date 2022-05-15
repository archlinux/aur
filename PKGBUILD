# Maintainer: Piero Estéfano Rojas Effio <pierorojas@tutamail.com>

pkgname='ptv'
pkgver=1.6.0
pkgrel=4
pkgdesc='A tree directory visualizer'
arch=('x86_64' 'armv7a')
makedepends=('pul')
license=('GPLv3')
groups=('pocha')
url="https://gitlab.com/ICanOnlySuffer/$pkgname"

source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('a1e95d0eb4584ef49645dacf6223050aac4a863e0029c306b4c0982d94eff1c2')

package () {
	make -C $pkgname-v$pkgver install clean INSTALL_DIR=$pkgdir
}

