# Maintainer: Daniel Milde <daniel@milde.cz>

pkgname=pyston
pkgver=2.1
pkgrel=1
pkgdesc="An open-source Python implementation using JIT techniques."
arch=('x86_64')
license=('custom')
options=('!emptydirs' '!strip')
url="https://github.com/dropbox/pyston"
source=(https://github.com/dropbox/pyston/releases/download/v${pkgver}/pyston_${pkgver}_20.04.deb)
sha256sums=('3a8612678454bedc40b127b1bf9b111e0cdf45f12d2983a02a44d478b02c18e6')

package() {
	bsdtar -xJf data.tar.xz -C "$pkgdir/"
}

