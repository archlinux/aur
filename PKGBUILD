# Maintainer: artist for Xlibre

_pkgname_xf86=xf86-input-vmmouse
_pkgname=xlibre-$_pkgname_xf86
pkgname=$_pkgname-bin
pkgver=13.2.0.1
pkgrel=2
pkgdesc="Official XLibre fork of X.Org VMWare Mouse input driver"
arch=(x86_64)
url="https://github.com/X11Libre"
license=('custom')
groups=('xlibre-drivers')
options=(!strip)
source=("https://github.com/X11Libre/binpkg-arch-based/raw/refs/heads/main/${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
provides=($_pkgname $_pkgname_xf86)
conflicts=($_pkgname $_pkgname_xf86 'xorg-server<21.1.1' 'X-ABI-XINPUT_VERSION<26' 'X-ABI-XINPUT_VERSION>=27')

sha256sums=('8ee77fe83de95f60a09cee8b486044ec24d7f41b348342b823c8e2c23966ffc5')

package() {
  tar -xf "${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

