# Maintainer: dmitry.romanov <dmitry.romanov85@gmail.com>
# Maintainer: Michael Herrmann <>

pkgname=fman
pkgver=1.4.0
pkgrel=1
pkgdesc=""
arch=('x86_64')
url="https://fman.io"
license=('custom')
depends=('qt5-base' 'p7zip')
optdepends=('qt5-svg')

source=('https://fman.io/updates/arch/fman-1.4.0.pkg.tar.xz')
noextract=("${source[@]##*/}")

sha256sums=('5018184fb2c76e0db87e913852f837e4af2e6cb44293f0af56907d7a42056dfd')

package() {
	tar xf "${srcdir}/fman-1.4.0.pkg.tar.xz" -C "${pkgdir}" --exclude='.INSTALL' --exclude='.PKGINFO' --exclude='.MTREE'
}
