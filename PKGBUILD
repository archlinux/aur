# Maintainer: Piero Estéfano Rojas Effio <pierorojas@tutamail.com>

pkgname='connect-4'
pkgver=0.1.0
pkgrel=2
pkgdesc='A simple four in a row game made with SDL2'
arch=('x86_64')
makedepends=('pge')
license=('GPLv3')
groups=('pocha')
url="https://gitlab.com/ICanOnlySuffer/$pkgname"

source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('769d275fe2a08001056a4d581c68903da576ecf51815999313e22e3f6f882d56')

package () {
	make -C $pkgname-v$pkgver install clean INSTALL_DIR=$pkgdir
}

