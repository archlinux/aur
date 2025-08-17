# Maintainer: artist for Xlibre

pkgname=xlibre-video-dummy-bin
_pkgname=xlibre-xf86-video-dummy
pkgver=0.4.1.1
pkgrel=2
pkgdesc="XLibre Official Easy Install Drop in Replacement fork of X.Org dummy video driver (binary release)"
arch=(x86_64)
url="https://github.com/X11Libre"
license=('MIT AND X11')
groups=('xlibre-drivers')
options=(!strip)
source=("https://github.com/X11Libre/binpkg-arch-based/raw/refs/heads/main/${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=('glibc')
provides=('xf86-video-dummy' 'xlibre-video-dummy')
conflicts=('xf86-video-dummy' 'xlibre-video-dummy' 'xorg-server<21.1.1' 'X-ABI-VIDEODRV_VERSION<28' 'X-ABI-VIDEODRV_VERSION>=29')

sha256sums=('e73569e1551e48a04479ef16c3535763180d288682ab3d90c6d495d5968243a7')

package() {
  tar -xf "${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

