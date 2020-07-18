# Maintainer: Kohei Suzuki <eagletmt@gmail.com>
pkgname=itamae
pkgver=1.10.8
pkgrel=1
_pkgrel=1
pkgdesc='Configuration management tool inspired by Chef, but simpler and lightweight'
arch=('x86_64')
url='http://itamae.kitchen/'
license=('MIT')
options=('!strip')
source=(https://dl.bintray.com/itamae/itamae/bionic/pool/i/amd64--itamae_${pkgver}+${_pkgrel}~bionic_amd64.deb{,.asc})
validpgpkeys=('8756C4F765C9AC3CB6B85D62379CE192D401AB61') # Bintray (by JFrog) <bintray@bintray.com>

package() {
  cd "$srcdir"

  tar xf data.tar.xz -C "$pkgdir/"
  rm -r "$pkgdir/usr/share/lintian"
}

# vim: set ft=sh:

sha256sums=('28273e7db854fcdb68b43687bfd21ae41c25662104cd478cd55907a09c01be4e'
            'SKIP')
