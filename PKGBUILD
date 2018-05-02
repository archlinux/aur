# Contributor: Alexander Matyukhin <matalex1991@gmail.com>
pkgname=obnc-libstd
pkgver=0.4.0
pkgrel=1
pkgdesc="Basic library for obnc Oberon compiler"
arch=('i686' 'x86_64')
license=('GPL')
url="http://miasap.se/obnc/"
source=("http://miasap.se/obnc/downloads/obnc-libstd_0.4.0.tar.gz")
depends=("obnc")
md5sums=('223dacbc5249b336b976bba972b09970')
sha256sums=('d80f2bc770fc9d41927dcc4cd5e24791c909a2732f5a96ebd2990f9449011b89')
sha384sums=('cea2460d252710c683d78848c7c80038b15184eca62c351dd4651835306956bf00919170ea7596e6f502a5db78e562a1')
sha512sums=('3da1277f7cad8b93998ce3e4101d4ffb4e4bc545d6742533143a43087566520c91ca901d1381c86a17a050ed73a77b1e2724dea94ad28f7f344deec933d660c6')
build()
{
  cd $srcdir/$pkgname-$pkgver/
  ./build
  ./test
}
package()
{
  cd $srcdir/$pkgname-$pkgver/
  ./install --prefix=$pkgdir/usr/ # --libdir=usr/lib/
}


