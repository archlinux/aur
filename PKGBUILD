# Maintainer: dmitry.romanov <dmitry.romanov85@gmail.com>
# Maintainer: Michael Herrmann <michael+removethisifyouarehuman@herrmann.io>

pkgname=fman
pkgver=1.2.8
pkgrel=1
pkgdesc="A modern file manager for power users. Beautiful, fast and extensible"
arch=('x86_64')
url="https://fman.io"
license=('custom')
depends=('qt5-base' 'p7zip')
optdepends=('qt5-svg')

source=('https://fman.io/updates/arch/fman-1.2.8.pkg.tar.xz')
noextract=("${source[@]##*/}")

sha256sums=('a3f4cd5886ad4a2be662c43a7d23cf1e783f20cd89feb0bce9b87b11311897a5')

package() {
	tar xf "${srcdir}/fman-1.2.8.pkg.tar.xz" -C "${pkgdir}" --exclude='.INSTALL' --exclude='.PKGINFO' --exclude='.MTREE'
}
