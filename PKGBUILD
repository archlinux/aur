# Maintainer: Matt M <numbernine dot archlinux at complexnumber dot net>

pkgname=diffoci-bin
_pkgname=diffoci
pkgver=0.1.7
pkgrel=1
pkgdesc="diff for Docker and OCI container images"
arch=('x86_64')
url="https://github.com/reproducible-containers/diffoci"
license=("Apache-2.0")
conflicts=()
provides=()
source=("${_pkgname}-v${pkgver}.linux-amd64::https://github.com/reproducible-containers/diffoci/releases/download/v${pkgver}/${_pkgname}-v${pkgver}.linux-amd64")

sha256sums=('7c8217cc622cfadf7ad86f116ef6e8d5e4a62fa5a57a0adcc5880044f13cfe3e')

package() {
  install -Dm755 "$srcdir/${_pkgname}-v${pkgver}.linux-amd64" "$pkgdir/usr/bin/diffoci"
}
