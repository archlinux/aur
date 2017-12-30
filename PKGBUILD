# Maintainer: Viachaslau Khalikin <khalikin@yandex.by>

pkgname=vulkan-hpp
pkgver=1.0.66
pkgrel=1
pkgdesc="C++ Bindings for Vulkan"
url="https://github.com/KhronosGroup/Vulkan-Hpp"
license=('Apache')
provides=()
groups=('vulkan-devel')
arch=('any')
source=("https://raw.githubusercontent.com/KhronosGroup/Vulkan-Hpp/15ac21442dc8de37d5a210ac298500a56afbb48d/vulkan/vulkan.hpp")
sha256sums=('422c57999c02eeb5fb0d9a38ff33a1506a728986f120b583c3cf9e9464d1154d')
package() {
  cd "$srcdir"
  install -dm755 "$pkgdir/usr/include/vulkan/"
  install -m644 vulkan.hpp "$pkgdir/usr/include/vulkan/vulkan.hpp"
}
