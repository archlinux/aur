# Maintainer: artist for XLibre <artist4xlibre@proton.me>

_pkgname=kwin-x11-lite
pkgname="${_pkgname}-bin"
pkgver=6.5.3
pkgrel=1
pkgdesc="kwin-x11 with ports from kwin-wayland, bug fixes, and maybe other improvements, for XLibre"
arch=(x86_64)
url="https://github.com/KDE-Lite/kwin-x11-lite"
license=('custom')
options=(!strip)
source=("https://x11libre.net/repo/arch_based/x86_64/${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
provides=($_pkgname kwin-x11)
conflicts=($_pkgname kwin-x11)

sha256sums=('730643816f3715619c9d847255b46f87177fc682243a7c992efebcccf0a0389e')

package() {
  tar -xf "${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

