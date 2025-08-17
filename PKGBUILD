# Maintainer: artist for Xlibre

pkgname=xlibre-input-void-bin
_pkgname=xlibre-xf86-input-void
pkgver=1.4.2.1
pkgrel=2
pkgdesc="XLibre Official Easy Install Drop in Replacement fork of X.Org void input driver (binary release)"
arch=(x86_64)
url="https://github.com/X11Libre"
license=('custom')
groups=('xlibre-drivers')
options=(!strip)
source=("https://github.com/X11Libre/binpkg-arch-based/raw/refs/heads/main/${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=('glibc')
provides=('xf86-input-void' 'xlibre-input-void')
conflicts=('xf86-input-void' 'xlibre-input-void' 'X-ABI-XINPUT_VERSION<26' 'X-ABI-XINPUT_VERSION>=27')

sha256sums=('24f3dc590f78f11998490f75a67055e47d2a3a95dd9ab3107053f77be3e0a826')

package() {
  tar -xf "${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

