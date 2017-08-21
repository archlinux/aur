# Maintainer: dmitry.romanov <dmitry.romanov85@gmail.com>
# Maintainer: Michael Herrmann <michael+removethisifyouarehuman@herrmann.io>

pkgname=fman
pkgver=0.6.0
pkgrel=1
pkgdesc="A modern file manager for power users. Beautiful, fast and extensible"
arch=('x86_64')
url="https://fman.io"
license=('custom')
depends=('qt5-base')
optdepends=('qt5-svg')

source=('https://fman.io/updates/arch/fman-0.6.0.pkg.tar.xz')
noextract=("${source[@]##*/}")

sha256sums=('f9ac9baf3fa4e23713b816a1bb6f6aa8e3367e7505211738d04b52dba80230cd')

package() {
	tar xf "${srcdir}/fman-0.6.0.pkg.tar.xz" -C "${pkgdir}" --exclude='.INSTALL' --exclude='.PKGINFO' --exclude='.MTREE'
}
