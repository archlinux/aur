# Maintainer: michael rudolph <michael.rudolph@a4f.aero>
_pkgname=heketi
pkgname=${_pkgname}-client-bin
pkgver=6.0.0
pkgrel=1
pkgdesc="client for heketi, the RESTful based volume management framework for GlusterFS"
arch=('x86_64')
url="https://github.com/heketi/heketi"
license=('GPL2 LGPL3')
depends=('')
#makedepends=()
source_x86_64=("https://github.com/heketi/heketi/releases/download/v${pkgver}/${_pkgname}-client-v${pkgver}.linux.amd64.tar.gz")
sha512sums_x86_64=('cd4a4ddd3e225bc1d894be6ed54c17d89d0334bde8e6b0607510a499c44d10a3a601d2368bde0ce855f070849183d053da048929be56258b3193aa6580b1b791')
#noextract=()

package() {
  cd "${_pkgname}-client"
  install -Dm755 "bin/${_pkgname}-cli" "$pkgdir/usr/bin/${_pkgname}-cli"
}
