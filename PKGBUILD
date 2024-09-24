# Maintainer: Konrad Heidler <k dot heidler at tum dot de>
# Contributor: Konrad Heidler <k.heidler@tum.de>

_basename="versatiles"
pkgname="${_basename}-bin"
pkgver=0.12.6
pkgrel=1
pkgdesc='A toolbox for converting, checking and serving map tiles in various formats.'
url="https://github.com/versatiles-org/versatiles-rs"
license=("MIT")
arch=("x86_64" "aarch64")
provides=(${_basename})
conflicts=(${_basename})
depends=()
makedepends=()
source_x86_64=("https://github.com/versatiles-org/versatiles-rs/releases/download/v${pkgver}/versatiles-linux-gnu-x86_64.tar.gz")
source_aarch64=("https://github.com/versatiles-org/versatiles-rs/releases/download/v${pkgver}/versatiles-linux-gnu-aarch64.tar.gz")
sha256sums_x86_64=('de53d79484fc1726abe5b1252e1747062d41441050b083cd2bc1c0991bca2c75')
sha256sums_aarch64=('7bb16c3b8737a075e5e406948201e0cdf505ceec6a1ceeddb96ba1272471720c')

package() {
  install -D "$_basename" "$pkgdir/usr/bin/$_basename"
}
