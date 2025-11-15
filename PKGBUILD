# Maintainer: artist for XLibre <artist4xlibre@proton.me>

pkgname=xlibre-input-vmmouse-bin
_pkgname=xlibre-xf86-input-vmmouse
pkgver=13.2.0.3
pkgrel=1
pkgdesc="XLibre Official Easy Install Drop in Replacement fork of X.Org VMWare Mouse input driver (binary release)"
arch=(x86_64)
url="https://github.com/X11Libre"
license=('custom')
groups=('xlibre-drivers')
options=(!strip)
source=("https://x11libre.net/repo/arch_based/x86_64/${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
provides=('xlibre-input-vmmouse' 'xlibre-input-vmmouse')
conflicts=('xlibre-input-vmmouse' 'xlibre-input-vmmouse' 'xorg-server<21.1.1' 'X-ABI-XINPUT_VERSION<26' 'X-ABI-XINPUT_VERSION>=27')

sha256sums=('2681ad462f63fa64f8b951747ff4b53c7118731768013c19f559d3ae04f5cac0')

package() {
  tar -xf "${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

