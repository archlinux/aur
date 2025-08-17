# Maintainer: artist for Xlibre

pkgname=xlibre-video-sisusb-bin
_pkgname=xlibre-xf86-video-sisusb
pkgver=0.9.7.1
pkgrel=2
pkgdesc="XLibre Official Easy Install Drop in Replacement fork of X.Org sisusb video driver (binary release)"
arch=(x86_64)
url="https://github.com/X11Libre"
license=('BSD-3-Clause')
groups=('xlibre-drivers')
options=(!strip)
source=("https://github.com/X11Libre/binpkg-arch-based/raw/refs/heads/main/${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=('mesa' 'libdrm' 'glibc')
provides=('xf86-video-sisusb' 'xlibre-video-sisusb')
conflicts=('xf86-video-sisusb' 'xlibre-video-sisusb' 'xorg-server<21.1.1' 'X-ABI-VIDEODRV_VERSION<28' 'X-ABI-VIDEODRV_VERSION>=29')

sha256sums=('2766cf910683f0a6f34d741ac7f5a4536343c170e3de34eede7d345315caff0f')

package() {
  tar -xf "${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

