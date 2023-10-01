# Maintainer: Amir Zarrinkafsh <nightah at me dot com>
pkgname=goimports-reviser-bin
_pkgname=goimports-reviser
pkgver=3.4.5
pkgrel=1
pkgdesc="Tool for Golang to sort goimports by 3-4 groups: std, general, local(which is optional) and project dependencies."
arch=('x86_64')
url="https://github.com/incu6us/goimports-reviser"
license=('MIT')
provides=("${_pkgname}")
conflicts=('goimports-reviser-git')

source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")

sha256sums_x86_64=('af3c00f78c034b185985a7e10b9cbbb16a729256ffea3d8d12ebf65c68b0a7d7')

package() {
  install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
