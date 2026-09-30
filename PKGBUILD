# Maintainer: Cleboost <clement.balarot@gmail.com>
# Contributor: missing-aur project <https://github.com/Cleboost/missing-aur>

pkgname=crunchyroll-downloader-bin
pkgver=1.6.0
pkgrel=1
pkgdesc="Downloads anime from Crunchyroll and outputs them in a MKV file (precompiled binary)"
url="https://github.com/CuteTenshii/crunchyroll-downloader"
arch=("x86_64")
provides=("crunchyroll-downloader")
conflicts=("crunchyroll-downloader")
license=("MIT")

source=("crdl-${pkgver}::${url}/releases/download/${pkgver}/crdl-linux")
sha256sums=('d43db72619c8284d6c92a1306285a0cf5395505c35440c5fc95bc69e479b132f')

package() {
  install -Dm755 "crdl-${pkgver}" "${pkgdir}/usr/bin/crdl"
}

