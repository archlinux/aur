# Maintainer: artist for XLibre <artist4xlibre@proton.me>

_pkgname1=plasma-x11-session
_pkgname2="${_pkgname1}-lite"
pkgname="${_pkgname2}-bin"
pkgver=6.5.3
pkgrel=1
pkgdesc="KDE Plasma X11 Session, light version with fixes and improvements"
arch=(x86_64)
url="https://github.com/KDE-Lite/plasma-workspace-lite"
license=('custom')
options=(!strip)
source=("https://x11libre.net/repo/arch_based/x86_64/${_pkgname2}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
provides=($_pkgname1 $_pkgname2)
conflicts=($_pkgname1 $_pkgname2)

sha256sums=('8edb9192e6dd0dfd4a3566301ca029b6082bfbb7384a06ca8686bd103b919f1d')

package() {
  tar -xf "${_pkgname2}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

