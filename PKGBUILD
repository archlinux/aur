# Maintainer: Matt M <numbernine dot archlinux at complexnumber dot net>

pkgname=diffoci-bin
_pkgname=diffoci
pkgver=0.1.8
pkgrel=1
pkgdesc="diff for Docker and OCI container images"
arch=('x86_64')
url="https://github.com/reproducible-containers/diffoci"
license=("Apache-2.0")
conflicts=()
provides=()
source=("${_pkgname}-v${pkgver}.linux-amd64::https://github.com/reproducible-containers/diffoci/releases/download/v${pkgver}/${_pkgname}-v${pkgver}.linux-amd64")

sha256sums=('01e6b50c1568c9d61c758ef6da81869f2c26c852698d73dca961b3617effe949')

package() {
  install -Dm755 "$srcdir/${_pkgname}-v${pkgver}.linux-amd64" "$pkgdir/usr/bin/diffoci"
}
