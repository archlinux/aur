# Maintainer: Piero Estéfano Rojas Effio <pierorojas@tutamail.com>

pkgname='connect-4'
pkgver=0.1.0
pkgrel=3
pkgdesc='A simple four in a row game made with SDL2'
arch=('x86_64')
makedepends=('pge')
license=('GPLv3')
groups=('pocha')
url="https://gitlab.com/ICanOnlySuffer/$pkgname"

source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('baca99ab45b6833a208072bad623fe2a30fa34e08ecc6b916558a074ad6bb13f')

package () {
	make -C $pkgname-v$pkgver install clean INSTALL_DIR=$pkgdir
}

