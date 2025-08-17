# Maintainer: artist for Xlibre

pkgname=xlibre-input-elographics-bin
_pkgname=xlibre-xf86-input-elographics
pkgver=1.4.4.1
pkgrel=2
pkgdesc="XLibre Official Easy Install Drop in Replacement fork of X.Org Elographics TouchScreen input driver (binary release)"
arch=(x86_64)
url="https://github.com/X11Libre"
license=('MIT')
groups=('xlibre-drivers')
options=(!strip)
source=("https://github.com/X11Libre/binpkg-arch-based/raw/refs/heads/main/${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=('glibc')
provides=('xf86-input-elographics' 'xlibre-input-elographics')
conflicts=('xf86-input-elographics' 'xlibre-input-elographics')

sha256sums=('9fa2525cfe620dbae6fb57d918f73794b6e42f0c86ed5186ce9455a38ed5517d')

package() {
  tar -xf "${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

