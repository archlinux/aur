# Maintainer: artist for XLibre <artist4xlibre@proton.me>

_pkgname1=plasma-workspace
_pkgname2="${_pkgname1}-sonic"
pkgname="${_pkgname2}-bin"
pkgver=6.5.3
pkgrel=2.7
pkgdesc="KDE Plasma Workspace, light version with fixes and improvements for X11 session"
arch=(x86_64)
url="https://github.com/Sonic-DE/${_pkgname2}"
license=('custom')
options=(!strip)
source=("https://x11libre.net/repo/arch_based/x86_64/${_pkgname2}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
provides=($_pkgname1 $_pkgname2 "${_pkgname1}-lite-bin")
conflicts=($_pkgname1 $_pkgname2 "${_pkgname1}-lite-bin")
replaces=("${_pkgname1}-lite-bin")

sha256sums=('50e9b508fc5e20fe17be8cdd6d1755f0eec2bf50f805d35a5789c93ea077ef67')

package() {
  tar -xf "${_pkgname2}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

