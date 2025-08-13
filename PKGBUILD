# Maintainer: artist for Xlibre

_pkgname_xf86=xf86-input-elographics
_pkgname=xlibre-$_pkgname_xf86
pkgname=$_pkgname-bin
pkgver=1.4.4.1
pkgrel=2
pkgdesc="Official XLibre fork of X.Org Elographics TouchScreen input driver"
arch=(x86_64)
url="https://github.com/X11Libre"
license=('MIT')
groups=('xlibre-drivers')
options=(!strip)
source=("https://github.com/X11Libre/binpkg-arch-based/raw/refs/heads/main/${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=('glibc')
provides=($_pkgname $_pkgname_xf86)
conflicts=($_pkgname $_pkgname_xf86)

sha256sums=('9fa2525cfe620dbae6fb57d918f73794b6e42f0c86ed5186ce9455a38ed5517d')

package() {
  tar -xf "${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

