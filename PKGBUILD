# Maintainer: artist for Xlibre

pkgname=xlibre-video-voodoo-bin
_pkgname=xlibre-xf86-video-voodoo
pkgver=1.2.6.1
pkgrel=2
pkgdesc="XLibre Official Easy Install Drop in Replacement fork of X.Org voodoo video driver (binary release)"
arch=(x86_64)
url="https://github.com/X11Libre/xserver/"
license=('MIT')
groups=('xlibre-drivers')
options=(!strip)
source=("https://github.com/X11Libre/binpkg-arch-based/raw/refs/heads/main/${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=('glibc')
provides=('xlibre-video-voodoo' 'xf86-video-voodoo')
conflicts=('xlibre-video-voodoo' 'xf86-video-voodoo' 'X-ABI-VIDEODRV_VERSION<28' 'X-ABI-VIDEODRV_VERSION>=29')

sha256sums=('f616001fee975dd21f2a3e1fc5675e7034d5a0ed09a6d116357b28e6551640f7')

package() {
  tar -xf "${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

