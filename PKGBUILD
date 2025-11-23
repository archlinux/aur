# Maintainer: artist for XLibre <artist4xlibre@proton.me>

_pkgname1=plasma-workspace
_pkgname2="${_pkgname1}-lite"
pkgname="${_pkgname2}-bin"
pkgver=6.5.3
pkgrel=1
pkgdesc="KDE Plasma Workspace, light version with fixes and improvements for X11 session"
arch=(x86_64)
url="https://github.com/KDE-Lite/plasma-workspace-lite"
license=('custom')
options=(!strip)
source=("https://x11libre.net/repo/arch_based/x86_64/${_pkgname2}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
provides=($_pkgname1 $_pkgname2)
conflicts=($_pkgname1 $_pkgname2)

sha256sums=('27d3e892ed85b343c2ed217cbcea30212f7c366356f717ae9ff2d86baebb98fd')

package() {
  tar -xf "${_pkgname2}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

