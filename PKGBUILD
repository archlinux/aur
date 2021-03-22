# Maintainer: Łaurent ʘ❢Ŧ Ŧough <laurent dot fough at gmail dot com>

pkgname=wahay-bin
_pkgname=wahay
pkgver=6be34ec
_buildid=202007132259.6be34ec
pkgrel=1
pkgdesc="Wahay - Host and Participate in voice conference calls (uses Tor & Mumble)"
arch=('x86_64')
url="https://wahay.org"
license=('GPL3')
provides=('wahay')
depends=('gtk3' 'mumble' 'tor' 'torsocks' 'xclip')
optdepends=('torsocks-git')
conflicts=('wahay' 'wahay-bin')

source_x86_64=("https://wahay.org/downloads/wahay-latest")
sha256sums_x86_64=('61441bb4c5d08e56302074f0e6b46d0c83e568ffc45cf46c0635cbf6b96e8ba3')

package () {
  install -Dm 775 "${_pkgname}-latest" "${pkgdir}/usr/bin/${_pkgname}"
}
