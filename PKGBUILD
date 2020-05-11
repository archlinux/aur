# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=glide-bin
_pkgname=glide
pkgdesc="Dependency management and vendoring for Go projects"
pkgver=0.13.3
pkgrel=1
arch=('x86_64')
url="https://github.com/Masterminds/glide"
license=('MIT')
provides=('glide')
source=("https://github.com/Masterminds/glide/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('ba5619955a28d7931a9ae38d095fc5fa5acc28e77abc8737a8136c652d9cbb38')

package() {
  install -Dm 755 "$srcdir/linux-amd64/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
}
