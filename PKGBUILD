# Maintainer: artist for Xlibre

pkgname=xlibre-video-vmware-bin
_pkgname=xlibre-xf86-video-vmware
pkgver=13.4.0.3
pkgrel=2
pkgdesc="XLibre Official Easy Install Drop in Replacement fork of X.Org vmware video driver (binary release)"
arch=(x86_64)
url=https://x11libre.net/repo/arch_based/x86_64
license=('MIT AND X11')
groups=('xlibre-drivers')
options=(!strip)
source=(https://x11libre.net/repo/arch_based/x86_64/xlibre-video-vmware-13.4.0.3-2-x86_64.pkg.tar.zst)
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=('glibc' 'libxext' 'libx11' 'libdrm' 'glibc')
provides=('xf86-video-vmware' 'xlibre-video-vmware')
conflicts=('xf86-video-vmware' 'xlibre-video-vmware' 'xorg-server<21.1.1' 'X-ABI-VIDEODRV_VERSION<28' 'X-ABI-VIDEODRV_VERSION>=29')

sha256sums=('7bc535d63647ddd834df3ef4f3dd0fb098a7e26d09dff54e1e6769c668a8a346')

package() {
  tar -xf "${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

