# Maintainer: Tobi Fuhrimann

pkgname=pacmanfile
pkgver=0.0.3
pkgrel=1
pkgdesc='Manage your pacman packages declaratively'
arch=(x86_64 i686)
url="https://github.com/mastertinner/pacmanfile"
license=(Apache)
provides=(pacmanfile)
source=('https://raw.githubusercontent.com/mastertinner/pacmanfile/main/pacmanfile')
sha256sums=('bb5ae787898a27da34ed9b0ae9a003ec05c0fa601f4ec7a534d551173545b2d8')

package() {
	install -Dm755 pacmanfile -t "${pkgdir}/usr/bin"
}
