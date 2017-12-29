# Maintainer: dmitry.romanov <dmitry.romanov85@gmail.com>
# Maintainer: Michael Herrmann <michael+removethisifyouarehuman@herrmann.io>

pkgname=fman
pkgver=0.8.1
pkgrel=1
pkgdesc="A modern file manager for power users. Beautiful, fast and extensible"
arch=('x86_64')
url="https://fman.io"
license=('custom')
depends=('qt5-base' 'p7zip')
optdepends=('qt5-svg')

source=('https://fman.io/updates/arch/fman-0.8.1.pkg.tar.xz')
noextract=("${source[@]##*/}")

sha256sums=('a2f15c20a5fd39d8e7baaa58da20784bd1dba8e5d38f07a5a230cb40120e12a7')

package() {
	tar xf "${srcdir}/fman-0.8.1.pkg.tar.xz" -C "${pkgdir}" --exclude='.INSTALL' --exclude='.PKGINFO' --exclude='.MTREE'
}
