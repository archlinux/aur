# Maintainer: dmitry.romanov <dmitry.romanov85@gmail.com>
# Maintainer: Michael Herrmann <michael+removethisifyouarehuman@herrmann.io>

pkgname=fman
pkgver=0.4.4
pkgrel=1
pkgdesc="A modern file manager for power users. Beautiful, fast and extensible"
arch=('x86_64')
url="https://fman.io"
license=('custom')
depends=('qt5-base' 'openssl')
optdepends=('qt5-svg')

source=('https://fman.io/updates/arch/fman-0.4.4.pkg.tar.xz')
noextract=("${source[@]##*/}")

sha256sums=('82c8a7f33fea39b981d25ff93abb158bf8ff103c75861e4bf1e5f55ba4f32f45')

package() {
	tar xf "${srcdir}/fman-0.4.4.pkg.tar.xz" -C "${pkgdir}" --exclude='.INSTALL' --exclude='.PKGINFO' --exclude='.MTREE'
}
