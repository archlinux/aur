# Maintainer: artist for Xlibre

_pkgname_xf86=xf86-input-evdev
_pkgname=xlibre-$_pkgname_xf86
pkgname=$_pkgname-bin
pkgver=2.11.0.1
pkgrel=2
pkgdesc="Official XLibre fork of X.Org evdev input driver"
arch=(x86_64)
url="https://github.com/X11Libre"
license=('HPND-sell-variant AND MIT')
groups=('xlibre-drivers')
options=(!strip)
source=("https://github.com/X11Libre/binpkg-arch-based/raw/refs/heads/main/${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=('xlibre-xserver' 'mtdev' 'libevdev' 'glibc')
provides=($_pkgname $_pkgname_xf86)
conflicts=($_pkgname $_pkgname_xf86)

sha256sums=('f66b06f9854994066314b32a722ebee66ce747497f642cda47895a6534651879')

package() {
  tar -xf "${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

