# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=kudo
pkgname=kubectl-$_pkgname-bin
pkgver=0.19.0 # renovate: datasource=github-releases depName=kudobuilder/kudo
pkgrel=2
pkgdesc="Kubernetes Universal Declarative Operator (KUDO)"
url="https://github.com/kudobuilder/$_pkgname"
license=('Apache-2.0')
arch=('x86_64')
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_${pkgver}_linux_x86_64.tar.gz")
sha512sums=('2c21050c660ed84bb2b176ae09805c9d6aff94bece30c97f769d46bc31ac6cf67a3b294ecd7d6cbf538a5a0c3805f4b0cec14633f876697dd20bf7f05104ee3e')
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
  install -D -m 0755 $srcdir/kubectl-$_pkgname $pkgdir/usr/bin/kubectl-$_pkgname
}

#vim: syntax=sh
