# Maintainer: artist for Xlibre

pkgname=xlibre-video-nouveau-bin
_pkgname=xlibre-xf86-video-nouveau
pkgver=1.0.18.1
pkgrel=2
pkgdesc="XLibre Official Easy Install Drop in Replacement fork of X.Org nouveau video driver (binary release)"
arch=(x86_64)
url="https://github.com/X11Libre"
license=('MIT')
groups=('xlibre-drivers')
options=(!strip)
source=("https://github.com/X11Libre/binpkg-arch-based/raw/refs/heads/main/${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=('mesa' 'libdrm' 'glibc')
provides=('xf86-video-nouveau' 'xlibre-video-nouveau')
conflicts=('xf86-video-nouveau' 'xlibre-video-nouveau' 'xorg-server<21.1.1' 'X-ABI-VIDEODRV_VERSION<28' 'X-ABI-VIDEODRV_VERSION>=29')

sha256sums=('56239ca534368b58a0419aaa992d12cc1ea46aa68606202bf669aa456c8622e0')

package() {
  tar -xf "${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

