# Maintainer: Bryan Joshua Pedini <bryan [at] pedini [dot] dev>

_pkgname="deskflow"
_srcname="deskflow"
_srcmntr="deskflow"

pkgname="${_pkgname}-bin"
pkgver="1.26.0"
pkgrel="1"
pkgdesc="Share a single keyboard and mouse between multiple computers"
url="https://github.com/${_srcmntr}/${_srcname}"
arch=("x86_64")
license=("AGPL3")
options=("!strip" "!debug")
_archive="${_pkgname}-${pkgver}.deb"
source=("${_archive}::https://github.com/${_srcmntr}/${_srcname}/releases/download/v${pkgver}/deskflow-${pkgver}-debian-trixie-x86_64.AppImage")
conflicts=("deskflow")
provides=("deskflow")

sha256sums=("4760d432cd414539df029d1bf0776ebe9069f3c39193845badc52f36dcb27563")

package() {
  bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
