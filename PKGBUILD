# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=cp2k-data
pkgver=6.1.0
pkgrel=1
pkgdesc="A simulation parameters package for CP2K"
arch=('x86_64')
url="www.cp2k.org"
license=('GPL2')
source=("https://github.com/cp2k/cp2k/archive/v$pkgver.tar.gz")
sha256sums=('d7dd5f164e1e51d2dcb8c7d927b99f6ac1d0f8de4a665bd9daee1a14864c30ae')

package() {
  install -dm755 $pkgdir/usr/share/cp2k
  cp -r $srcdir/cp2k-$pkgver/data $pkgdir/usr/share/cp2k
}
