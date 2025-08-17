# Maintainer: artist for Xlibre

pkgname=xlibre-xf86-input-libinput-bin
_pkgname=xlibre-xf86-input-libinput
pkgver=1.5.0.1
pkgrel=1
pkgdesc="XLibre Official Easy Install Drop in Replacement fork of X.Org generic input driver for the xorg server based on libinput (binary release)"
arch=(x86_64)
url="https://github.com/X11Libre"
license=('MIT')
groups=('xlibre-drivers')
options=(!strip)
source=("https://github.com/X11Libre/binpkg-arch-based/raw/refs/heads/main/${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=('libinput' 'glibc')
provides=('xf86-input-libinput' 'xlibre-input-libinput')
conflicts=('xf86-input-libinput' 'xlibre-input-libinput' 'xorg-server-common<25.0.0.0' 'X-ABI-XINPUT_VERSION<26' 'X-ABI-XINPUT_VERSION>=27')

sha256sums=('dd8151b3242de4e846e78c48bd60982cfcc9f9ab0d1f4f6bde36a25f2be2f8cc')

package() {
  tar -xf "${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

