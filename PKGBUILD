# Maintainer: artist for Xlibre

pkgname=xlibre-input-wacom-bin
_pkgname=xlibre-xf86-input-wacom
pkgver=1.2.3.1
pkgrel=2
pkgdesc="XLibre Official Easy Install Drop in Replacement fork of X.Org Wacom tablet driver (binary release)"
arch=(x86_64)
url="https://github.com/X11Libre"
license=('GPL-2.0-or-later')
groups=('xlibre-drivers')
options=(!strip)
source=("https://github.com/X11Libre/binpkg-arch-based/raw/refs/heads/main/${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=('libxi' 'libxinerama' 'libxrandr' 'libx11' 'glibc')
provides=('xf86-input-wacom' 'xlibre-input-wacom')
conflicts=('xf86-input-wacom' 'xlibre-input-wacom' 'X-ABI-XINPUT_VERSION<26' 'X-ABI-XINPUT_VERSION>=27')

sha256sums=('f7610d8999f93b7a91ca437ba838491d155cc0f7ff1f57e01edc591b22333b0c')

package() {
  tar -xf "${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

