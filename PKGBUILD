# Maintainer: artist for Xlibre

pkgname=xlibre-video-nouveau-bin
_pkgname=xlibre-xf86-video-nouveau
pkgver=1.0.18.4
pkgrel=1
pkgdesc="XLibre Official Easy Install Drop in Replacement fork of X.Org nouveau video driver (binary release)"
arch=(x86_64)
url=https://x11libre.net/repo/arch_based/x86_64
license=('MIT')
groups=('xlibre-drivers')
options=(!strip)
source=(https://x11libre.net/repo/arch_based/x86_64/xlibre-video-nouveau-1.0.18.4-1-x86_64.pkg.tar.zst)
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=('mesa' 'libdrm' 'glibc')
provides=('xf86-video-nouveau' 'xlibre-video-nouveau')
conflicts=('xf86-video-nouveau' 'xlibre-video-nouveau' 'xorg-server<21.1.1' 'X-ABI-VIDEODRV_VERSION<28' 'X-ABI-VIDEODRV_VERSION>=29')

sha256sums=('f01d7cb736dbfa58979d4a1b9ac83b8f369a1411db14cc650304bdd85584d3f2')

package() {
  tar -xf "${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

