# Maintainer: Amir Zarrinkafsh <nightah at me dot com>
pkgname=goimports-reviser-bin
_pkgname=goimports-reviser
pkgver=3.6.3
pkgrel=1
pkgdesc="Tool for Golang to sort goimports by 3-4 groups: std, general, local(which is optional) and project dependencies."
arch=('x86_64')
url="https://github.com/incu6us/goimports-reviser"
license=('MIT')
provides=("${_pkgname}")
conflicts=('goimports-reviser-git')

source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")

sha256sums_x86_64=('62ed1ab52d435f8712587d8f4a77a65a4a5f3bb6ba2584afa87e692d19912b2f')

package() {
  install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
