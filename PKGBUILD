# Maintainer: artist for Xlibre

pkgname=xlibre-video-ati-bin
_pkgname=xlibre-xf86-video-ati
pkgver=22.0.0.3
pkgrel=1
pkgdesc="XLibre Official Easy Install Drop in Replacement fork of X.Org ati video driver (binary release)"
arch=(x86_64)
url="https://github.com/X11Libre"
license=('MIT')
groups=('xlibre-drivers')
options=(!strip)
source=("https://github.com/X11Libre/binpkg-arch-based/raw/refs/heads/main/${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=('mesa' 'libpciaccess' 'libdrm' 'glibc')
provides=('xf86-video-ati' 'xlibre-video-ati')
conflicts=('xf86-video-ati' 'xlibre-video-ati' 'X-ABI-VIDEODRV_VERSION<28' 'X-ABI-VIDEODRV_VERSION>=29')

sha256sums=('963251cd18dd581c29da5308a63b7ecbbdfcb7f2caeba69c2f2b24a63a14c784')

package() {
  tar -xf "${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

