# Maintainer: dmitry.romanov <dmitry.romanov85@gmail.com>
# Maintainer: Michael Herrmann <michael+removethisifyouarehuman@herrmann.io>

pkgname=fman
pkgver=0.7.7
pkgrel=1
pkgdesc="A modern file manager for power users. Beautiful, fast and extensible"
arch=('x86_64')
url="https://fman.io"
license=('custom')
depends=('qt5-base' 'p7zip')
optdepends=('qt5-svg')

source=('https://fman.io/updates/arch/fman-0.7.7.pkg.tar.xz')
noextract=("${source[@]##*/}")

sha256sums=('1cd9a211948dcfa9d5e1d898ff1677aa02fd8840e361dd7ca29b5e7518ef8ee7')

package() {
	tar xf "${srcdir}/fman-0.7.7.pkg.tar.xz" -C "${pkgdir}" --exclude='.INSTALL' --exclude='.PKGINFO' --exclude='.MTREE'
}
