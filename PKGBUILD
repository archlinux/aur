# Maintainer: Daniel Milde <daniel@milde.cz>

pkgname=pyston
pkgver=2.0
pkgrel=1
pkgdesc="An open-source Python implementation using JIT techniques."
arch=('x86_64')
license=('custom')
options=('!emptydirs' '!strip')
url="https://github.com/dropbox/pyston"
source=(https://github.com/dropbox/pyston/releases/download/v${pkgver}/pyston_${pkgver}_amd64_20.04.deb)
sha256sums=('cd0a910214d116cb96f88b2a0823db72f8cfe3c7ecc4ebff0e08077a66ee6d88')

package() {
	bsdtar -xJf data.tar.xz -C "$pkgdir/"
}

