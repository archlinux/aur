# Maintainer: dmitry.romanov <dmitry.romanov85@gmail.com>
# Maintainer: Michael Herrmann <michael+removethisifyouarehuman@herrmann.io>

pkgname=fman
pkgver=0.6.7
pkgrel=1
pkgdesc="A modern file manager for power users. Beautiful, fast and extensible"
arch=('x86_64')
url="https://fman.io"
license=('custom')
depends=('qt5-base')
optdepends=('qt5-svg')

source=('https://fman.io/updates/arch/fman-0.6.7.pkg.tar.xz')
noextract=("${source[@]##*/}")

sha256sums=('54c4279fc60a4a23a6347217cb1cfd43c8ac5964fd5d6763dc3e6c3edf0f802a')

package() {
	tar xf "${srcdir}/fman-0.6.7.pkg.tar.xz" -C "${pkgdir}" --exclude='.INSTALL' --exclude='.PKGINFO' --exclude='.MTREE'
}
