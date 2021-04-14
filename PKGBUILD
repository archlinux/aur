# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=kube-hunter
pkgname=$_pkgname-bin
pkgver=0.4.0
pkgrel=0
pkgdesc="Hunt for security weaknesses in Kubernetes clusters"
url="https://github.com/aquasecurity/$_pkgname"
license=('APACHE')
source=("$_pkgname-$pkgver::$url/releases/download/v$pkgver/${_pkgname}")
arch=('x86_64')
sha512sums=('918303c85cfe56db25a2b808fb6bb028494571fa9406f04c4639e81d3630d2a52eef107298e3eb744ba12c0b7f992182c82fba82a936c72c1f35b98b6b03c051')
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
  install -D -m 0755 $srcdir/$_pkgname-$pkgver $pkgdir/usr/bin/$_pkgname
}

#vim: syntax=sh
