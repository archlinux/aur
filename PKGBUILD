# Maintainer:  Rod Kay <rodakay5 at gmail dot com>

pkgname=spark2014-bin
pkgver=13.2.0
pkgrel=1
pkgdesc='Formally defined programming language based on Ada (Binary version)'
url=https://github.com/alire-project/GNAT-FSF-builds
arch=(x86_64)
license=(GPL)

depends=(python)
provides=(spark2014)
conflicts=(spark2014)

source=(https://github.com/alire-project/GNAT-FSF-builds/releases/download/gnatprove-$pkgver-1/gnatprove-x86_64-linux-$pkgver-1.tar.gz)
sha256sums=(28fc3583d2364c1e10790fe258c408faffa42d7ff77bb81dc18d4907608f4017)

package()
{
   cd gnatprove-x86_64-linux-$pkgver-1

   mkdir -p       $pkgdir/usr
   cp    -r  ./*  $pkgdir/usr
}