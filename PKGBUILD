# Maintainer: artist for Xlibre

pkgname=xlibre-video-vmware-bin
_pkgname=xlibre-xf86-video-vmware
pkgver=13.4.0.1
pkgrel=2
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

sha256sums=('f1a5ac813ed044e562f4bd9ad5bebc057ffa97f7b4b33c55b3429b9b919e509d')

package() {
  tar -xf "${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

