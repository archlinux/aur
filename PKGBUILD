# Maintainer: dmitry.romanov <dmitry.romanov85@gmail.com>
# Maintainer: Michael Herrmann <michael+removethisifyouarehuman@herrmann.io>

pkgname=fman
pkgver=0.6.2
pkgrel=1
pkgdesc="A modern file manager for power users. Beautiful, fast and extensible"
arch=('x86_64')
url="https://fman.io"
license=('custom')
depends=('qt5-base')
optdepends=('qt5-svg')

source=('https://fman.io/updates/arch/fman-0.6.2.pkg.tar.xz')
noextract=("${source[@]##*/}")

sha256sums=('63fad98ea8c2baffa278db196f7897c96b983d87275ceb3850f9319073bd653b')

package() {
	tar xf "${srcdir}/fman-0.6.2.pkg.tar.xz" -C "${pkgdir}" --exclude='.INSTALL' --exclude='.PKGINFO' --exclude='.MTREE'
}
