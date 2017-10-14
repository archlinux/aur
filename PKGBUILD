# Maintainer: Viachaslau Khalikin <khalikin@yandex.by>

pkgname=vulkan-hpp
pkgver=1.0.61
pkgrel=2
pkgdesc="C++ Bindings for Vulkan"
url="https://github.com/KhronosGroup/Vulkan-Hpp"
license=('Apache')
groups=('vulkan-devel')
arch=('any')
source=("https://github.com/KhronosGroup/Vulkan-Hpp/raw/0b8ab65be2e03b50268547e9661fa6c70d9017a4/vulkan/vulkan.hpp")
sha256sums=('cf1bcf093959e58bc8c33716a7957e6f4e77147080eb40f877af7c36da6fca24')
package() {
  cd "$srcdir"
  install -dm755 "$pkgdir/usr/include/vulkan/"
  install -m644 vulkan.hpp "$pkgdir/usr/include/vulkan/vulkan.hpp"
}
