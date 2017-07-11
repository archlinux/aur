# Maintainer: dmitry.romanov <dmitry.romanov85@gmail.com>
# Maintainer: Michael Herrmann <michael+removethisifyouarehuman@herrmann.io>

pkgname=fman
pkgver=0.5.3
pkgrel=1
pkgdesc="A modern file manager for power users. Beautiful, fast and extensible"
arch=('x86_64')
url="https://fman.io"
license=('custom')
depends=('qt5-base')
optdepends=('qt5-svg')

source=('https://fman.io/updates/arch/fman-0.5.3.pkg.tar.xz')
noextract=("${source[@]##*/}")

sha256sums=('549a72bfb0f8b505b58e84f8adf18a2a62a14d647ba9f176b62e8bab23c203f0')

package() {
	tar xf "${srcdir}/fman-0.5.3.pkg.tar.xz" -C "${pkgdir}" --exclude='.INSTALL' --exclude='.PKGINFO' --exclude='.MTREE'
}
