# Maintainer: Viachaslau Khalikin <khalikin@yandex.by>

pkgname=vulkan-hpp
pkgver=1.1.74
pkgrel=2
pkgdesc="C++ Bindings for Vulkan"
url="https://github.com/KhronosGroup/Vulkan-Hpp"
license=('Apache')
depends=('vulkan-headers=1:1.1.74')
groups=('vulkan-devel')
arch=('any')
source=("https://github.com/KhronosGroup/Vulkan-Hpp/raw/4b179131e60ca56150b78cf6c8e49c0992dea48e/vulkan/vulkan.hpp")
sha256sums=('4019f7ab4399a3feffdfc53e4a425aed2291a196a0a39a4225d2da59301e3f84')
package() {
  cd "$srcdir"
  install -dm755 "$pkgdir/usr/include/vulkan/"
  install -m644 vulkan.hpp "$pkgdir/usr/include/vulkan/vulkan.hpp"
}
