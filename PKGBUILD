# Maintainer: artist for XLibre <artist4xlibre@proton.me>

_pkgname1=plasma-x11-session
_pkgname2="${_pkgname1}-sonic"
pkgname="${_pkgname2}-bin"
pkgver=6.5.3
pkgrel=2.4
pkgdesc="KDE Plasma X11 Session, light version with fixes and improvements"
arch=(x86_64)
url='https://github.com/Sonic-DE/plasma-workspace-sonic'
license=('custom')
options=(!strip)
source=("https://x11libre.net/repo/arch_based/x86_64/${_pkgname2}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
provides=($_pkgname1 $_pkgname2 "${_pkgname1}-lite")
conflicts=($_pkgname1 $_pkgname2 "${_pkgname1}-lite")
replaces=("${_pkgname1}-lite")

sha256sums=('295cf04256bc2a3bd9ace852050ccff14ad36927d749d7e3332f56a9dad76c81')

package() {
  tar -xf "${_pkgname2}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

