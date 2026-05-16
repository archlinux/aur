# Maintainer: Origuchi <tobiichioriguchi@gmail.com>
pkgname=flix-bin
pkgver=2.0.6.111
pkgrel=1
pkgdesc="像聊天一样传文件，新一代局域网全端传输工具"
arch=('x86_64')
url="https://github.com/Tobiichi-Origuchi/flix-bin"
license=('custom:proprietary')
depends=()
optdepends=()
provides=()
conflicts=()
source=()
sha256sums=()
noextract=()

package() {
	bsdtar --exclude='.PKGINFO' --exclude='.BUILDINFO' --exclude='.MTREE' --exclude='.INSTALL' \
	    -xpf "\$srcdir/${PKG_BASENAME}" -C "\$pkgdir"
}
