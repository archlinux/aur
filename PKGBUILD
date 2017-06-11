# Maintainer: dmitry.romanov <dmitry.romanov85@gmail.com>
# Maintainer: Michael Herrmann <michael+removethisifyouarehuman@herrmann.io>

pkgname=fman
pkgver=0.5.1
pkgrel=1
pkgdesc="A modern file manager for power users. Beautiful, fast and extensible"
arch=('x86_64')
url="https://fman.io"
license=('custom')
depends=('qt5-base')
optdepends=('qt5-svg')

source=('https://fman.io/updates/arch/fman-0.5.1.pkg.tar.xz')
noextract=("${source[@]##*/}")

sha256sums=('0d69e4d529dcc29f0e83623cdc2823b008e69b9a43345626af8be8fde06d4b77')

package() {
	tar xf "${srcdir}/fman-0.5.1.pkg.tar.xz" -C "${pkgdir}" --exclude='.INSTALL' --exclude='.PKGINFO' --exclude='.MTREE'
}
