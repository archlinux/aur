# Maintainer: Cleboost <clement.balarot@gmail.com>
# Contributor: missing-aur project <https://github.com/Cleboost/missing-aur>

pkgname=crunchyroll-downloader-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="Downloads anime from Crunchyroll and outputs them in a MKV file (precompiled binary)"
url="https://github.com/CuteTenshii/crunchyroll-downloader"
arch=("x86_64")
provides=("crunchyroll-downloader")
conflicts=("crunchyroll-downloader")
license=("MIT")

source=("crdl-${pkgver}::${url}/releases/download/${pkgver}/crdl-linux")
sha256sums=('d4cfe611a3dfedc65ce0f7949eb6494767063b5cfbd8d12a87c4ffad255aaf39')

package() {
  install -Dm755 "crdl-${pkgver}" "${pkgdir}/usr/bin/crdl"
}

