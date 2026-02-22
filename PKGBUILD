# Maintainer: artist for Xlibre

pkgname=xlibre-video-ati-bin
_pkgname=xlibre-xf86-video-ati
pkgver=22.0.0.4
pkgrel=2
pkgdesc="XLibre Official Easy Install Drop in Replacement fork of X.Org ati video driver (binary release)"
arch=(x86_64)
url=https://x11libre.net/repo/arch_based/x86_64
license=('MIT')
groups=('xlibre-drivers')
options=(!strip)
source=(https://x11libre.net/repo/arch_based/x86_64/xlibre-video-ati-22.0.0.4-2-x86_64.pkg.tar.zst)
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=('mesa' 'libpciaccess' 'libdrm' 'glibc')
provides=('xf86-video-ati' 'xlibre-video-ati')
conflicts=('xf86-video-ati' 'xlibre-video-ati' 'X-ABI-VIDEODRV_VERSION<28' 'X-ABI-VIDEODRV_VERSION>=29')

sha256sums=('c94a752f164e6657b6a020c3ac9004ddfa1f9a6cdbaa5dccb53a9ce52cd5550f')

package() {
  tar -xf "${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

