# Maintainer: Konrad Heidler <k dot heidler at tum dot de>
# Contributor: Konrad Heidler <k.heidler@tum.de>

_basename="versatiles"
pkgname="${_basename}-bin"
pkgver=0.12.10
pkgrel=2
pkgdesc='A toolbox for converting, checking and serving map tiles in various formats.'
url="https://github.com/versatiles-org/versatiles-rs"
license=("MIT")
arch=("x86_64" "aarch64")
provides=(${_basename})
conflicts=(${_basename})
depends=()
makedepends=()
source_x86_64=("$pkgname-linux-gnu-x86_64-$pkgver.tar.gz::https://github.com/versatiles-org/versatiles-rs/releases/download/v${pkgver}/versatiles-linux-gnu-x86_64.tar.gz")
source_aarch64=("$pkgname-linux-gnu-aarch64-$pkgver.tar.gz::https://github.com/versatiles-org/versatiles-rs/releases/download/v${pkgver}/versatiles-linux-gnu-aarch64.tar.gz")
sha256sums_x86_64=('380b975f14f8b3398900d2f49764ed48b36a9c65666be143cec7f3c6b0daf007')
sha256sums_aarch64=('30e1ad2db414f2adb89dadf673972937a59266283cfbdfe686c2feb0726d7b5e')

package() {
  install -D "$_basename" "$pkgdir/usr/bin/$_basename"
}
