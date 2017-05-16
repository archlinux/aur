# Maintainer: michael rudolph <michael.rudolph@a4f.aero>
_pkgname=heketi
pkgname=${_pkgname}-client-bin
pkgver=4.0.0
pkgrel=1
pkgdesc="client for heketi, the RESTful based volume management framework for GlusterFS"
arch=('x86_64')
url="https://github.com/heketi/heketi"
license=('GPL2 LGPL3')
depends=('')
#makedepends=()
source_x86_64=("https://github.com/heketi/heketi/releases/download/v${pkgver}/${_pkgname}-client-v${pkgver}.linux.amd64.tar.gz")
sha512sums_x86_64=('c1ade07205e40a7b0311698fa99d063e35a1072c2d026cdf19afb860d4428e48a41ea5c70714e44c3b98789a28bc3cd160b9fb056cd3db2de58c128fe7ae3351')
#noextract=()

package() {
  cd "${_pkgname}-client"
  install -Dm755 "bin/${_pkgname}-cli" "$pkgdir/usr/bin/${_pkgname}-cli"
}
