# Maintainer: coolapso <coolapso@coolapso.tech>

_pkgver=0.8.17

pkgname="earthbuild-bin"
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc="EarthBuild is a simple, fast, and consistent build system for containerized, reproducible builds."
url="https://github.com/EarthBuild/earthbuild"
license=("MPL-2.0 license")
provides=("${pkgname}")
conflicts=("earthly")
arch=("x86_64")

#url ex: https://github.com/EarthBuild/earthbuild/releases/download/v0.8.17/earth-linux-amd64
source=("${url}/releases/download/v${_pkgver}/earth-linux-amd64")
sha256sums=('85b7f31020be220493c1ef89fe4e976985a72e54dd12b7dfcf17544c8d4fd880')

package() {
  install -Dm755 "${srcdir}/earth-linux-amd64" "${pkgdir}/usr/bin/earth"
}
