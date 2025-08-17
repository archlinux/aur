# Maintainer: artist for Xlibre

_pkgname=xlibre-xserver-common
pkgname=$_pkgname-bin
pkgver=25.0.0.8
pkgrel=1
pkgdesc="XLibre Official Easy Install Drop in Replacement fork of X.Org Xorg server common files (binary release)"
arch=(x86_64)
url="https://github.com/X11Libre/xserver"
license=('LicenseRef-Adobe-Display-PostScript'
         'BSD-3-Clause'
         'LicenseRef-DEC-3-Clause'
         'HPND'
         'LicenseRef-HPND-sell-MIT-disclaimer-xserver'
         'HPND-sell-variant'
         'ICU'
         'ISC'
         'MIT'
         'MIT-open-group'
         'NTP'
         'SGI-B-2.0'
         'SMLNJ'
         'X11'
         'X11-distribute-modifications-variant')
groups=('xlibre')
options=(!strip)
source=("https://github.com/X11Libre/binpkg-arch-based/raw/refs/heads/main/${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=(xkeyboard-config xorg-xkbcomp xorg-setxkbmap)
provides=($_pkgname 'xorg-server-common' 'xlibre-server-common')
conflicts=($_pkgname 'xorg-server-common' 'xlibre-server-common')

sha256sums=('9a438adeaaec0307076bde983dc20cccbd47cb0a24af2e18205d08e9a0fdfb83')

package() {
  tar -xf "${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr var
}

