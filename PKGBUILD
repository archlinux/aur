# Maintainer: Keon Cachia <keonfarrugia@gmail.com>

pkgname=remote-benben-appimage
pkgver=0.3.0
pkgrel=1
pkgdesc="A tool to control benben from an unix socket"
arch=("x86_64")
url="https://chiselapp.com/user/MistressRemilia/repository/benben/home"
license=('AGPL-3.0-or-later')
depends=("fuse2"
	"benben")
provides=("remote-benben")
conflicts=("remote-benben")
options=("!strip")
_pkgname=remote-benben
_appimage="${_pkgname}"-"${pkgver}"-x86_64.AppImage
source=(
    https://chiselapp.com/user/MistressRemilia/repository/benben/uv/"${_appimage}"
)
sha256sums=('8c7496fddbe44a10feb4e0cbab7b733e008dbdf998adda3092437587ecfb8366')

package() {
  install -Dm755 "${_appimage}" "${pkgdir}/usr/bin/remote-benben"
}
