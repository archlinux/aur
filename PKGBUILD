# Maintainer: dmitry.romanov <dmitry.romanov85@gmail.com>
# Maintainer: Michael Herrmann <michael+removethisifyouarehuman@herrmann.io>

pkgname=fman
pkgver=0.6.9
pkgrel=1
pkgdesc="A modern file manager for power users. Beautiful, fast and extensible"
arch=('x86_64')
url="https://fman.io"
license=('custom')
depends=('qt5-base')
optdepends=('qt5-svg')

source=('https://fman.io/updates/arch/fman-0.6.9.pkg.tar.xz')
noextract=("${source[@]##*/}")

sha256sums=('13c192b6084eee5e8ab9d5a8be4dc10594bfccdb169b5df84c7685ce279f3b9f')

package() {
	tar xf "${srcdir}/fman-0.6.9.pkg.tar.xz" -C "${pkgdir}" --exclude='.INSTALL' --exclude='.PKGINFO' --exclude='.MTREE'
}
