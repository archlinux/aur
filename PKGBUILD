# Maintainer: Bryan Joshua Pedini <bryan [at] pedini [dot] dev>

_pkgname="deskflow"
_srcname="deskflow"
_srcmntr="deskflow"

pkgname="${_pkgname}-bin"
pkgver="1.26.0"
pkgrel="4"
pkgdesc="Share a single keyboard and mouse between multiple computers"
url="https://github.com/${_srcmntr}/${_srcname}"
arch=("x86_64")
license=("AGPL3")
options=("!strip" "!debug")
_archive="${_pkgname}-${pkgver}.deb"
source=("${_archive}::https://github.com/${_srcmntr}/${_srcname}/releases/download/v${pkgver}/deskflow-${pkgver}-debian-trixie-x86_64.deb")
conflicts=("deskflow")
provides=("deskflow")

sha256sums=("c90535b55144b1cdbfcd80c362fc44398b7ccb9aad257aaee9ab9a3b52ae341c")

package() {
  bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
