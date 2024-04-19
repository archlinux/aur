# Maintainer: Alexander Bocken <alexander@bocken.org>

_pkgname=crest
pkgname="${_pkgname}-bin"
pkgver=3.0
pkgrel=1
arch=('x86_64')
url="https://github.com/crest-lab/crest"
provides=("${_pkgname}")
depends=() #TODO: investigate
makedepends=()
conflicts=("${_pkgname}")
license=('LGPL3')
pkgdesc="A program for the automated exploration of low-energy molecular chemical space"
source=("${_pkgname}-${pkgver}.zip::https://github.com/crest-lab/crest/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-intel-meson.zip")
sha256sums=('852ec12391b178b6ef12e1aca79b98b9d386b822e0f70d5671cf667bdf86693e')

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp "$srcdir/crest" "$pkgdir/usr/bin/crest"
}
