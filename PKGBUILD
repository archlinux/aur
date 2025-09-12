# Maintainer: Amolith <amolith@secluded.site>
pkgname="goradion-bin"
_pkgname=${pkgname%-bin}
pkgdesc="Terminal based online radio player"
pkgver="v0.6.1"
pkgrel=1
_dir="${pkgname}-${pkgver#v}"
arch=("any")
url="https://github.com/agejevasv/goradion"
license=("Unlicense")
depends=("mpv")
provides=("$_pkgname")
conflicts=("$_pkgname")

source=("${_pkgname}-${pkgver}-linux"::"${url}/releases/download/${pkgver}/${_pkgname}-linux-amd64")
b2sums=('0f55b73ba31633df7b2fed0e7e336017cafe7d99c31b03d5675dd1e718ff40efede01359ac84c52dac43d2e60f45d8ce8ae39aabc206880cf38c9f6ab4e3fc9a')

package() {
  install -Dm755 "${_pkgname}-${pkgver}-linux" "$pkgdir/usr/bin/$_pkgname"
}
