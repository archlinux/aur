# Maintainer: Ben Boyter <ben@boyter.org>
pkgname=scc-bin
pkgver=2.11.0
pkgrel=1
pkgdesc="Sloc, Cloc and Code: scc is a very fast accurate code counter with complexity calculations and COCOMO estimates written in pure Go"
arch=('x86_64' 'i386')
url="https://github.com/boyter/scc"
license=('MIT' 'UNLICENSE')
conflicts=('scc')
source_i386=(https://github.com/boyter/scc/releases/download/v$pkgver/scc-$pkgver-i386-unknown-linux.zip)
sha256sums_i386=('9418420cddeb54361c8eb1643ccf1fd48e63dba51e6cf6af1f66087e2acd572d')
source_x86_64=(https://github.com/boyter/scc/releases/download/v$pkgver/scc-$pkgver-x86_64-unknown-linux.zip)
sha256sums_x86_64=('839abb609c43c4aae6b6193b9a784159a2ef259c13b997ce523f9bd5691c9933')

package() {
  mkdir -p $pkgdir/usr/bin
  cp $srcdir/scc $pkgdir/usr/bin
}
