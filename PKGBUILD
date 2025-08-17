# Maintainer: artist for Xlibre

pkgname=xlibre-input-evdev-bin
_pkgname=xlibre-xf86-input-evdev
pkgver=2.11.0.1
pkgrel=2
pkgdesc="XLibre Official Easy Install Drop in Replacement fork of X.Org evdev input driver (binary release)"
arch=(x86_64)
url="https://github.com/X11Libre"
license=('HPND-sell-variant AND MIT')
groups=('xlibre-drivers')
options=(!strip)
source=("https://github.com/X11Libre/binpkg-arch-based/raw/refs/heads/main/${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=('xlibre-xserver-bin' 'mtdev' 'libevdev' 'glibc')
provides=('xf86-input-evdev' 'xlibre-input-evdev')
conflicts=('xf86-input-evdev' 'xlibre-input-evdev')

sha256sums=('f66b06f9854994066314b32a722ebee66ce747497f642cda47895a6534651879')

package() {
  tar -xf "${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

