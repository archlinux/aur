# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=access-matrix
pkgname=kubectl-$_pkgname-bin
pkgver=0.4.7
pkgrel=0
pkgdesc="Review Access - kubectl plugin to show an access matrix for k8s server resources"
url="https://github.com/corneliusweig/$_pkgname"
license=('APACHE')
arch=('x86_64')
source=("$_pkgname-$pkgver.tar.gz::${url/$_pkgname/rakkess}/releases/download/v$pkgver/${_pkgname}-amd64-linux.tar.gz")
sha512sums=('663bf8014f4d446a3850c7a254aa62554795c9c6a9f03c0ac09f2c916df1cbe0a458df256b9a04f16a30170fc564b45cd9d0daea2a8120ddfb6d8716f9f3cdb7')
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
  install -D -m 0755 $srcdir/$_pkgname-amd64-linux $pkgdir/usr/bin/kubectl-${_pkgname/-/_}
}

#vim: syntax=sh

