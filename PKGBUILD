# Maintainer: artist for XLibre <artist4xlibre@proton.me>

pkgname=xlibre-video-amdgpu-bin
_pkgname=xlibre-xf86-video-amdgpu
pkgver=23.0.0.6
pkgrel=1
pkgdesc="XLibre Official Easy Install Drop in Replacement fork of X.Org amdgpu video driver (binary release)"
arch=(x86_64)
url="https://github.com/X11Libre"
license=('MIT')
groups=('xlibre-drivers')
options=(!strip)
source=("https://x11libre.net/repo/arch_based/x86_64/${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=('mesa' 'libdrm' 'glibc')
provides=('xf86-video-amdgpu' 'xlibre-video-amdgpu')
conflicts=('xf86-video-amdgpu' 'xlibre-video-amdgpu' 'X-ABI-VIDEODRV_VERSION<28' 'X-ABI-VIDEODRV_VERSION>=29')

sha256sums=('3d65c83bdc1560b3c790ca5d22635262638e32fff11277787ac2eee2f263c4af')

package() {
  tar -xf "${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

