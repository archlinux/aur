# Maintainer: artist for Xlibre

_pkgname=xlibre-server-common
_orgpkgname=xlibre-xserver-common
pkgname=$_pkgname-bin
pkgver=25.0.0.12
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
source=("https://github.com/X11Libre/binpkg-arch-based/raw/refs/heads/main/${_orgpkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=(xkeyboard-config xorg-xkbcomp xorg-setxkbmap)
provides=($_pkgname 'xorg-server-common')
conflicts=($_pkgname 'xorg-server-common')

sha256sums=('60fcc5a8be99bb7f0f90cab4cd992fcaedbe5cee17975b5f7d591868562a23fe')

package() {
  tar -xf "${_orgpkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr var
}

