# Maintainer: dmitry.romanov <dmitry.romanov85@gmail.com>
# Maintainer: Michael Herrmann <michael+removethisifyouarehuman@herrmann.io>

pkgname=fman
pkgver=1.0.5
pkgrel=1
pkgdesc="A modern file manager for power users. Beautiful, fast and extensible"
arch=('x86_64')
url="https://fman.io"
license=('custom')
depends=('qt5-base' 'p7zip')
optdepends=('qt5-svg')

source=('https://fman.io/updates/arch/fman-1.0.5.pkg.tar.xz')
noextract=("${source[@]##*/}")

sha256sums=('ad178274b02cca8d7aa3d59b1dac860c65df27938494bb9a1761ad4a1566dbcd')

package() {
	tar xf "${srcdir}/fman-1.0.5.pkg.tar.xz" -C "${pkgdir}" --exclude='.INSTALL' --exclude='.PKGINFO' --exclude='.MTREE'
}
