# Maintainer: artist for XLibre <artist4xlibre@proton.me>

_pkgname1=kwin-x11
_pkgname2="${_pkgname1}-sonic"
pkgname="${_pkgname2}-bin"
pkgver=6.5.3
pkgrel=2.2
pkgdesc="kwin-x11 with ports from kwin-wayland, bug fixes, and maybe other improvements, for XLibre"
arch=(x86_64)
url="https://github.com/Sonic-DE/${_pkgname2}"
license=('custom')
options=(!strip)
source=("https://x11libre.net/repo/arch_based/x86_64/${_pkgname1}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("${_pkgname1}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
provides=($_pkgname kwin-x11 "${_pkgname1}-lite-bin")
conflicts=($_pkgname kwin-x11 "${_pkgname1}-lite-bin")
replaces=("${_pkgname1}-lite-bin")

sha256sums=('c25756507110f1f0562d5a4b7325a82209aeaec206a9cfb0bbd4c410d9cd5efb')

package() {
  tar -xf "${_pkgname1}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

