# Maintainer: Viachaslau Khalikin <khalikin@yandex.by>

pkgname=vulkan-hpp
pkgver=1.1.76
pkgrel=1
pkgdesc="C++ Bindings for Vulkan"
url="https://github.com/KhronosGroup/Vulkan-Hpp"
license=('Apache')
depends=('vulkan-headers=1:1.1.76')
groups=('vulkan-devel')
arch=('any')
source=("https://github.com/KhronosGroup/Vulkan-Hpp/raw/ea22107198249a4d0c82a3b7dbca6882266a0914/vulkan/vulkan.hpp")
sha256sums=('0e0cbcad7f143560bf44bff7fddc6ca7a0c0099a54fe67ed7eedee1dd68d9017')
package() {
  cd "$srcdir"
  install -dm755 "$pkgdir/usr/include/vulkan/"
  install -m644 vulkan.hpp "$pkgdir/usr/include/vulkan/vulkan.hpp"
}
