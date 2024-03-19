# Maintainer: Alexander Bocken <alexander@bocken.org>

_pkgname=crest
pkgname="${_pkgname}-bin"
pkgver=2.12
pkgrel=1
arch=('x86_64')
url="https://github.com/crest-lab/crest"
provides=("${_pkgname}")
depends=() #TODO: investigate
makedepends=()
conflicts=("${_pkgname}")
license=('LGPL3')
pkgdesc="A program for the automated exploration of low-energy molecular chemical space"
source=("${_pkgname}-${pkgver}.zip::https://github.com/crest-lab/crest/releases/download/v${pkgver}/${_pkgname}.zip")
sha256sums=('c55e0f075a6223317b33a5f0fae593ce0ad55c1229c382937b0a0c2dcaf72ef6')

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp "$srcdir/crest" "$pkgdir/usr/bin/crest"
}
