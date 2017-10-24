# Maintainer: Viachaslau Khalikin <khalikin@yandex.by>

pkgname=vulkan-hpp
pkgver=1.0.64
pkgrel=1
pkgdesc="C++ Bindings for Vulkan"
url="https://github.com/KhronosGroup/Vulkan-Hpp"
license=('Apache')
provides=()
groups=('vulkan-devel')
arch=('any')
source=("https://raw.githubusercontent.com/KhronosGroup/Vulkan-Hpp/e464d695dd6678cc904793a9fe0a839e24794184/vulkan/vulkan.hpp")
sha256sums=('204d22dcc5bc0b54ed3c73d2dfaecf5e865039c7673514dbe7dfb2ccfc2f02f3')
package() {
  cd "$srcdir"
  install -dm755 "$pkgdir/usr/include/vulkan/"
  install -m644 vulkan.hpp "$pkgdir/usr/include/vulkan/vulkan.hpp"
}
