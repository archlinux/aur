# Maintainer: Kohei Suzuki <eagletmt@gmail.com>
pkgname=itamae
pkgver=1.10.1
pkgrel=1
_pkgrel=1
pkgdesc='Configuration management tool inspired by Chef, but simpler and lightweight'
arch=('x86_64')
url='http://itamae.kitchen/'
license=('MIT')
options=('!strip')
source=(https://dl.bintray.com/itamae/itamae/bionic/pool/contrib/i/itamae_${pkgver}-${_pkgrel}_amd64_bionic.deb{,.asc})
validpgpkeys=('8756C4F765C9AC3CB6B85D62379CE192D401AB61') # Bintray (by JFrog) <bintray@bintray.com>

package() {
  cd "$srcdir"

  tar xf data.tar.gz -C "$pkgdir/"
  mkdir -p "$pkgdir/usr/bin"
  ln -s /opt/itamae/embedded/bin/itamae "$pkgdir/usr/bin/itamae"
}

# vim: set ft=sh:

sha256sums=('c77175db7f8ce041285fa66c2877227949e50136938302d54ed6497eeddb6a55'
            'SKIP')
