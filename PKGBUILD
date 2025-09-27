# Maintainer: artist for Xlibre

pkgname=xlibre-video-vesa-bin
_pkgname=xlibre-xf86-video-vesa
pkgver=2.6.0.3
pkgrel=1
pkgdesc="XLibre Official Easy Install Drop in Replacement fork of X.Org vesa video driver (binary release)"
arch=(x86_64)
url="https://github.com/X11Libre"
license=('MIT')
groups=('xlibre-drivers')
options=(!strip)
source=("https://github.com/X11Libre/binpkg-arch-based/raw/refs/heads/main/${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=('glibc')
provides=('xf86-video-vesa' 'xlibre-video-vesa')
conflicts=('xf86-video-vesa' 'xlibre-video-vesa' 'X-ABI-VIDEODRV_VERSION<28' 'X-ABI-VIDEODRV_VERSION>=29')

sha256sums=('55097bd824a221ebd819f2a5503945b57e15dc0e8e1e475e042ffa8e6b72b7c5')

package() {
  tar -xf "${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

