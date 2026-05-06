# Maintainer: Bryan Joshua Pedini <bryan [at] pedini [dot] dev>

_pkgname="deskflow"
_srcname="deskflow"
_srcmntr="deskflow"

pkgname="${_pkgname}-bin"
pkgver="1.26.0"
pkgrel="3"
pkgdesc="Share a single keyboard and mouse between multiple computers"
url="https://github.com/${_srcmntr}/${_srcname}"
arch=("x86_64")
license=("AGPL3")
options=("!strip" "!debug")
_archive="${_pkgname}-${pkgver}.deb"
source=("${_archive}::https://github.com/${_srcmntr}/${_srcname}/releases/download/v${pkgver}/deskflow-${pkgver}-debian-trixie-x86_64.AppImage")
conflicts=("deskflow")
provides=("deskflow")

sha256sums=("e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")

package() {
  bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
