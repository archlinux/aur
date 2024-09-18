# Maintainer: Amolith <amolith@secluded.site>
pkgname="goradion-bin"
_pkgname=${pkgname%-bin}
pkgdesc="Terminal based online radio player"
pkgver="v0.4.5"
pkgrel=1
_dir="${pkgname}-${pkgver#v}"
arch=("any")
url="https://github.com/agejevasv/goradion"
license=("Unlicense")
depends=("mpv")
provides=("$_pkgname")
conflicts=("$_pkgname")

source=("${_pkgname}-${pkgver}-linux"::"${url}/releases/download/${pkgver}/${_pkgname}-linux-amd64")
b2sums=('e5395b0b8f7314f57833a37b33688bf7aff8bbd5e6e7fb346f9edc0343425bb78ba4c05d0187bbb795adfcb8450c15c19be9e54c76e3e4438216e5f43f83422a')

package() {
  install -Dm755 "${_pkgname}-${pkgver}-linux" "$pkgdir/usr/bin/$_pkgname"
}
