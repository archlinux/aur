# Maintainer: dmitry.romanov <dmitry.romanov85@gmail.com>
# Maintainer: Michael Herrmann <michael+removethisifyouarehuman@herrmann.io>

pkgname=fman
pkgver=0.5.9
pkgrel=1
pkgdesc="A modern file manager for power users. Beautiful, fast and extensible"
arch=('x86_64')
url="https://fman.io"
license=('custom')
depends=('qt5-base')
optdepends=('qt5-svg')

source=('https://fman.io/updates/arch/fman-0.5.9.pkg.tar.xz')
noextract=("${source[@]##*/}")

sha256sums=('5dcf5a401c3672b85fbda186ae828e4456cea4a7aa52d4cf395c38dc36801ab8')

package() {
	tar xf "${srcdir}/fman-0.5.9.pkg.tar.xz" -C "${pkgdir}" --exclude='.INSTALL' --exclude='.PKGINFO' --exclude='.MTREE'
}
