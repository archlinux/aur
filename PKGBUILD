# Maintainer: artist for Xlibre

pkgname=xlibre-input-libinput-bin
_pkgname=xlibre-input-libinput
pkgver=1.5.1.0
pkgrel=9.2
pkgdesc="XLibre Official Easy Install Drop in Replacement fork of X.Org generic input driver for the xorg server based on libinput (binary release)"
arch=(x86_64)
url="https://x11libre.net/repo/arch_based/x86_64"
license=('MIT')
groups=('xlibre-drivers')
options=(!strip)
source=("${url}/${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=('libinput' 'glibc')
provides=('xf86-input-libinput' "$_pkgname")
conflicts=('xf86-input-libinput' "$_pkgname" 'xorg-server-common<25.0.0.0' 'X-ABI-XINPUT_VERSION<26' 'X-ABI-XINPUT_VERSION>=27')

sha256sums=('9b3362d3872ee19c0975cea28c766fe4c738b4ea9ca8000582bb039659b292e5')

package() {
  tar -xf "${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

