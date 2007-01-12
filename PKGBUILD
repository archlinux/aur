# Contributor: Olivier Mehani <olivier.mehani@inria.fr>
# $Id$

pkgname=nylon-build-stable
pkgver=1.0
pkgrel=1
pkgdesc="OpenEmbedded developpement environment for 4GCubes"
url="http://www.meshcube.org"
depends=(python ccache patch m4 docbook-xml docbook-xsl bison make jade subversion psyco bzip2 cvs gawk gcc sharutils)
install=nylon.install
source=(http://meshcube.org/nylon/stable/$pkgname-$pkgver.tar.gz)
md5sums=('4f9edec77ee925b1e24a13c55f4dbb99')

build() {
  mkdir -p $startdir/pkg/opt/nylon-build-stable
  cp -r $startdir/src/$pkgname-$pkgver/* $startdir/pkg/opt/nylon-build-stable
}
