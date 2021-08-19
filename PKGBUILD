# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=kube-hunter
pkgname=$_pkgname-bin
pkgver=0.6.1
pkgrel=0
pkgdesc="Hunt for security weaknesses in Kubernetes clusters"
url="https://github.com/aquasecurity/$_pkgname"
license=('APACHE')
source=("$_pkgname-$pkgver::$url/releases/download/v$pkgver/${_pkgname}-linux-x86_64-refs.tags.v$pkgver")
arch=('x86_64')
sha512sums=('8ecccea0d03280d05c897b7dd41e2a3328116a5c2cf5e21bec27f96936082dbbef5d9fd683d4e3fa46ea7c77d93404945613712aa4bec0981bb80508a93aa82c')
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
  install -D -m 0755 $srcdir/$_pkgname-$pkgver $pkgdir/usr/bin/$_pkgname
}

#vim: syntax=sh
