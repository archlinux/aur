# Maintainer: artist for Xlibre

pkgname=xlibre-video-sisusb-bin
_pkgname=xlibre-xf86-video-sisusb
pkgver=0.9.7.2
pkgrel=1.2
pkgdesc="XLibre Official Easy Install Drop in Replacement fork of X.Org sisusb video driver (binary release)"
arch=(x86_64)
url=https://x11libre.net/repo/arch_based/x86_64
license=('BSD-3-Clause')
groups=('xlibre-drivers')
options=(!strip)
source=(https://x11libre.net/repo/arch_based/x86_64/xlibre-video-sisusb-0.9.7.2-1.2-x86_64.pkg.tar.zst)
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=('mesa' 'libdrm' 'glibc')
provides=('xf86-video-sisusb' 'xlibre-video-sisusb')
conflicts=('xf86-video-sisusb' 'xlibre-video-sisusb' 'xorg-server<21.1.1' 'X-ABI-VIDEODRV_VERSION<28' 'X-ABI-VIDEODRV_VERSION>=29')

sha256sums=('1bfc75bb86bd62cf79e69bd05b2536906aa0ce8f15c8997209ce9988202c7815')

package() {
  tar -xf "${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

