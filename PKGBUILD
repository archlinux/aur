# Maintainer: Ali Emre Gülcü <aliemreglc at gmail dot com>

pkgname=tinygltf
pkgver=2.8.9
pkgrel=1
pkgdesc="Header only C++ tiny glTF library(loader/saver)"
arch=('any')
url="https://github.com/syoyo/$pkgname"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cfff42b9246e1e24d36ec4ae94a22d5f4b0a1c63c796babb5c2a13fe66aed5e9')

package() {
  cd $pkgname-$pkgver
  mkdir -p $pkgdir/usr/include/$pkgname $pkgdir/usr/share/licenses/$pkgname
  install *.h $pkgdir/usr/include/$pkgname
  install *.hpp $pkgdir/usr/include/$pkgname
  install LICENSE $pkgdir/usr/share/licenses/$pkgname
}
