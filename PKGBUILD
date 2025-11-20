# Maintainer: Amolith <amolith@secluded.site>
pkgname="goradion-bin"
_pkgname=${pkgname%-bin}
pkgdesc="Terminal based online radio player"
pkgver="v0.6.2"
pkgrel=1
_dir="${pkgname}-${pkgver#v}"
arch=("any")
url="https://github.com/agejevasv/goradion"
license=("Unlicense")
depends=("mpv")
provides=("$_pkgname")
conflicts=("$_pkgname")

source=("${_pkgname}-${pkgver}-linux"::"${url}/releases/download/${pkgver}/${_pkgname}-linux-amd64")
b2sums=('32e6e33a93820173a7ab5b8d6fbb8d4806c18f60a7de01e17e5ca09856fe9d2b1f01202b61c7415da3bf8d3f6852de850f4d50c57acdc355750693de51d5e446')

package() {
  install -Dm755 "${_pkgname}-${pkgver}-linux" "$pkgdir/usr/bin/$_pkgname"
}
