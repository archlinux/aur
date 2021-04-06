pkgname=rosbe-ci-bin
pkgver=2.2.1
pkgrel=1
pkgdesc="ReactOS Build Environment binary for CI builds"
arch=('x86_64')
license=('GPL')
depends=()
conflicts=('rosbe')
optdepends=('perl: run translate.pl to translate backtraces found in debug log')
makedepends=()
url="https://reactos.org/wiki/Build_Environment"
install="rosbe-ci-bin.install"
source=(https://svn.reactos.org/storage/vperevertkin/rosbe-ci.tar.zst)
noextract=()
md5sums=('f075fecfe34acd24bb7150f773c7a9b9')

package()
{
  mkdir -p ${pkgdir}/opt/rosbe
  cp -r ${srcdir}/* ${pkgdir}/opt/rosbe
}
