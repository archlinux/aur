# Maintainer: Piero Rojas <pierorojas@tutamail.com>

pkgname='connect-4'
pkgver=0.1.2
pkgrel=1
pkgdesc='Simple four in a row game made with SDL2'
arch=('x86_64')
makedepends=('libpocha' 'libpaca')
license=('GPLv3')
url="https://gitlab.com/ICanOnlySuffer/$pkgname"

source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('314e22748d0f8f0282d2571be43e11d7c74a126bf5e4f9575afbf10e2c7a1c0b')

package () {
	make -C $pkgname-v$pkgver install clean INSTALL_DIR=$pkgdir
}

