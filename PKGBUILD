# Maintainer: dmitry.romanov <dmitry.romanov85@gmail.com>
# Maintainer: Michael Herrmann <michael+removethisifyouarehuman@herrmann.io>

pkgname=fman
pkgver=1.5.3
pkgrel=1
pkgdesc="A modern file manager for power users. Beautiful, fast and extensible"
arch=('x86_64')
url="https://fman.io"
license=('custom')
depends=('qt5-base' 'p7zip')
optdepends=('qt5-svg')

source=('https://fman.io/updates/arch/fman-1.5.3.pkg.tar.xz')
noextract=("${source[@]##*/}")

sha256sums=('7513c0b5484cc65e4eec3788039343ae1648df182e7b81cb85319985674d2599')

package() {
	tar xf "${srcdir}/fman-1.5.3.pkg.tar.xz" -C "${pkgdir}" --exclude='.INSTALL' --exclude='.PKGINFO' --exclude='.MTREE'
}
