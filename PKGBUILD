# Maintainer: Viachaslau Khalikin <khalikin@yandex.by>

pkgname=vulkan-hpp
pkgver=1.1.70.1
pkgrel=1
pkgdesc="C++ Bindings for Vulkan"
url="https://github.com/KhronosGroup/Vulkan-Hpp"
license=('Apache')
provides=()
groups=('vulkan-devel')
arch=('any')
source=("https://raw.githubusercontent.com/KhronosGroup/Vulkan-Hpp/65223fa8a9c9fa7d4aaf32e2ae94c157ca27deee/vulkan/vulkan.hpp")
sha256sums=('49e31190a036c054623655555b0dd5ba96c312dbe52abd41b550bab7fa70b6cb')
package() {
  cd "$srcdir"
  install -dm755 "$pkgdir/usr/include/vulkan/"
  install -m644 vulkan.hpp "$pkgdir/usr/include/vulkan/vulkan.hpp"
}
