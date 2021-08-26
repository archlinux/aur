# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=access-matrix
pkgname=kubectl-$_pkgname-bin
pkgver=0.5.0
pkgrel=0
pkgdesc="Review Access - kubectl plugin to show an access matrix for k8s server resources"
url="https://github.com/corneliusweig/$_pkgname"
license=('APACHE')
arch=('x86_64')
source=("$_pkgname-$pkgver.tar.gz::${url/$_pkgname/rakkess}/releases/download/v$pkgver/${_pkgname}-amd64-linux.tar.gz")
sha512sums=('9f30e6998fcacecb13b4847722a845dad4f3d565b1b5a6de777b9e16937a796d44561611f272a2829f1aaceb5e47c5ad8dce3ec48296ee7d64559658d2f90663')
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
  install -D -m 0755 $srcdir/$_pkgname-amd64-linux $pkgdir/usr/bin/kubectl-${_pkgname/-/_}
}

#vim: syntax=sh

