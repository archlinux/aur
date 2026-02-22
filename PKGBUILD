# Maintainer: artist for Xlibre

pkgname=xlibre-video-fbdev-bin
_pkgname=xlibre-xf86-video-fbdev
pkgver=0.5.1.2
pkgrel=1.2
pkgdesc="XLibre Official Easy Install Drop in Replacement fork of X.Org fbdev video driver (binary release)"
arch=(x86_64)
url=https://x11libre.net/repo/arch_based/x86_64
license=('MIT')
groups=('xlibre-drivers')
options=(!strip)
source=(https://x11libre.net/repo/arch_based/x86_64/xlibre-video-fbdev-0.5.1.2-1.2-x86_64.pkg.tar.zst)
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=('glibc')
provides=('xf86-video-fbdev' 'xlibre-video-fbdev')
conflicts=('xf86-video-fbdev' 'xlibre-video-fbdev' 'X-ABI-VIDEODRV_VERSION<28' 'X-ABI-VIDEODRV_VERSION>=29')

sha256sums=('64c6e9347e7b48481d49437382467fe1de6bad06b6ea39252be744df0d273afc')

package() {
  tar -xf "${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

