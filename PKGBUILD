# Maintainer: dmitry.romanov <dmitry.romanov85@gmail.com>
# Maintainer: Michael Herrmann <michael+removethisifyouarehuman@herrmann.io>

pkgname=fman
pkgver=0.6.6
pkgrel=1
pkgdesc="A modern file manager for power users. Beautiful, fast and extensible"
arch=('x86_64')
url="https://fman.io"
license=('custom')
depends=('qt5-base')
optdepends=('qt5-svg')

source=('https://fman.io/updates/arch/fman-0.6.6.pkg.tar.xz')
noextract=("${source[@]##*/}")

sha256sums=('6b75059a07768fb7fbef39121c054a4b9b9525a10b1f98ba1fbfd0c05de31ec2')

package() {
	tar xf "${srcdir}/fman-0.6.6.pkg.tar.xz" -C "${pkgdir}" --exclude='.INSTALL' --exclude='.PKGINFO' --exclude='.MTREE'
}
