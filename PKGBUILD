# Maintainer: Piero Estéfano Rojas Effio <pierorojas@tutamail.com>

pkgname='connect-4'
pkgver=0.1.1
pkgrel=1
pkgdesc='A simple four in a row game made with SDL2'
arch=('x86_64')
makedepends=('pge' 'pul')
license=('GPLv3')
url="https://gitlab.com/ICanOnlySuffer/$pkgname"

source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('27d6e4a573081f0225e5f0c20900c983d0940fe29653df5a777213305b3bb64f')

package () {
	make -C $pkgname-v$pkgver install clean INSTALL_DIR=$pkgdir
}

