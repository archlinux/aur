# Maintainer: Konrad Heidler <k dot heidler at tum dot de>
# Contributor: Konrad Heidler <k.heidler@tum.de>

_basename="versatiles"
pkgname="${_basename}-bin"
pkgver=0.15.1
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
sha256sums_x86_64=('0bcccaae0c8d6bfb97240eaa16f13752d275ad9205dc72506a84edd0bd06ba56')
sha256sums_aarch64=('f7bed272544b378fa9dfdf105604cbe3a2a05cd972341445f09f03574cf0b10c')

package() {
  install -D "$_basename" "$pkgdir/usr/bin/$_basename"
}
