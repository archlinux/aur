# Maintainer: michael rudolph <michael.rudolph@a4f.aero>
_pkgname=heketi
pkgname=${_pkgname}-client-bin
pkgver=5.0.0
pkgrel=1
pkgdesc="client for heketi, the RESTful based volume management framework for GlusterFS"
arch=('x86_64')
url="https://github.com/heketi/heketi"
license=('GPL2 LGPL3')
depends=('')
#makedepends=()
source_x86_64=("https://github.com/heketi/heketi/releases/download/v${pkgver}/${_pkgname}-client-v${pkgver}.linux.amd64.tar.gz")
sha512sums_x86_64=('5a0569b782ae44fb9026c76a40c88fa1d8a8d61d3c6721040423f1b4ddc89fd99c9a3110a918f0029ae933ca6ae2975c85c30d65abaadcc30630ef585102b483')
#noextract=()

package() {
  cd "${_pkgname}-client"
  install -Dm755 "bin/${_pkgname}-cli" "$pkgdir/usr/bin/${_pkgname}-cli"
}
