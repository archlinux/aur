# Maintainer: dmitry.romanov <dmitry.romanov85@gmail.com>
# Maintainer: Michael Herrmann <michael+removethisifyouarehuman@herrmann.io>

pkgname=fman
pkgver=1.5.0
pkgrel=1
pkgdesc="A modern file manager for power users. Beautiful, fast and extensible"
arch=('x86_64')
url="https://fman.io"
license=('custom')
depends=('qt5-base' 'p7zip' 'qt5-base' 'p7zip')
optdepends=('qt5-svg' 'qt5-svg')

source=('https://fman.io/updates/arch/fman-1.5.0.pkg.tar.xz')
noextract=("${source[@]##*/}")

sha256sums=('418b236d74ea100b8b50918e07d1be4791c0fc374dc118bab7f2ecd3cf5eb5a7')

package() {
	tar xf "${srcdir}/fman-1.5.0.pkg.tar.xz" -C "${pkgdir}" --exclude='.INSTALL' --exclude='.PKGINFO' --exclude='.MTREE'
}
