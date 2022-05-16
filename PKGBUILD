# Maintainer: Piero Estéfano Rojas Effio <pierorojas@tutamail.com>

pkgname='psf'
pkgver=0.1.0
pkgrel=1
pkgdesc='A lightweight system information tool'
arch=('x86_64' 'armv7a')
makedepends=('ruby')
license=('GPLv3')
groups=('pocha')
url="https://gitlab.com/ICanOnlySuffer/$pkgname"

source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('d8f872b08afa62755b35ddf567db0e8653b4990bc956a43e3d6b38d2b50ee83c')

package () {
	make -C $pkgname-v$pkgver install clean INSTALL_DIR=$pkgdir \
		OS=archlinux
}

