# Maintainer: Viachaslau Khalikin <khalikin@yandex.by>

pkgname=vulkan-hpp
pkgver=1.1.75
pkgrel=1
pkgdesc="C++ Bindings for Vulkan"
url="https://github.com/KhronosGroup/Vulkan-Hpp"
license=('Apache')
depends=('vulkan-headers=1:1.1.75')
groups=('vulkan-devel')
arch=('any')
source=("https://github.com/KhronosGroup/Vulkan-Hpp/raw/dddd8453041bd56d9517e1a59a861ddcd57d9ab0/vulkan/vulkan.hpp")
sha256sums=('0573cc909408da90e2ee849b5741066a820cd578764a4b14c1d59335826e820e')
package() {
  cd "$srcdir"
  install -dm755 "$pkgdir/usr/include/vulkan/"
  install -m644 vulkan.hpp "$pkgdir/usr/include/vulkan/vulkan.hpp"
}
