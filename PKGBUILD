# Maintainer: Amir Zarrinkafsh <nightah at me dot com>
pkgname=goimports-reviser-bin
_pkgname=goimports-reviser
pkgver=2.4.1
pkgrel=2
pkgdesc="Tool for Golang to sort goimports by 3-4 groups: std, general, local(which is optional) and project dependencies."
arch=('x86_64')
url="https://github.com/incu6us/goimports-reviser"
license=('MIT')
provides=("${_pkgname}")
conflicts=('goimports-reviser-git')

source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")

sha256sums_x86_64=('2f9b63cee189a787ff670831c711e931a93ff79e84c70b38b9e42e3da68adf73')

package() {
  install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
