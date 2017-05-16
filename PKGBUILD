# Maintainer: dmitry.romanov <dmitry.romanov85@gmail.com>
# Maintainer: Michael Herrmann <michael+removethisifyouarehuman@herrmann.io>

pkgname=fman
pkgver=0.4.5
pkgrel=1
pkgdesc="A modern file manager for power users. Beautiful, fast and extensible"
arch=('x86_64')
url="https://fman.io"
license=('custom')
depends=('qt5-base' 'openssl')
optdepends=('qt5-svg')

source=('https://fman.io/updates/arch/fman-0.4.5.pkg.tar.xz')
noextract=("${source[@]##*/}")

sha256sums=('83965b2de3b34331c92cd1cd4f0a3bd7e2095a495c2e3aaf9d53304528b537f2')

package() {
	tar xf "${srcdir}/fman-0.4.5.pkg.tar.xz" -C "${pkgdir}" --exclude='.INSTALL' --exclude='.PKGINFO' --exclude='.MTREE'
}
