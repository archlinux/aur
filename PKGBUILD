# Maintainer: dmitry.romanov <dmitry.romanov85@gmail.com>
# Maintainer: Michael Herrmann <michael+removethisifyouarehuman@herrmann.io>

pkgname=fman
pkgver=1.2.6
pkgrel=1
pkgdesc="A modern file manager for power users. Beautiful, fast and extensible"
arch=('x86_64')
url="https://fman.io"
license=('custom')
depends=('qt5-base' 'p7zip')
optdepends=('qt5-svg')

source=('https://fman.io/updates/arch/fman-1.2.6.pkg.tar.xz')
noextract=("${source[@]##*/}")

sha256sums=('4aab645a0e8b12c86ad79ad6e4906ddb8440a580dda0dc8fac284e5db02232e0')

package() {
	tar xf "${srcdir}/fman-1.2.6.pkg.tar.xz" -C "${pkgdir}" --exclude='.INSTALL' --exclude='.PKGINFO' --exclude='.MTREE'
}
