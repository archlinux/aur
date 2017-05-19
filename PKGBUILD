# Maintainer: dmitry.romanov <dmitry.romanov85@gmail.com>
# Maintainer: Michael Herrmann <michael+removethisifyouarehuman@herrmann.io>

pkgname=fman
pkgver=0.4.6
pkgrel=1
pkgdesc="A modern file manager for power users. Beautiful, fast and extensible"
arch=('x86_64')
url="https://fman.io"
license=('custom')
depends=('qt5-base' 'openssl')
optdepends=('qt5-svg')

source=('https://fman.io/updates/arch/fman-0.4.6.pkg.tar.xz')
noextract=("${source[@]##*/}")

sha256sums=('218f4d77677c05505627d6bb2c2fba0685dd12ef13c15bd16ff2f18f858bb8e3')

package() {
	tar xf "${srcdir}/fman-0.4.6.pkg.tar.xz" -C "${pkgdir}" --exclude='.INSTALL' --exclude='.PKGINFO' --exclude='.MTREE'
}
