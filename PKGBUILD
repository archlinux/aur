# Maintainer: artist for XLibre <artist4xlibre@proton.me>

_pkgname=xlibre-server-common
_orgpkgname=xlibre-xserver-common
pkgname=$_pkgname-bin
pkgver=25.0.0.15
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
source=("https://x11libre.net/repo/arch_based/x86_64/${_orgpkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=(xkeyboard-config xorg-xkbcomp xorg-setxkbmap)
provides=($_pkgname 'xorg-server-common')
conflicts=($_pkgname 'xorg-server-common')

sha256sums=('84e66263c410f53cdf610289a742c770e546c8cc61ed4aea539986fd75d49eb6')

package() {
  tar -xf "${_orgpkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr var
}

