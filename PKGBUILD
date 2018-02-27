# Maintainer: dmitry.romanov <dmitry.romanov85@gmail.com>
# Maintainer: Michael Herrmann <michael+removethisifyouarehuman@herrmann.io>

pkgname=fman
pkgver=0.9.2
pkgrel=1
pkgdesc="A modern file manager for power users. Beautiful, fast and extensible"
arch=('x86_64')
url="https://fman.io"
license=('custom')
depends=('qt5-base' 'p7zip')
optdepends=('qt5-svg')

source=('https://fman.io/updates/arch/fman-0.9.2.pkg.tar.xz')
noextract=("${source[@]##*/}")

sha256sums=('c88ca70d6bbf4cf531cc0d62518641d173c20be667efad61e2847b2f02d9a9ce')

package() {
	tar xf "${srcdir}/fman-0.9.2.pkg.tar.xz" -C "${pkgdir}" --exclude='.INSTALL' --exclude='.PKGINFO' --exclude='.MTREE'
}
