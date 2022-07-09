# Maintainer: Piero Rojas <pierorojas@tutamail.com>

pkgname='connect-4'
pkgver=0.1.3
pkgrel=1
pkgdesc='Simple four in a row game made with SDL2'
arch=('x86_64')
makedepends=('libpocha' 'libpaca')
license=('GPLv3')
url="https://gitlab.com/ICanOnlySuffer/$pkgname"

source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('0b790e35eb3b8fb2ab4de934c41db04d581ee11d86675cce3fbb80648aa93949')

package () {
	make -C $pkgname-v$pkgver install clean INSTALL_DIR=$pkgdir
}

