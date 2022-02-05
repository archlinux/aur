# Maintainer: Norbert Pfeiler <norbert.pfeiler+aur ät gmail.com>

pkgname=cotire
epoch=1
pkgver=1.8.1
pkgrel=1
pkgdesc='CMake module to speed up builds. By fully automating techniques like precompiled header usage and single compilation unit builds for C and C++'
arch=(any)
license=('custom')
url='https://github.com/sakra/cotire'
depends=('cmake>=3.22.1-2')
source=("https://github.com/sakra/cotire/archive/$pkgname-$pkgver.tar.gz")
sha256sums=('79b976b9e822941e3e2a3d82881c5fbcfbc971156640cb745e74f845e764f192')
install=cotire.install

package() {
  cd "$pkgname-$pkgname-$pkgver"

  modules_dir="$pkgdir/usr/share/cmake/Modules/"
  mkdir -p $modules_dir
  cp CMake/cotire.cmake $modules_dir

  license_dir="$pkgdir/usr/share/licenses/cotire/"
  mkdir -p $license_dir
  cp license $license_dir
}
