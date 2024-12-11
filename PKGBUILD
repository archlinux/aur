# Maintainer: Konrad Heidler <k dot heidler at tum dot de>
# Contributor: Konrad Heidler <k.heidler@tum.de>

_basename="versatiles"
pkgname="${_basename}-bin"
pkgver=0.14.5
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
sha256sums_x86_64=('5706f76caa3f39346d645642fd124d9b33c0f033ffdb4ac2ed92ec7e38ad99e0')
sha256sums_aarch64=('351703c5fdd710dd3079c1c686a1b6532ceb02a44873cdc3c9c3af5b4ba25e9e')

package() {
  install -D "$_basename" "$pkgdir/usr/bin/$_basename"
}
