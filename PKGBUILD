# Maintainer: Amolith <amolith@secluded.site>
pkgname="goradion-bin"
_pkgname=${pkgname%-bin}
pkgdesc="Terminal based online radio player"
pkgver="v0.3.6"
pkgrel=1
_tag="${pkgver}-build3"
_dir="${pkgname}-${_tag#v}"
arch=("any")
url="https://github.com/agejevasv/goradion"
license=("Unlicense")
depends=("mpv")
provides=("$_pkgname")
conflicts=("$_pkgname")

source=("${_pkgname}-${pkgver}-linux"::"${url}/releases/download/${_tag}/${_pkgname}-linux-amd64")
b2sums=('bba2cbdb47a8bb65437738e56de02ac562feb20cc49bf35056509ba97b1db93544c22d7aa12ec32366c320f7d26f7580315fd7b180f12400e08b717f4519cd59')

package() {
  install -Dm755 "${_pkgname}-${pkgver}-linux" "$pkgdir/usr/bin/$_pkgname"
}
