# Maintainer: artist for Xlibre

pkgname=xlibre-input-evdev-bin
_pkgname=xlibre-xf86-input-evdev
pkgver=2.11.0.2
pkgrel=2
pkgdesc="XLibre Official Easy Install Drop in Replacement fork of X.Org evdev input driver (binary release)"
arch=(x86_64)
url=https://x11libre.net/repo/arch_based/x86_64
license=('HPND-sell-variant AND MIT')
groups=('xlibre-drivers')
options=(!strip)
source=(https://x11libre.net/repo/arch_based/x86_64/xlibre-input-evdev-2.11.0.2-2-x86_64.pkg.tar.zst)
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=('xlibre-xserver-bin' 'mtdev' 'libevdev' 'glibc')
provides=('xf86-input-evdev' 'xlibre-input-evdev')
conflicts=('xf86-input-evdev' 'xlibre-input-evdev')

sha256sums=('51252bf0f7bad736cfd70767698df201ece2d1783f5e5c17aabbf05b3580886e')

package() {
  tar -xf "${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

