# Maintainer: Alexander Bocken <alexander@bocken.org>

_pkgname=crest
pkgname="${_pkgname}-bin"
pkgver=3.0.2
pkgrel=1
arch=('x86_64')
url="https://github.com/crest-lab/crest"
provides=("${_pkgname}")
depends=() #TODO: investigate
makedepends=()
conflicts=("${_pkgname}")
license=('LGPL3')
pkgdesc="A program for the automated exploration of low-energy molecular chemical space"
source=("${_pkgname}-${pkgver}.xz::https://github.com/crest-lab/crest/releases/download/v$pkgver/crest-intel-2023.1.0-ubuntu-latest.tar.xz")
sha256sums=(dab8331ac75c27d7876fe93cbdc5159e5bf4c01bbdf8885bcd3579a2959ba26b)

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp "$srcdir/crest/crest" "$pkgdir/usr/bin/crest"
}
