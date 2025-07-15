# Maintainer: Amolith <amolith@secluded.site>
pkgname="goradion-bin"
_pkgname=${pkgname%-bin}
pkgdesc="Terminal based online radio player"
pkgver="v0.5.6"
pkgrel=1
_dir="${pkgname}-${pkgver#v}"
arch=("any")
url="https://github.com/agejevasv/goradion"
license=("Unlicense")
depends=("mpv")
provides=("$_pkgname")
conflicts=("$_pkgname")

source=("${_pkgname}-${pkgver}-linux"::"${url}/releases/download/${pkgver}/${_pkgname}-linux-amd64")
b2sums=('9b937a14f5c27f1a38756e69ecd6227f7a8d7265551af330c1beb112e983d0373217c99a624bc88c66d462955176e5468d48d8d74c8f66dfaf1b459247db9daa')

package() {
  install -Dm755 "${_pkgname}-${pkgver}-linux" "$pkgdir/usr/bin/$_pkgname"
}
