# Maintainer: Kohei Suzuki <eagletmt@gmail.com>
pkgname=itamae
pkgver=1.9.6
pkgrel=1
_pkgrel=1
pkgdesc=""
arch=('x86_64')
url='http://itamae.kitchen/'
license=('MIT')
options=('!strip')
source=(https://dl.bintray.com/itamae/itamae/pool/contrib/i/itamae_${pkgver}-${_pkgrel}_amd64_xenial.deb{,.asc})
validpgpkeys=('8756C4F765C9AC3CB6B85D62379CE192D401AB61') # Bintray (by JFrog) <bintray@bintray.com>

package() {
  cd "$srcdir"

  tar xf data.tar.gz -C "$pkgdir/"
  mkdir -p "$pkgdir/usr/bin"
  ln -s /opt/itamae/embedded/bin/itamae "$pkgdir/usr/bin/itamae"
}

# vim: set ft=sh:

sha256sums=('e2231cdbf14b2aca6f94b32145dc0f5bc178285a51241b05200e40059ae2a5b2'
            'SKIP')
