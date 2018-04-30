# Maintainer: Viachaslau Khalikin <khalikin@yandex.by>

pkgname=vulkan-hpp
pkgver=1.1.74
pkgrel=1
pkgdesc="C++ Bindings for Vulkan"
url="https://github.com/KhronosGroup/Vulkan-Hpp"
license=('Apache')
depends=('vulkan-headers=1:1.1.74')
groups=('vulkan-devel')
arch=('any')
source=("https://github.com/KhronosGroup/Vulkan-Hpp/raw/4b179131e60ca56150b78cf6c8e49c0992dea48e/vulkan/vulkan.hpp")
sha256sums=('d3f2c1a1f6ffaf6bdc79661843ef6a86818087c48d5212c34e3e48d2f0cf1d99')
package() {
  cd "$srcdir"
  install -dm755 "$pkgdir/usr/include/vulkan/"
  install -m644 vulkan.hpp "$pkgdir/usr/include/vulkan/vulkan.hpp"
}
