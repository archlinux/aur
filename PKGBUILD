# Maintainer: artist for XLibre <artist4xlibre@proton.me>

pkgname=xlibre-video-vesa-bin
_pkgname=xlibre-xf86-video-vesa
pkgver=2.6.0.4
pkgrel=1
pkgdesc="XLibre Official Easy Install Drop in Replacement fork of X.Org vesa video driver (binary release)"
arch=(x86_64)
url="https://github.com/X11Libre"
license=('MIT')
groups=('xlibre-drivers')
options=(!strip)
source=("https://x11libre.net/repo/arch_based/x86_64/${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=('glibc')
provides=('xf86-video-vesa' 'xlibre-video-vesa')
conflicts=('xf86-video-vesa' 'xlibre-video-vesa' 'X-ABI-VIDEODRV_VERSION<28' 'X-ABI-VIDEODRV_VERSION>=29')

sha256sums=('93e2eca288b9c15de319ffd7e06815e74305aa4fc5c28cb857843f356eb6cfba')

package() {
  tar -xf "${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

