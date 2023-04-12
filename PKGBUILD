# Maintainer: Ali Emre Gülcü <aliemreglc at gmail dot com>

pkgname=tinygltf
pkgver=2.8.6
pkgrel=1
pkgdesc="Header only C++ tiny glTF library(loader/saver)"
arch=('any')
url="https://github.com/syoyo/$pkgname"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('21b8842f9f3a710f644bb3ef4114ce5d')

package() {
  cd $pkgname-$pkgver
  mkdir -p $pkgdir/usr/include/$pkgname $pkgdir/usr/share/licenses/$pkgname
  install *.h $pkgdir/usr/include/$pkgname
  install *.hpp $pkgdir/usr/include/$pkgname
  install LICENSE $pkgdir/usr/share/licenses/$pkgname
}
