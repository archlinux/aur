# Maintainer: artist for Xlibre

pkgname=xlibre-video-qxl-bin
_pkgname=xlibre-xf86-video-qxl
pkgver=0.1.6.3
pkgrel=2
pkgdesc="XLibre Official Easy Install Drop in Replacement fork of X.Org qxl video driver (binary release)"
arch=(x86_64)
url=https://x11libre.net/repo/arch_based/x86_64
license=('MIT')
groups=('xlibre-drivers')
options=(!strip)
source=(https://x11libre.net/repo/arch_based/x86_64/xlibre-video-qxl-0.1.6.3-2-x86_64.pkg.tar.zst)
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=('spice' 'libxfont2' 'glibc')
optdepends=('python: for Xspice')
provides=('xf86-video-qxl' 'xlibre-video-qxl')
conflicts=('xf86-video-qxl' 'xlibre-video-qxl' 'X-ABI-VIDEODRV_VERSION<28' 'X-ABI-VIDEODRV_VERSION>=29')

sha256sums=('3396dead1d96345b690d989ed84d2d5f29ea0c93ae2b1dd3c0eb57619a0d5f9e')

package() {
  tar -xf "${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

