# Maintainer: Cleboost <clement.balarot@gmail.com>
# Contributor: missing-aur project <https://github.com/Cleboost/missing-aur>

pkgname=crunchyroll-downloader-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="Downloads anime from Crunchyroll and outputs them in a MKV file (precompiled binary)"
url="https://github.com/CuteTenshii/crunchyroll-downloader"
arch=("x86_64")
provides=("crunchyroll-downloader")
conflicts=("crunchyroll-downloader")
license=("MIT")

source=("crdl-${pkgver}::${url}/releases/download/${pkgver}/crdl-linux")
sha256sums=('9ff154e6f5fcac319f3aeb1009a44dd4b810a8cecaf585fed1f0da2d8d333bef')

package() {
  install -Dm755 "crdl-${pkgver}" "${pkgdir}/usr/bin/crdl"
}

