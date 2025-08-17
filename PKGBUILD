# Maintainer: artist for Xlibre

pkgname=xlibre-video-fbdev-bin
_pkgname=xlibre-xf86-video-fbdev
pkgver=0.5.1.1
pkgrel=2
pkgdesc="XLibre Official Easy Install Drop in Replacement fork of X.Org fbdev video driver (binary release)"
arch=(x86_64)
url="https://github.com/X11Libre"
license=('MIT')
groups=('xlibre-drivers')
options=(!strip)
source=("https://github.com/X11Libre/binpkg-arch-based/raw/refs/heads/main/${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=('glibc')
provides=('xf86-video-fbdev' 'xlibre-video-fbdev')
conflicts=('xf86-video-fbdev' 'xlibre-video-fbdev' 'X-ABI-VIDEODRV_VERSION<28' 'X-ABI-VIDEODRV_VERSION>=29')

sha256sums=('8c13395efd7919a5cd74b7c87cdde0bd31cf55d829a4c751446a76d9efcf445a')

package() {
  tar -xf "${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

