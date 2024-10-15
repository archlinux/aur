# Maintainer: Konrad Heidler <k dot heidler at tum dot de>
# Contributor: Konrad Heidler <k.heidler@tum.de>

_basename="versatiles"
pkgname="${_basename}-bin"
pkgver=0.12.8
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
sha256sums_x86_64=('7c642a8afe6fd2ddf7aad610218847808e195c548b83e2660b0238bdcf49b65d')
sha256sums_aarch64=('a2bc95c317889a694339295252632e0f599515bb6522881f977fad2b1f5fa1db')

package() {
  install -D "$_basename" "$pkgdir/usr/bin/$_basename"
}
