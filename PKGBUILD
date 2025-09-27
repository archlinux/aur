# Maintainer: artist for Xlibre

pkgname=xlibre-video-vmware-bin
_pkgname=xlibre-xf86-video-vmware
pkgver=13.4.0.3
pkgrel=1
pkgdesc="XLibre Official Easy Install Drop in Replacement fork of X.Org vmware video driver (binary release)"
arch=(x86_64)
url="https://github.com/X11Libre"
license=('MIT AND X11')
groups=('xlibre-drivers')
options=(!strip)
source=("https://github.com/X11Libre/binpkg-arch-based/raw/refs/heads/main/${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=('glibc' 'libxext' 'libx11' 'libdrm' 'glibc')
provides=('xf86-video-vmware' 'xlibre-video-vmware')
conflicts=('xf86-video-vmware' 'xlibre-video-vmware' 'xorg-server<21.1.1' 'X-ABI-VIDEODRV_VERSION<28' 'X-ABI-VIDEODRV_VERSION>=29')

sha256sums=('8f94e0c6493677823dd4ca87e281038f79a28d2a9a07f117cb3e745f7b40c1f2')

package() {
  tar -xf "${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

