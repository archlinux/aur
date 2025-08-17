# Maintainer: artist for Xlibre

pkgname=xlibre-input-vmmouse-bin
_pkgname=xlibre-xf86-input-vmmouse
pkgver=13.2.0.1
pkgrel=2
pkgdesc="XLibre Official Easy Install Drop in Replacement fork of X.Org VMWare Mouse input driver (binary release)"
arch=(x86_64)
url="https://github.com/X11Libre"
license=('custom')
groups=('xlibre-drivers')
options=(!strip)
source=("https://github.com/X11Libre/binpkg-arch-based/raw/refs/heads/main/${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
provides=('xlibre-input-vmmouse' 'xlibre-input-vmmouse')
conflicts=('xlibre-input-vmmouse' 'xlibre-input-vmmouse' 'xorg-server<21.1.1' 'X-ABI-XINPUT_VERSION<26' 'X-ABI-XINPUT_VERSION>=27')

sha256sums=('8ee77fe83de95f60a09cee8b486044ec24d7f41b348342b823c8e2c23966ffc5')

package() {
  tar -xf "${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

