# Maintainer: artist for Xlibre

pkgname=xlibre-video-voodoo-bin
_pkgname=xlibre-xf86-video-voodoo
pkgver=1.2.6.3
pkgrel=1
pkgdesc="XLibre Official Easy Install Drop in Replacement fork of X.Org voodoo video driver (binary release)"
arch=(x86_64)
url=https://x11libre.net/repo/arch_based/x86_64
license=('MIT')
groups=('xlibre-drivers')
options=(!strip)
source=(https://x11libre.net/repo/arch_based/x86_64/xlibre-video-voodoo-1.2.6.3-1-x86_64.pkg.tar.zst)
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=('glibc')
provides=('xlibre-video-voodoo' 'xf86-video-voodoo')
conflicts=('xlibre-video-voodoo' 'xf86-video-voodoo' 'X-ABI-VIDEODRV_VERSION<28' 'X-ABI-VIDEODRV_VERSION>=29')

sha256sums=('445357312902f8a742647f30ec797712369aa19746083dcbe3a2252f15469940')

package() {
  tar -xf "${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

