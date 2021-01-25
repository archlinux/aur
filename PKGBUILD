# Maintainer: Tobi Fuhrimann

pkgname=pacmanfile
pkgver=0.0.2
pkgrel=1
pkgdesc='Manage your pacman packages declaratively'
arch=(x86_64 i686)
url="https://github.com/mastertinner/pacmanfile"
license=(Apache)
provides=(pacmanfile)
source=('https://raw.githubusercontent.com/mastertinner/pacmanfile/main/pacmanfile')
sha256sums=('580877ad6f05b01f9c4f2dbeb91708cc189e42388e091556dc3b8f5642ddcdf3')

package() {
	install -Dm755 pacmanfile -t "${pkgdir}/usr/bin"
}
