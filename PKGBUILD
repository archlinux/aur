# Maintainer: dmitry.romanov <dmitry.romanov85@gmail.com>
# Maintainer: Michael Herrmann <michael+removethisifyouarehuman@herrmann.io>

pkgname=fman
pkgver=1.4.4
pkgrel=1
pkgdesc="A modern file manager for power users. Beautiful, fast and extensible"
arch=('x86_64')
url="https://fman.io"
license=('custom')
depends=('qt5-base' 'p7zip')
optdepends=('qt5-svg')

source=('https://fman.io/updates/arch/fman-1.4.4.pkg.tar.xz')
noextract=("${source[@]##*/}")

sha256sums=('5fe5e7e26a9e0d6b440a652b8959cb3f3b07e21daf57cdb5158dda15937d5f72')

package() {
	tar xf "${srcdir}/fman-1.4.4.pkg.tar.xz" -C "${pkgdir}" --exclude='.INSTALL' --exclude='.PKGINFO' --exclude='.MTREE'
}
