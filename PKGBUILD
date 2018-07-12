# Maintainer: dmitry.romanov <dmitry.romanov85@gmail.com>
# Maintainer: Michael Herrmann <michael+removethisifyouarehuman@herrmann.io>

pkgname=fman
pkgver=1.1.3
pkgrel=1
pkgdesc="A modern file manager for power users. Beautiful, fast and extensible"
arch=('x86_64')
url="https://fman.io"
license=('custom')
depends=('qt5-base' 'p7zip')
optdepends=('qt5-svg')

source=('https://fman.io/updates/arch/fman-1.1.3.pkg.tar.xz')
noextract=("${source[@]##*/}")

sha256sums=('33e7a686898a974e2dfe49b5b7a1a91ea3bcdfdc8b5bbce9da670f2f9f7ddfae')

package() {
	tar xf "${srcdir}/fman-1.1.3.pkg.tar.xz" -C "${pkgdir}" --exclude='.INSTALL' --exclude='.PKGINFO' --exclude='.MTREE'
}
