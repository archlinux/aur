# Maintainer:  Rod Kay <rodakay5 at gmail dot com>

pkgname=spark2014-bin
pkgver=15.1.0
pkgrel=1
pkgdesc='Formally defined programming language based on Ada (Binary version)'

url=https://github.com/alire-project/GNAT-FSF-builds
arch=(x86_64)
license=(GPL)

depends=(python)
provides=(spark2014)
conflicts=(spark2014)

source=(https://github.com/alire-project/GNAT-FSF-builds/releases/download/gnatprove-$pkgver-1/gnatprove-x86_64-linux-$pkgver-1.tar.gz)
sha256sums=(aad9a73f600d3008f33141a6cd4c5314d4c210e8928edc172c23c76104ddf7b2)

package()
{
   cd gnatprove-x86_64-linux-$pkgver-1

   mkdir -p       $pkgdir/usr
   cp    -r  ./*  $pkgdir/usr
}